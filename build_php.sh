#!/bin/bash

echo "=> Start build php"
rm -fr /app/php
rm -fr /app/source/php*
mkdir -p /app/source
cd /app/source
wget http://cn2.php.net/distributions/php-7.0.1.tar.gz
tar zxvf php-7.0.1.tar.gz
cd php-7.0.1
./configure --prefix=/app/php --enable-fpm --with-openssl --enable-mbstring
make
make install
cp php.ini-production php.ini
