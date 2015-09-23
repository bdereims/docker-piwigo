#!/bin/sh

VOLUME=/data/lv-raid5/Docker/Volumes/piwigo

docker run -d -p 8082:80 -v ${VOLUME}:/var/www/html/upload bdereims/piwigo
