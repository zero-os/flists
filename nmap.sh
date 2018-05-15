#!/bin/bash
set -ex

apt-get update
apt-get install -y build-essential curl

curl -O https://nmap.org/dist/nmap-7.70.tar.bz2
bzip2 -cd nmap-7.70.tar.bz2 | tar xvf -
cd nmap-7.70
./configure
make

mkdir -p /tmp/archives/
tar cvfz "/tmp/archives/nmap.tar.gz" --transform "s,^,usr/bin/," nmap