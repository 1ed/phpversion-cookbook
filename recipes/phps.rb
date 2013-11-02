#
# Cookbook Name:: phpversion
# Recipe:: phps
#
# Copyright (C) 2013 Gábor Egyed
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#

Array(node[:phpversion][:phps]).each do |version, php|

  extensions = php[:extensions] || []
  target_dir = "#{node[:phpversion][:versions_dir]}/#{version}"
  php_source_dir = "#{node[:phpversion][:sources_dir]}/#{version}"
  bin_dir = "#{node[:phpversion][:bin_dir]}"
  configure_options = php[:configure_options]

  # create diretories
  directory php_source_dir do
    owner node[:phpversion][:user]
    group node[:phpversion][:group]
    mode 00755
    recursive true
    action :create
  end

  directory bin_dir do
    owner node[:phpversion][:user]
    group node[:phpversion][:group]
    mode 00755
    recursive true
    action :create
  end

  snap_version = version.slice(/^\d+.\d+/)

  # download php source
  remote_file "#{Chef::Config[:file_cache_path]}/php-#{version}" do
    source php[:url]
    mode 00644
    notifies :run, "bash[phpversion-build-php-#{version}]", :immediately
    not_if { File.exists?("#{php_source_dir}/.built") }
  end

  # build
  bash "phpversion-build-php-#{version}" do
    cwd php_source_dir
    user node[:phpversion][:user]
    group node[:phpversion][:group]
    environment php[:env] if php[:env]
    code <<-EOF
      rm -rf * .* #{target_dir} &> /dev/null
      tar xf #{Chef::Config[:file_cache_path]}/php-#{version} --strip=1 && \
      PREFIX="#{target_dir}"
      mkdir -p $PREFIX/etc/conf.d $PREFIX/libexec
      ./configure --prefix="$PREFIX" --with-config-file-path="$PREFIX/etc" --with-config-file-scan-dir="$PREFIX/etc/conf.d" --libexecdir="$PREFIX/libexec" #{configure_options} &> .log-configure && \
      sed -i 's%\$(INSTALL_ROOT)/usr/lib/apache2/modules%#{target_dir}/libexec%g' Makefile
      make &> .log-make && make install &> .log-make-install && cp php.ini-production "$PREFIX/etc/php.ini" && date -R > .built
    EOF
    notifies :create, "link[#{bin_dir}/php-#{version}]", :immediately
    notifies :run, "bash[#{bin_dir}/php-#{snap_version}]", :immediately
    only_if { File.exists?("#{Chef::Config[:file_cache_path]}/php-#{version}") }
    not_if { File.exists?("#{php_source_dir}/.built") }
  end

  # link php cli
  link "#{bin_dir}/php-#{version}" do
    to "#{target_dir}/bin/php"
    owner node[:phpversion][:user]
    group node[:phpversion][:group]
    action :nothing
    only_if { File.exists?("#{php_source_dir}/.built") }
  end

  bash "#{bin_dir}/php-#{snap_version}" do
    cwd bin_dir
    user node[:phpversion][:user]
    group node[:phpversion][:group]
    code <<-EOH
    _BIN_DIR="#{bin_dir}"
    _PHP_VERSIONS="#{node[:phpversion][:versions_dir]}"
    _TARGET_VERSION="#{snap_version}"

    _LAST_VERSION="$(find $_PHP_VERSIONS -maxdepth 1 -mindepth 1 -type d -exec basename {} \\; 2>/dev/null | sort -r -t . -k 1,1n -k 2,2n -k 3,3n | grep ^$_TARGET_VERSION 2>/dev/null | tail -1)"
    _TARGET="$_PHP_VERSIONS/$_LAST_VERSION/bin/php"

    if [[ -n "$_LAST_VERSION" && -e $_TARGET ]]; then
      mkdir -p $_BIN_DIR
      ln -nfs $_TARGET $_BIN_DIR/php-$_TARGET_VERSION
    fi
    EOH
    action :nothing
    only_if { snap_version }
  end

  if configure_options.include? "--enable-fpm"
    phpversion_fpm_service version
  end

  versions = Dir.chdir (node[:phpversion][:versions_dir]) do
    d = Dir.glob('*').select {|f| File.directory? f}
    d.sort_by do |s|
      t =  s.scan(/\d+/).last(3).map(&:to_i)
      [t[0], t[1], t[2]]
    end
  end if File.exists?(node[:phpversion][:versions_dir])

  ruby_block "php-config-#{version}" do
    block do
      version = self.block_name.slice(/\d+.\d+.\d+.*?/)
      node.set[:php][:conf_dir] = "#{node[:phpversion][:versions_dir]}/#{version}/etc"
      node.set[:php][:ext_conf_dir] = "#{node[:phpversion][:versions_dir]}/#{version}/etc/conf.d"
    end
  end

  phpversion_switch version

  # install extensions
  extensions.each do |extension|
    if extension.is_a?(Hash)
      php_pear "php-#{version}-#{extension['name']}" do
        package_name    extension['name']
        version         extension['version']         if extension['version']
        channel         extension['channel']         if extension['channel']
        options         extension['options']         if extension['options']
        directives      extension['directives']      if extension['directives']
        zend_extensions extension['zend_extensions'] if extension['zend_extensions']
        preferred_state extension['preferred_state'] if extension['preferred_state']
        action          extension['action']          if extension['action']
#        notifies :restart, "service[apache2]"        if configure_options.include? "--with-apxs"
      end
    else
      php_pear "php-#{version}-#{extension}" do
        package_name extension
      end
    end
  end
end

phpversion_switch nil
