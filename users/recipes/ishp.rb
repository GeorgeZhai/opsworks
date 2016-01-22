require 'chef/data_bag'

unless Chef::DataBag.list.key?('userlist1')
  new_databag = Chef::DataBag.new
  new_databag.name('userlist1')
  new_databag.save
end



testuser2 = {
   'id' => 'testuser2',
   'password' => '$1$5cE1rI/9$4p0fomh9U4kAI23qUlZVv/',
   'ssh_keys' =>[
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDhOrBIOQF0Vtg/eLxBAwetDHLx9AezSBjfhsby2lEUVxoUrnjmD12XMB3R07KVkyFtssccq4bTZ7Yb9eH34T20CbaQT0MIWDUFw0Zm5xRVXCy9XiblYbZBKWuXHhW4tKKYvDT5Hxb+ubR2rhPlSRUD9faD0YhzJMJiV4vUvCpwxEUyy2ekNtThaScHdGtstG0c78M2r6P7y+5ayNzdd/Z7isMrZVRW8t5BagXSE5pxVYmTK5stL+9QhXKgbgvIcb1MAovdARGd0SU/2F2q/UvErGQm1FPrKqFDfEb8TGRT3d7H73hDFAEW1xxKYlA1QqN/YR0cblW9i9rE6kDGeHc/ OpenShift-Key'
   ],
   'groups' =>[
      'ishp'
   ],
   'uid' => 9002,
   'shell' => '/bin/bash',
   'comment' => 'Test User'
}



databag_item = Chef::DataBagItem.new
databag_item.data_bag('userlist1')
databag_item.raw_data = testuser2
databag_item.save



unless Chef::DataBag.list.key?('users')
  new_databag = Chef::DataBag.new
  new_databag.name('users')
  new_databag.save
end



testuser3 = {
   'id' => 'testuser3',
   'password' => '$1$5cE1rI/9$4p0fomh9U4kAI23qUlZVv/',
   'ssh_keys' =>[
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDhOrBIOQF0Vtg/eLxBAwetDHLx9AezSBjfhsby2lEUVxoUrnjmD12XMB3R07KVkyFtssccq4bTZ7Yb9eH34T20CbaQT0MIWDUFw0Zm5xRVXCy9XiblYbZBKWuXHhW4tKKYvDT5Hxb+ubR2rhPlSRUD9faD0YhzJMJiV4vUvCpwxEUyy2ekNtThaScHdGtstG0c78M2r6P7y+5ayNzdd/Z7isMrZVRW8t5BagXSE5pxVYmTK5stL+9QhXKgbgvIcb1MAovdARGd0SU/2F2q/UvErGQm1FPrKqFDfEb8TGRT3d7H73hDFAEW1xxKYlA1QqN/YR0cblW9i9rE6kDGeHc/ OpenShift-Key'
   ],
   'groups' =>[
      'sysadmin'
   ],
   'uid' => 9003,
   'shell' => '/bin/bash',
   'comment' => 'sys admin test'
}



databag_item = Chef::DataBagItem.new
databag_item.data_bag('userlist1')
databag_item.raw_data = testuser2
databag_item.save


users_manage 'ishp' do
  group_id 3000
  action [:remove, :create]
  data_bag 'userlist1'
end