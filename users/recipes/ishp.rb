require 'chef/data_bag'

unless Chef::DataBag.list.key?('userlist1')
  new_databag = Chef::DataBag.new
  new_databag.name('userlist1')
  new_databag.save
end

testuser2 = {
   "id":"testuser2",
   "password":"$1$5cE1rI/9$4p0fomh9U4kAI23qUlZVv/",
   "ssh_keys":[
      "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAklOUpkDHrfHY17SbrmTIpNLTGK9Tjom/BWDSU\nGPl+nafzlHDTYW7hdI4yZ5ew18JH4JW9jbhUFrviQzM7xlELEVf4h9lFX5QVkbPppSwg0cda3\nPbv7kOdJ/MTyBlWXFCR+HAo3FXRitBqxiX1nKhXpHAZsMciLq8V6RjsNAQwdsdMFvSlVK/7XA\nt3FaoJoAsncM1Q9x5+3V0Ww68/eIFmb1zuUFljQJKprrX88XypNDvjYNby6vw/Pb0rwert/En\nmZ+AW4OZPnTPI89ZPmVMLuayrD2cE86Z/il8b+gw3r3+1nKatmIkjn2so1d01QraTlMqVSsbx\nNrRFi9wrf+M7Q== chefuser@mylaptop.local"
   ],
   "groups":[
      "testgroup"
   ],
   "uid":9002,
   "shell":"\/bin\/bash",
   "comment":"Test User"
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