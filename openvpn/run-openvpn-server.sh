#!/bin/sh

echo 1 > /proc/sys/net/ipv4/ip_forward
cd /etc/openvpn-server
exec openvpn server.ovpn
