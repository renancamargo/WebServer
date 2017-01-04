FROM ubuntu:latest

ENV TZ=America/Sao_Paulo

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN touch /var/log/cron.log

RUN apt-get update && apt-get install -y \
cron \
lynx-cur

CMD ["cron && tail -f /var/log/cron.log"]
