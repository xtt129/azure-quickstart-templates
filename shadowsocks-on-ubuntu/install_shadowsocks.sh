#!/bin/bash
sudo -s

sudo apt-get -y update

# install pip
sudo apt-get -y install python-pip python-dev

# install Shadowsocks
pip install shadowsocks 

# set configuration
config="/etc/shadowsocks.json"
sudo echo "{"                                     >>  $config
sudo echo "    \"server\":\"0.0.0.0\","           >>  $config
sudo echo "    \"server_port\":8989,"             >>  $config
sudo echo "    \"local_address\":\"127.0.0.1\","  >>  $config
sudo echo "    \"local_port\":1080,"              >>  $config
sudo echo "    \"password\":\"p@ssword1\","      >>  $config
sudo echo "    \"timeout\":300,"                  >>  $config
sudo echo "    \"method\":\"aes-256-cfb\","       >>  $config
sudo echo "    \"fast_open\": false"              >>  $config
sudo echo "}"                                     >>  $config

# restart Apache
nohup ssserver -c /etc/shadowsocks.json > log &
sudo echo "/usr/local/bin/ssserver -c /etc/shadowsocks.json" >> /etc/rc.local