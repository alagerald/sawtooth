#!/bin/bash
sudo apt-get -y update && \
sudo apt-get -y install \
     python-twisted \
     python-twisted-web \
     libjson0 \
     python-enum34 \
     libcrypto++

tar xvfj sawtoothlake-0.7.1-ubuntu-packages.tar.bz2
sudo dpkg -i sawtoothlake-0.7.1-ubuntu-packages/*.deb

sudo apt-get -f -y autoremove 

#configuration
nodename="81med001"
#sawtooth keygen --force ${nodename}
sawtooth keygen ${nodename}
nodekey=`cat $HOME/.sawtooth/keys/${nodename}.wif`
adminkey=`cat $HOME/.sawtooth/keys/${nodename}.addr`
sudo cp $HOME/.sawtooth/keys/${nodename}.* /etc/sawtooth-validator/keys

cp txnvalidator.js.example txnvalidator.js
#replace nodename
arg1="s/base000/${nodename}/g"
sed -i -e $arg1 txnvalidator.js
#replace adminnode
arg2="s/adminkey/${adminkey}/g"
sed -i -e $arg2 txnvalidator.js

sudo mv -f txnvalidator.js /etc/sawtooth-validator/txnvalidator.js 

#start validator
sudo start sawtooth-validator
sleep 15
sudo status sawtooth-validator
# stop sawtooth-validator
# status sawtooth-validator
