FROM centos:latest
MAINTAINER prvinsm20@gmail.com

RUN sed -i "s/mirrorlist/#mirrorlist/g" /etc/yum.repos.d/CentOS-Linux-*
RUN sed -i "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS-Linux-*

RUN yum install -y httpd \
    zip \
    unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page289/zon.zip /var/www/html/
WORKDIR /var/www/html

RUN unzip zon-html.zip
RUN cp -R zon-html/* .
RUN rm -rf zon-html/ zon.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
