Vagrant.configure("2") do |config|
  config.vm.box = "junaidsh/centos-6.8-x86_64"
  config.vm.box_url = "https://atlas.hashicorp.com/junaidsh/boxes/centos-6.8-x86_64"
  config.vm.synced_folder "..", "/vagrant", :owner => "vagrant"
  config.vm.provision "chef_solo" do |chef|
   chef.node_name = "kmklabsnode01"
   chef.add_recipe "git"
   chef.add_recipe "kmklabapp"
   chef.add_recipe "cronjobs"
   chef.add_recipe "logrotate"
    chef.json = {
      :cronjobs => {
        :servicecheck => {
         :hour => "*",
         :minute => "*/1",
         :user => "kmklab",
         :command => "/home/kmklab/script.sh > /tmp/app.py_status_log 2>&1"
       }
     },
     :apache => {
      :listen => [ "10.10.10.20:80" ]
    },
     :kmklabapp => {
       :config => {           
         :user => "kmklab",
         :home_dir => "/home/kmklab",
         :app_dir => "/webapps",
         :clone_dir => "/webapps/kmk",
         :app_script => "/webapps/kmk/app.py",
         :git_url => "https://github.com/KMK-ONLINE/devops-coding-challenge.git",
         :git_reference => "master",
         :script_name => "app.py",
         :service_check_script => "/home/kmklab/script.sh",
         :server_ip => "10.10.10.20",
         :server_name => "devops.kmklabs.dev",
         :app_default_port => "5000",
         :apache_log_location => "/var/log/httpd/devops.kmklabs.dev.log",
         :app_cron_log => "/tmp/app.py_status_log",
         :time_zone => "/usr/share/zoneinfo/UTC"
     },
      :dependencies => {
        :packages => [ "Flask", "Werkzeug" ]
      }
    } 
  } 
  end
  config.vm.network "private_network", ip: "10.10.10.20"
  config.vm.provider "virtualbox" do |vb|
   vb.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
  end
end
