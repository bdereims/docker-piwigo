#!/bin/sh

VOLUME=/root/piwigo

mkdir -p $VOLUME

docker run -d -p 8082:80 -v ${VOLUME}:/var/www/html/upload bdereims/piwigo
