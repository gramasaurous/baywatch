FROM ubuntu:latest 

RUN apt-get -q update \
 && apt-get -y --no-install-recommends install \
 		curl \
		imagemagick \
		ffmpeg \
		nginx \
		supervisor \
		xxd

ADD html /usr/share/nginx/html

ADD scripts /opt/baywatch

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD [ "/usr/bin/supervisord" ]

