#
# Cookbook Name:: phpversion
# Resource:: phpversion_switch
#
# Copyright (C) 2013 Gábor Egyed
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#

actions :switch
default_action :switch

attribute :version,        :kind_of => [String, NilClass], :name_attribute => true
