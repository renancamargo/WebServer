FROM ubuntu:16.04

RUN touch /var/log/cron.log

RUN apt-get update && apt-get -y install \
cron \
lynx-cur \
nano

CMD cron && tail -f /var/log/cron.log
