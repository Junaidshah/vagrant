# vagrant
Junaid Shah's vagrant project for Kmklabs. 

Steps to setup the application.    
1)cd to the cloned repo vagrant.  
2)Run "vagrant init junaidsh/centos-6.8-x86_64".  
3)Run "rm -f Vagrantfile".  
4)Run "mv Vagrantfile-Replace Vagrantfile".  
5)Run "vagrant up".  

NOTES: Once the vagrant up command has been run it sometimes takes about a minute or so for the apache process to start spawning. So if you get an apache under maintenance message while trying the curl command immdeiately after the vagrant up command please give it a few more seconds. Same goes for the restart of the application during a crash. 
