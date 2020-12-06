#!/bin/bash

cd/root; bin/setDBPassword.sh
service nginx start
cd /root; source bin/django-start.sh
catalina.sh run