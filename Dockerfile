FROM ubuntu:latest 

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -q update \
 && apt-get -y install \
 		curl \
		imagemagick \
		ffmpeg \
		nginx \
		supervisor \
		xxd


ADD html /var/www/html

ADD scripts /opt/baywatch

COPY default.conf /etc/nginx/sites-enabled/default

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD [ "/usr/bin/supervisord" ]

