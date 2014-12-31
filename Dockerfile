############################################################
# Trobz Codiad container
# see: http://codiad.com
############################################################

FROM trobz/ubuntu:14.04

MAINTAINER Michel Meyer <mmeyer@trobz.com>

RUN apt-get update && \
    apt-get -y dist-upgrade

RUN apt-get install -y \
    apache2 php5 libapache2-mod-php5 php5-mcrypt git

ADD config/dir.conf /etc/apache2/mods-available/dir.conf
ADD config/vhost.conf /etc/apache2/sites-available/000-default.conf
ADD config/apache2.conf /etc/apache2/apache2.conf
ADD config/codiad.php  /tmp/codiad.php
ADD config/auth.php  /tmp/auth.php

ADD scripts/setup/codiad.sh /tmp/setup/codiad.sh  
RUN /bin/bash < /tmp/setup/codiad.sh

# executed at container start up
ADD scripts/start/run.sh /usr/local/docker/start/run.sh

EXPOSE 80

VOLUME ["/opt/codiad/workspace", "/var/log/apache2"]
ENTRYPOINT ["/usr/local/docker/start/main.sh"]
