#!/bin/bash
sudo sed -i s#Defaults.*requiretty#Defaults\ \!requiretty#g /etc/sudoers
sudo yum -y makecache fast
sudo yum -y install wget
cd /tmp/
echo "Downloading the rpm"
wget  http://52.43.11.64/chef-13.2.20-1.el6.x86_64.rpm

echo "Installating the rpm"

sudo rpm -ivh *.rpm

sudo mkdir -p /etc/chef
sudo chmod -R 777 /etc/chef
cd /etc/chef

sudo curl -o /etc/chef/client.rb  http://52.43.11.64//client.rb
#wget http://52.43.11.64/knife.rb
sudo curl -o /etc/chef/sandykarhty20.pem  http://52.43.11.64/sandykarhty20.pem
sudo chmod 400 /etc/chef/sandykarhty20.pem
sudo chef-client
