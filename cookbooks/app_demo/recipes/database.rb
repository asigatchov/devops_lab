mysql2_chef_gem 'default'

mysql_service 'default' do
  port '3306'
  version '5.5'
  initial_root_password Chef::EncryptedDataBagItem.load('passwords', 'mysql')['password']
  action [:create, :start]
end

mysql_database 'wordpress' do
  connection(
    host:     '127.0.0.1',
    port:      3306,
    username: 'root',
    password: Chef::EncryptedDataBagItem.load('passwords', 'mysql')['password']
  )
  action :create
end
