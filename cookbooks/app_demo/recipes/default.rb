#
# Cookbook Name:: app_demo
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "nginx" do
  action :install
end

service "nginx" do
  action [:enable, :start]
end

template "/usr/share/nginx/www/index.html" do
	source "index.html.erb"
	variables(
		food: node['app-demo']['food']
	)
end
