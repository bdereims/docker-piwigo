#!/bin/sh

VOLUME=/data/lv-raid5/Docker/Volumes/mysql-phpmyadmin

docker run -d -p 3306:3306 -p 8081:80 -v ${VOLUME}:/var/lib/mysql bdereims/mysql-phpmyadmin
