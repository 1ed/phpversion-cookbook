#
# Cookbook Name:: phpversion
# Provider:: phpversion_script
#
# Copyright (C) 2013 Gábor Egyed
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#

use_inline_resources

def whyrun_supported?
  true
end

action :run do
  script_code         = build_script_code

  # the converge_by method is not required because it is already built into all of the Chef resources
  script new_resource.name do
    interpreter   "bash"
    code          script_code
    user          new_resource.user         if new_resource.user
    creates       new_resource.creates      if new_resource.creates
    cwd           new_resource.cwd          if new_resource.cwd
    group         new_resource.group        if new_resource.group
    path          new_resource.path         if new_resource.path
    returns       new_resource.returns      if new_resource.returns
    timeout       new_resource.timeout      if new_resource.timeout
    umask         new_resource.umask        if new_resource.umask
    environment   new_resource.environment  if new_resource.environment
  end
end

private

def build_script_code
  script = []
  script << %{export PHP_VERSIONS=#{node[:phpenv_version][:versions_dir]}"}
  script << %{source #{node[:php_version][:install_dir]}/php-version.sh && php-version #{new_resource.php_version} >/dev/null"}
  script << new_resource.code
  script.join("\n")
end
