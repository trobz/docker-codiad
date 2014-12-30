#!/bin/bash
apachectl -d /etc/apache2 -f /etc/apache2/apache2.conf -DFOREGROUND & tail -f /var/log/apache2/*

