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



lvm_volume_group 'vgdata' do
  physical_volumes ['/dev/xvdi']
end

lvm_logical_volume 'lvswap' do
  group 'vgdata'
  size '8G'
end

lvm_logical_volume 'lvdata' do
  group 'vgdata'
  size '30%VG'
  filesystem 'ext3'
  mount_point '/data'
end

lvm_logical_volume 'lvtmp' do
  group 'vgdata'
  size '5%VG'
  filesystem 'ext3'
  mount_point '/tmp'
end



#lvm_logical_volume 'lvhome' do
#  group 'vgdata'
#  size '15%VG'
#  filesystem 'ext3'
#  mount_point '/home'
#end
