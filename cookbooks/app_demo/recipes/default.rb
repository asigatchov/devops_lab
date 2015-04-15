#
# Cookbook Name:: app_demo
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


sysctl_param 'fs.file-max' do
	value node['app-demo']['max-files']
end

package "nginx" do
  action :install
end

service "nginx" do
  action [:enable, :start]
end

template "/usr/share/nginx/www/index.html" do
	source "index.html.erb"
	variables(
		food: node['app-demo']['food'],
		countries: data_bag('countries')
	)
end


data_bag('countries').each do |country|
	template "/usr/share/nginx/www/#{country}.html" do
		source "country.html.erb"
		variables(
			country: country,
			cities: data_bag_item('countries', country)['cities']
		)
	end
end


