#
# Cookbook Name:: phpversion
# Recipe:: base
#
# Copyright (C) 2013 Gábor Egyed
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#

# install required packages
node[:phpversion][:packages].each do |pkg|
  package "phpversion-#{pkg}" do
    package_name pkg
  end
end

# install the latest git
apt_repository "git" do
  uri "http://ppa.launchpad.net/git-core/ppa/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "E1DF1F24"
end

package "phpversion-git" do
  package_name "git"
  action :upgrade
end
