#!/bin/bash
sudo sed -i s#Defaults.*requiretty#Defaults\ \!requiretty#g /etc/sudoers
sudo yum -y makecache fast
sudo yum -y install wget
cd /tmp/
echo "Downloading the rpm"
wget  http://18.220.166.106/chef-13.2.20-1.el7.x86_64.rpm

echo "Installating the rpm"

sudo rpm -ivh *.rpm

sudo mkdir -p /etc/chef
sudo chmod -R 777 /etc/chef
cd /etc/chef
echo "COMPONENT=::COMPONENT::">envdata
echo "ENVIRONMENT=::ENVIRONMENT::">>envdata
sudo curl -o /etc/chef/client.rb  http://18.220.166.106//client.rb
#wget http://52.43.11.64/knife.rb
sudo curl -o /etc/chef/daksh_eada.pem  http://18.220.166.106/daksh_eada.pem
sudo chmod 400 /etc/chef/daksh_eada.pem
sudo chef-client
