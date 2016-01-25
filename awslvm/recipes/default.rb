#
# Cookbook Name:: awslvm
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "lvm::default"



Chef::Log.info "start umount /data ...."


# umount /data first
execute "umount /data" do
  command "umount /data >>/dev/null 2>&1"
  ignore_failure true
end

Chef::Log.info "finished umount /data ...."


lvm_physical_volume '/dev/xvdi' do
    wipe_signatures true
  end



lvm_volume_group 'vg-data' do
  physical_volumes ['/dev/xvdi']
end

lvm_logical_volume 'lv-data' do
  group 'vg-data'
  size '50%VG'
  filesystem 'ext3'
  mount_point '/data'
end