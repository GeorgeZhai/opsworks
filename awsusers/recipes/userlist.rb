include_recipe "users"

require 'chef/data_bag'

unless Chef::DataBag.list.key?('userlist')
  new_databag = Chef::DataBag.new
  new_databag.name('userlist')
  new_databag.save
end



gzhai1 = {
   'id' => 'gzhai1',
   'password' => '$1$KONE7isU$HQiCaYsPnU6hsuCSS9Zco/',
   'ssh_keys' =>[
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDhOrBIOQF0Vtg/eLxBAwetDHLx9AezSBjfhsby2lEUVxoUrnjmD12XMB3R07KVkyFtssccq4bTZ7Yb9eH34T20CbaQT0MIWDUFw0Zm5xRVXCy9XiblYbZBKWuXHhW4tKKYvDT5Hxb+ubR2rhPlSRUD9faD0YhzJMJiV4vUvCpwxEUyy2ekNtThaScHdGtstG0c78M2r6P7y+5ayNzdd/Z7isMrZVRW8t5BagXSE5pxVYmTK5stL+9QhXKgbgvIcb1MAovdARGd0SU/2F2q/UvErGQm1FPrKqFDfEb8TGRT3d7H73hDFAEW1xxKYlA1QqN/YR0cblW9i9rE6kDGeHc/ OpenShift-Key'
   ],
   'groups' =>[
      'sysadmin',
      'esb',      
   ],
   'uid' => 9002,
   'shell' => '/bin/bash',
   'comment' => 'gzhai1'
}



databag_item = Chef::DataBagItem.new
databag_item.data_bag('userlist')
databag_item.raw_data = gzhai1
databag_item.save


users_manage 'sysadmin' do
  group_id 2300
  action [:remove, :create]
  data_bag 'userlist'
end

users_manage 'esb' do
  group_id 3001
  action [:remove, :create]
  data_bag 'userlist'
end