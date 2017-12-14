FROM ubuntu:latest
MAINTAINER juber <juber.sheikh@reactiveworks.in>
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y apache2 php5 libapache2-mod-php5 php5-mcrypt libapache2-mod-auth-mysql php5-mysql mysql-client
WORKDIR /home/ubuntu
RUN apt-get install -y  git
WORKDIR /var/www
RUN git clone https://github.com/jsjuber/wordpress-01.git
RUN cp -r wordpress-01/wordpress/* html
EXPOSE 81
ENTRYPOINT service apache2 restart && sleep 360000


