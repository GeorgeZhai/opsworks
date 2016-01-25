#
# Cookbook Name:: awsusers
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "users"


# Sample of execute a command
#execute "touch file" do
#  command "touch /data/hahaha.txt"
#end

# Sample of install a software package
#package 'nginx' do
#  action :install
#end

# Sample of manage a service

#service 'nginx' do
#  action [ :enable, :start ]
#end

# Sample of manage a file

#cookbook_file "/usr/share/nginx/html/index.html" do
#  source "index.html"
#  mode "0644"
#end
