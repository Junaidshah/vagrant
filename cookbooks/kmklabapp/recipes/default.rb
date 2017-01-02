#
# Cookbook Name:: kmklabapp
# Recipe:: default
#
# Copyright 2016, KMKLABS
#
# All rights reserved - Do Not Redistribute
#

#Set the timezone to UTC
execute 'unlink /etc/localtime' do
     cwd Chef::Config[:file_cache_path]
     command 'unlink /etc/localtime'
     not_if { File.symlink?('/etc/localtime') }
end

link node['kmklabapp']['config']['time_zone'] do
  to '/etc/localtime'
end


#Including the recipes that this recipe would need to include to get python, python pip installed. I have also included an apache recipe which will help us proxy the application to port 80.
include_recipe 'python'
include_recipe "python::pip"
include_recipe "kmklabapp::apache"

#Install the dependencies of the application app.py.
if !node['kmklabapp']['dependencies']['packages'].nil?
  node['kmklabapp']['dependencies']['packages'].each do |pip_packages| 
      python_pip pip_packages do
        action :install
    end
  end
end

#create a user kmklab under whom we will setup the app. 
user node['kmklabapp']['config']['user'] do
 action :create
end

#create a home directory for the kmklab user
#directory "/home/kmklab" do
directory node['kmklabapp']['config']['home_dir'] do
owner node['kmklabapp']['config']['user']
group node['kmklabapp']['config']['user']
mode "0750"
action :create
end

#Create the directory where the application will be residing.
directory node['kmklabapp']['config']['app_dir'] do
owner node['kmklabapp']['config']['user']
group node['kmklabapp']['config']['user']
mode "0750"
action :create
end

#Clone the app from a git repo under /webapps/kmk
git node['kmklabapp']['config']['clone_dir'] do
  repository node['kmklabapp']['config']['git_url']
  reference node['kmklabapp']['config']['git_reference']
  user node['kmklabapp']['config']['user']
  group node['kmklabapp']['config']['user']
  action :sync
end

#Block of code that will help run the application app.py.
script 'Run the application' do
  interpreter 'bash'
  user node['kmklabapp']['config']['user']
  cwd node['kmklabapp']['config']['clone_dir']
  code <<-EOH
  ./node['kmklabapp']['config']['script_name'] &
  EOH
end

#Setup a script that will help us monitor the status of the app and restart it if its killed or not running.
template node['kmklabapp']['config']['service_check_script'] do
  source "script.sh.erb"
  owner node['kmklabapp']['config']['user']
  group node['kmklabapp']['config']['user']
  mode  0755
end
