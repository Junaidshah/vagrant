# vagrant
Junaid Shah's vagrant project for Kmklabs. 

Steps to setup the application.    
1)cd to the cloned repo vagrant.  
2)Run "vagrant init junaidsh/centos-6.8-x86_64".  
3)Run "rm -f Vagrantfile".  
4)Run "mv Vagrantfile-Replace Vagrantfile".  
5)Run "vagrant up".  

NOTES: Once the vagrant up command has been run it sometimes takes about a minute or so for the apache process to start spawning. So if you get an apache under maintenance message while trying the curl command immdeiately after the vagrant up command please give it a few more seconds. Same goes for the restart of the application during a crash. An apache restart after the application start would solve this,however I'm not a big fan of restarting apache processes very often because on very big production applications this will definitely not be desired. If an application is having problems like leaking memory we should rather spend time on fixing the application. I am however in full support of proactive apache restarts as it allows us to know that the configuration is fine and restarts do not cause any problems. 

