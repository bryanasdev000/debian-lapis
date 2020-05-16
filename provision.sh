#!/bin/env bash

apt-get -y install --no-install-recommends wget gnupg ca-certificates
wget -O - https://openresty.org/package/pubkey.gpg | apt-key add -
echo "deb http://openresty.org/package/debian buster openresty" > /etc/apt/sources.list.d/openresty.list
apt-get update
apt-get -y install vim git lua51 luarocks openresty libssl-dev

luarocks install lapis

#  OpenSSL 1.1.1
apt-get install -y build-essential
cd /usr/src
git clone -b OpenSSL_1_1_1-stable https://github.com/openssl/openssl.git
cd openssl
./config
make -j 6
make install
rm /usr/local/openresty/openssl/lib/libcrypto.so.1.1 /usr/local/openresty/openssl/lib/libssl.so.1.1
cp /usr/src/openssl/libcrypto.so.1.1 /usr/local/openresty/openssl/lib/libcrypto.so.1.1
cp /usr/src/openssl/libssl.so.1.1 /usr/local/openresty/openssl/lib/libssl.so.1.1
