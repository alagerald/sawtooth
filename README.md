#################### README ###########################
This is an utility to facilitate sawtooth-lake package building within vagrant and sawtooth-lake installation on linux

Background:
If you try hyperledger/sawtooth-lake, and follow the admin instruction on https://intelledger.github.io/sysadmin_guide/installation_ubuntu.html#
You will get ERROR, it would not run.
I tried and wrote two scripts to facilitate the 1) sawtooth-lake package building within vagrant and 2) installation on linux out of vagrant.

Utility Installation Step:
1) cd YOUR_BUILD_HOME
2) git clone https://github.com/alagerald/sawtooth.git
3) cd sawtooth
4) git clone https://github.com/IntelLedger/sawtooth-core.git

Then, you can run the scripts below.
1) Building Package Script. Note that it will need vagrant running and run vagrant-build-package.sh within the vagrant environment:

   Prerequisiites: 
   1) Ubuntu 14.04 LTS with Internet access
   2) git Repository: sawtooth-core
   3) vagrant (1.7.4 or later)
   4) VirtualBox (5.0.10 r104061 or later)

   Build Package:
   % vagrant init ubuntu/trusty64
   % cd sawtooth-core/tools
   % vagrant up
   % vagrant ssh
   % ./vagrant-build-package.sh

2) Installation package on Linux box:
   Installation on ubuntu:
   % ./install_ubuntu.sh

3) Finally, valdiate the installation:
   To start the validator:
	root@ubuntu # start sawtooth-validator
   To stop the validator:
	root@ubuntu # stop sawtooth-validator

   If there is error to start sawtooth-validator, check log files:
   "The primary directory for log files is /var/log/sawtooth-validator. In addition, Upstart captures stdout and stderr and redirects them to /var/log/upstart/sawtooth-validator.log."


