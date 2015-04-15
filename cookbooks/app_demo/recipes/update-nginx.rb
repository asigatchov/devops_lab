%w{ nginx nginx-core nginx-common }.each do |pkg|
  package pkg do
    action :remove
  end
end

#install new one
ENV['DEBIAN_FRONTEND'] = 'noninteractive'
package "nginx" do
  options '--force-yes'
  options '-o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'
  action :install
end

  `hostname`
#command "killall -9 nginx" 
