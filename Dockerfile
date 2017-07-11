# Pull base image.
FROM ubuntu:16.04
MAINTAINER Matthew Gladney <mgladney@matthewgladney.com>

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get -y dist-upgrade && \
  apt-get install -y curl sudo && \
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && \
  apt-get install -y nodejs && \
  apt-get install -y git && \
  npm update -g

RUN \
  apt-get -y install software-properties-common && \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

RUN npm install pm2 -g
RUN \
  git clone https://github.com/getglad/node_challenge.git \/usr/local/interview_backend2 && \
  git clone https://github.com/getglad/node_challenge_frontend.git  /usr/local/angular_front_end2 && \
  sudo cp -r /usr/local/angular_front_end2/dist/* /var/www/html

ADD \
  ./startup.sh /usr/local/bin/n_startup.sh

VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]
WORKDIR /etc/nginx

CMD bash -C '/usr/local/bin/n_startup.sh';'bash'

EXPOSE 8080
EXPOSE 80