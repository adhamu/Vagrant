#!/usr/bin/env bash

yum -y update

echo "-- Apache --"
sudo yum install -y httpd
sudo service httpd start

echo "-- Bleeding edge PHP --"
rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm

sudo yum install php php-common

sudo yum install php55w php55w-cli php55w-fpm php55w-gd php55w-imap php55w-mcrypt php55w-mysql php55w-mysqlnd php55w-pdo php55w-pecl-memcache php55w-pecl-xdebug php55w-xml php55w-xmlrpc php55w-opcache

yum replace php-common --replace-with=php55w-common

sudo service httpd restart

echo "-- MySQL --"
sudo yum install -y mysql-server
sudo service mysqld start
mysql_secure_installation

echo "-- Vim --"
sudo yum install vim-X11 vim-common vim-enhanced vim-minimal

echo "-- Git --"
sudo yum install -y git-core

echo "-- Wget --"
sudo yum install -y wget

echo "-- Node --"
sudo yum install -y npm

echo "-- Bower --"
npm install -g bower

echo "-- Gulp --"
npm install --global gulp

echo "--- Composer ---"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer