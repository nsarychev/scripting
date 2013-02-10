#!/bin/sh

head -n 100 /dev/urandom | md5sum | tr -d " -" > ~/.pia_client_id

ifconfig tun0|grep -oE "inet addr: *10\.[0-9]+\.[0-9]+\.[0-9]+"|tr -d "a-z :"|tee ~/vpn_ip;

curl -d "user=username&pass=password&client_id=$(cat ~/.pia_client_id)&local_ip=$(cat ~/vpn_ip)" https://www.privateinternetaccess.com/vpninfo/port_forward_assignment
