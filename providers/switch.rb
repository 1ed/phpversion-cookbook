#
# Cookbook Name:: phpversion
# Provider:: phpversion_switch
#
# Copyright (C) 2013 Gábor Egyed
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#

def whyrun_supported?
  false
end

action :switch do
  version = @new_resource.version
  base_dir = node[:phpversion][:versions_dir]
  path_regexp = /#{Regexp.escape(base_dir)}.*?:/
  target_dir = "#{base_dir}/#{version}"

  if version.nil?
    ENV.delete('PHP_VERSIONS')
    ENV.delete('PHPRC')
    ENV['PATH'] = ENV['PATH'].gsub(path_regexp, '')

    Chef::Log.info("php-version switched off")
  elsif ::File.exists?("#{target_dir}/bin")
    ENV['PHP_VERSIONS'] = base_dir
    ENV['PHPRC'] = "#{target_dir}/etc/php.ini" if ::File.exists?("#{target_dir}/etc/php.ini")

    path = ENV['PATH'].gsub(path_regexp, '')
    path = "#{target_dir}/bin:#{path}"
    path = "#{target_dir}/sbin:#{path}" if ::File.exists?("#{target_dir}/sbin")

    ENV['PATH'] = path

    Chef::Log.info("php-version: switched PHP to #{version}")
  else
    Chef::Log.warn("#{target_dir} directory was not found (action skipped).")
  end
end
