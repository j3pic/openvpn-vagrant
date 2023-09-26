#!/bin/bash

set -e -o pipefail

systemctl disable systemd-resolved
service systemd-resolved stop
rm -f /lib/systemd/systemd-resolved # Without doing this, it'll come back.
rm -f /etc/resolv.conf
# cat > /run/systemd/resolve/resolv.conf << EOT
cat > /etc/resolv.conf << EOT
nameserver 8.8.8.8
nameserver 8.8.4.4
EOT

cat /vagrant/hosts >> /etc/hosts

#rm /etc/resolv.conf
#ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
