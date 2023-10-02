#!/bin/bash

set -e -o pipefail
set -x

apt-get update
apt-get install -yqq openvpn openssl build-essential make net-tools
apt-get remove -yqq command-not-found

cat /vagrant/hosts >> /etc/hosts

cd /vagrant/tls
make 
mkdir /etc/openvpn-server
cp rootCA.* server.crt server.key dh.pem /etc/openvpn-server
cp /vagrant/openvpn/server.ovpn /etc/openvpn-server
cp /vagrant/openvpn/openvpn-server.service /etc/systemd/system
cp /vagrant/openvpn/run-openvpn-server.sh /etc/openvpn-server
systemctl enable openvpn-server
service openvpn-server start
cp -fdR /vagrant/newuser /home
useradd -d /home/newuser -s /bin/rbash -M newuser
chown -R newuser.newuser /home/newuser
echo 'newuser ALL=NOPASSWD:/home/newuser/genkey.root' >> /etc/sudoers
