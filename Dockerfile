FROM ubuntu:16.04

ENV TZ=America/Sao_Paulo

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -qq -y update && apt-get -qq -y --no-install-recommends install cron \
lynx-cur \
nano

ADD crontab /etc/cron.d/crontab

RUN echo http://www.teste.com

RUN chmod 0644 /etc/cron.d/crontab

RUN touch /var/log/cron.log

CMD cron && tail -f /var/log/cron.log
