#
# Cookbook Name:: phpversion
# Recipe:: install
#
# Copyright (C) 2013 Gábor Egyed
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#

git node[:phpversion][:install_dir] do
  repository node[:phpversion][:git_url]
  reference node[:phpversion][:git_ref]
  user node[:phpversion][:user]
  group node[:phpversion][:group]
  action :checkout
end

template "/etc/profile.d/php-version.sh" do
  source "php-version.sh.erb"
  owner "root"
  group "root"
  mode 00644
end
