item = Chef::DataBagItem.new
item.data_bag('userlist1')
item['id'] = 'test_user1'
item['password'] = '$1$5cE1rI/9$4p0fomh9U4kAI23qUlZVv/'
item['uid'] = '9002'



users_manage 'ishp' do
  group_id 3000
  action [:remove, :create]
  data_bag 'userlist1'
end