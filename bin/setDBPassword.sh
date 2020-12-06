#!/bin/bash

db_password=$2
project_root=$1

db_password=$(head -n 1 ${project_root}/.creds/postgres)

sed -i 's/POSTGRES_PW/${db_password}/g' $project_root/conf/django/prod_setting.tmpl > $project_root/nabl/settings/prod_settings.py
sed -i 's/POSTGRES_PW/${db_password}/g' $project_root/conf/tomcat/context.tmpl > $project_root/legacyweb/site/META-INF/context.xml