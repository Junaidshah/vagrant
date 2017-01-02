include_recipe "apache2"
include_recipe 'apache2::mod_proxy'
include_recipe 'apache2::mod_proxy_http'

web_app "kmklabsnode01" do
  template 'kmklabsnode01.cfg.erb'
end

service "httpd" do
  supports :restart => true, :start => true, :stop => true
  action :enable
end
