#!/bin/bash
sudo cp sources.list /etc/apt/
sudo apt-get -y update && \
sudo apt-get -y install \
     python-twisted \
     python-twisted-web \
     python-dev \
     python-setuptools \
     g++ \
     swig \
     libjson0 \
     libjson0-dev \
     libcrypto++-dev \
     git \
     python-all-dev \
     python-stdeb

export LC_ALL="C"
rm -rf $HOME/packages
mkdir -p $HOME/packages

## build cbor ###
mkdir $HOME/projects
cd $HOME/projects
wget https://pypi.python.org/packages/source/c/cbor/cbor-0.1.24.tar.gz
tar xvfz cbor-0.1.24.tar.gz
cd cbor-0.1.24
python setup.py --command-packages=stdeb.command bdist_deb
cp deb_dist/python-cbor*.deb $HOME/packages/

## build colorlog ###
cd $HOME/projects
wget https://pypi.python.org/packages/source/c/colorlog/colorlog-2.6.0.tar.gz
tar xvfz colorlog-2.6.0.tar.gz
cd colorlog-2.6.0
python setup.py --command-packages=stdeb.command bdist_deb
cp deb_dist/python-colorlog*.deb $HOME/packages/

## bitcointools
#cd $HOME/projects
#git clone https://github.com/vbuterin/pybitcointools.git
#
#cd $HOME/projects/pybitcointools
#python setup.py --command-packages=stdeb.command bdist_deb
#cp deb_dist/python-bitcoin*.deb $HOME/packages/

#cd $HOME/projects
#wget "https://pypi.python.org/packages/01/fb/bf5299620e40563daabdece86fdad2173275802c63eb8205b5159e7918e8/pybitcointools-1.1.15.tar.gz#md5=7439cd762f4441b5978b3554cc948b90"
#tar xvfz pybitcointools-1.1.15.tar.gz
#cd pybitcointools-1.1.15
#python setup.py --command-packages=stdeb.command bdist_deb
#cp deb_dist/python-pybitcointools*.deb $HOME/packages/

cd $HOME/projects
wget https://pypi.python.org/packages/source/p/pybitcointools/pybitcointools-1.1.15.tar.gz
tar xvfz pybitcointools-1.1.15.tar.gz
cd pybitcointools-1.1.15
python setup.py --command-packages=stdeb.command bdist_deb
cp deb_dist/python-pybitcointools*.deb $HOME/packages/

## clone sawtooth-lake ###
cd $HOME/projects
git clone https://github.com/IntelLedger/sawtooth-core.git

## create sawtooth-lake package ###
cd $HOME/projects/sawtooth-core/core
python setup.py --command-packages=stdeb.command bdist_deb
cp deb_dist/python-sawtooth-core*.deb $HOME/packages/

cd $HOME
rm -rf sawtoothlake-0.7.1-ubuntu-packages
mv packages sawtoothlake-0.7.1-ubuntu-packages
tar cvfj sawtoothlake-0.7.1-ubuntu-packages.tar.bz2 sawtoothlake-0.7.1-ubuntu-packages

cp sawtoothlake-0.7.1-ubuntu-packages.tar.bz2 /project
rm -rf /project/sawtoothlake-0.7.1-ubuntu-packages
cp -r $HOME/sawtoothlake-0.7.1-ubuntu-packages /project

