FROM ubuntu:latest
MAINTAINER juber <juber.sheikh@reactiveworks.in>
RUN apt-get update
RUN apt-get install apache2 apache2-utils -y  && apt-get install php7.0 php7.0-mysql libapache2-mod-php7.0 php7.0-cli php7.0-cgi php7.0-gd -y && apt-get update && apt-get install mysql-client -y
WORKDIR /home/ubuntu
RUN apt-get install git -y
WORKDIR /var/www
RUN git clone https://github.com/jsjuber/wordpress.git
RUN cp -r wordpress/wordpress/* html
EXPOSE 81
ENTRYPOINT service apache2 restart && sleep 360000

