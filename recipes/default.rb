#
# Cookbook Name:: phpversion
# Recipe:: default
#
# Copyright (C) 2013 Gábor Egyed
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#

include_recipe "phpversion::base"
include_recipe "phpversion::install"
include_recipe "phpversion::phps"
