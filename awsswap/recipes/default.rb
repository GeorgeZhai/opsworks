#
# Cookbook Name:: awsswap
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

swap_file '/dev/mapper/vgdata-lvswap' do
  size      4096    # MBs
end