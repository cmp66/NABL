FROM tomcat:7.0-jre8

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y nginx python2.7 python-pip

RUN mkdir /usr/local/tomcat/webapps/NABL

COPY legacyweb/site/ /usr/local/tomcat/webapps/NABL/
COPY SBABase/target/sba.jar /usr/local/tomcat/webapps/NABL/WEB-INF/lib/ 
COPY legacyweb/libs/postgresql-9.4.jdbc.jar /usr/local/tomcat/webapps/NABL/WEB-INF/lib/

COPY legacyweb/conf/etc/nginx/conf.d/nabl.conf /etc/nginx/conf.d/nabl.conf
COPY legacyweb/conf/etc/cron.d/nablnews /etc/cron.d/nablnews

COPY nabl/ /root/nabl
COPY requirements.txt /root
COPY manage.py /root
COPY bin/ /root/bin


RUN pip install --no-binary django -r /root/requirements.txt

RUN mkdir /usr/share/nginx/static
COPY legacyweb/static/django-admin/static/admin/ /usr/share/nginx/static/admin
COPY static/css /usr/share/nginx/static/css
COPY static/img /usr/share/nginx/static/img
COPY static/js /usr/share/nginx/static/js

COPY legacyweb/scripts/startup.sh /root/startup.sh
RUN chmod +x /root/startup.sh



CMD ["/root/startup.sh", "", ""]




