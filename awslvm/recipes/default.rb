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
  command "umount /data"
end

Chef::Log.info "finished umount /data ...."


lvm_physical_volume '/dev/xvdi' do
    wipe_signatures true
  end

lvm_volume_group 'vg00' do
  physical_volumes ['/dev/xvdi']

  logical_volume 'home' do
    size        '25%VG'
    filesystem  'ext4'
    mount_point '/test'
    stripes     3
    mirrors     2
  end
end

lvm_logical_volume 'home' do
  group       'vg00'
  size        '25%VG'
  filesystem  'ext4'
  mount_point '/test'
  stripes     3
  mirrors     2
end