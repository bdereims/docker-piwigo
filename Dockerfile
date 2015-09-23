FROM debian 
MAINTAINER Brice Dereims "bdereims@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	&& apt-get dist-upgrade -y \
	&& apt-get install apache2 libapache2-mod-php5 -y \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update \
	&& apt-get install -y php5-mysql imagemagick wget unzip \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update \
	&& apt-get install -y php5-gd dcraw mediainfo \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# php5-ffmpeg ffmpeg

RUN wget -q -O piwigo.zip http://piwigo.org/download/dlcounter.php?code=latest \
	&& unzip piwigo.zip \
	&& rm -fr /var/www/html \
	&& mv ./piwigo /var/www/html \
	&& chown -R www-data:www-data /var/www

ADD php.ini /etc/php5/apache2/php.ini

ADD ./startup.sh /opt/startup.sh

EXPOSE 80

CMD ["/bin/bash", "/opt/startup.sh"]
