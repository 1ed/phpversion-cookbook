#
# Cookbook Name:: phpversion
# Definition:: phpversion_fpm_servce
#
# Copyright (C) 2013 Gábor Egyed
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#

define :phpversion_fpm_service, :template => "init.d.php-fpm.erb", :user => "php", :group => "php"  do
  version = params[:name]
  service_name = "php-fpm-#{version}"
  prefix = "#{node[:phpversion][:versions_dir]}/#{version}"

  group params[:group] do
    action :create
  end

  user params[:user] do
    action :create
    comment "php-fpm user"
    gid params[:group]
    system true
    supports :manage_home => false
  end

  service service_name do
    supports :status => true, :restart => true, :reload => true
  end

  template "#{prefix}/etc/php-fpm.conf" do
    source "php-fpm.conf.erb"
    owner "root"
    group "root"
    variables(
      :prefix => prefix,
      :user => params[:user],
      :group => params[:group],
      :listen => "var/run/php-fpm.sock"
    )
    mode 00644
    notifies :restart, resources(:service => service_name), :delayed
  end

  node.normal[:phpversion][:sockets][version] = "#{prefix}/var/run/php-fpm.sock"

  template "/etc/init.d/#{service_name}" do
    source params[:template]
    owner "root"
    group "root"
    mode 0755
    if params[:cookbook]
      cookbook params[:cookbook]
    end
    variables(
      :prefix => prefix,
      :version => version,
      :service_name => service_name,
      :params => params
    )
    not_if { ::File.exists?("/etc/init.d/#{service_name}") }
    notifies :enable, resources(:service => service_name), :delayed
    notifies :restart, resources(:service => service_name), :delayed
  end
end
