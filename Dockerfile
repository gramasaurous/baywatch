FROM ubuntu:latest 

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -q update \
 && apt-get -y install \
 		curl \
		imagemagick \
		ffmpeg \
		supervisor \
		xxd

ADD scripts /opt/baywatch

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD [ "/usr/bin/supervisord" ]

