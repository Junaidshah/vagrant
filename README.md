# vagrant
Junaid Shah's vagrant project for Kmklabs. 

Steps to setup the application.    
1)cd to the cloned repo vagrant.  
2)Run "vagrant up".  

NOTES: 
Once the vagrant up command has been run it sometimes takes about a minute or so for the apache process to start spawning. So if you get an apache under maintenance message while trying the curl command immdeiately after the vagrant up command please give it a few more seconds. Same goes for the restart of the application during a crash. 

The logrotate is set to rotate the logs every 1 day. Should you need to verify the working you may run "logrotate -f --verbose /etc/logrotate.conf" to force a log rotate. To check the status of logrotate please look into the file "/var/lib/logrotate.status". 
