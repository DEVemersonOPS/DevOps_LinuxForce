#!/bin/bash


echo "nameserver 8.8.8.8" > /etc/resolv.conf

apt update
apt -y install vim
