users_manage 'ishp' do
  group_id 3000
  action [:remove, :create]
  data_bag 'userlist'
end