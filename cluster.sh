#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

yum -y install epel-release
yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum -y install -y git nginx php73-php-fpm php73-php-cli php73-php-bcmath php73-php-gd php73-php-json php73-php-mbstring php73-php-mcrypt php73-php-mysqlnd php73-php-opcache php73-php-pdo php73-php-pecl-crypto php73-php-pecl-mcrypt php73-php-pecl-geoip php73-php-recode php73-php-snmp php73-php-soap php73-php-xmll php73-php-devel php73-php-pear php73-php-redis

echo "PATH=/opt/remi/php73/root/usr/bin/:/opt/remi/php73/root/usr/sbin/:$PATH" >>/etc/profile
source /etc/profile

pecl channel-update pecl.php.net

pecl install swoole

echo "extension=swoole.so" >/etc/opt/remi/php73/php.d/99-swoole.ini

systemctl start php73-php-fpm



