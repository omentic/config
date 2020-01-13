#! /bin/bash

# ethernet is wonky due to it only being available through an adapter

ethon=$(nmcli -t | grep enp57s0u1u2:: | awk '{print $2}')
ethIP=$(ip addr show enp57s0u1u2: | grep inet | awk ' { print $2 } ')

if [ "${ethon}" == "connected" ]; then
	(notify-send -u low "Ethernet connected" "IP addresses: $ethIP")
else
	(notify-send -u normal "Network cable unplugged" "Not currently connected to network")
fi
