#!/bin/bash

service nginx start
cd /root; source bin/django-start.sh
catalina.sh run