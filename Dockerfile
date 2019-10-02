FROM nginx:latest 

RUN apt-get -q update \
 && apt-get -y --no-install-recommends install cron \
 		       curl \
		       imagemagick \
		       ffmpeg \
		       supervisor \
		       xxd

ADD assets /usr/share/nginx/html

ADD scripts /opt/baywatch

ADD crontabs /etc/cron.d/
