#
# Cookbook Name:: xm-demo-cookbook
# Recipe:: baseos
#
# Copyright (C) 2013 10th Magnitude
# 
# All rights reserved - Do Not Redistribute
#

# Make sure file services are installed. They should be there by default, but we make sure they haven't been removed

windows_feature 'CoreFileServer' do
  action :install
  notifies :request, 'windows_reboot[15]'
end

# install SNMP

windows_feature 'SNMP' do
  action :install
  notifies :request, 'windows_reboot[15]'
end

# Reboot handler. Lets us reboot when we need to.

windows_reboot 15 do
  reason 'snmp installation'
  action :nothing
end