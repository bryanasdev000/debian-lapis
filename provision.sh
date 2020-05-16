#!/bin/env bash

apt-get -y install --no-install-recommends wget gnupg ca-certificates
wget -O - https://openresty.org/package/pubkey.gpg | apt-key add -
codename=`grep -Po 'VERSION="[0-9]+ \(\K[^)]+' /etc/os-release`
echo "deb http://openresty.org/package/debian $codename openresty" > /etc/apt/sources.list.d/openresty.list
apt-get update
apt-get -y install vim git lua51 luarocks openresty libssl-dev

luarocks install lapis
