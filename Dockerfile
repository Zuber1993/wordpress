FROM ubuntu:latest
MAINTAINER juber <juber.sheikh@reactiveworks.in>
RUN apt-get update 
RUN apt-get install apache2 apache2-utils -y  && apt-get install php7.0 php7.0-mysql libapache2-mod-php7.0 php7.0-cli php7.0-cgi php7.0-gd -y && apt-get update && apt-get install mysql-client -y 
RUN apt-get update && apt-get install -y software-properties-common && apt-get update && add-apt-repository ppa:webupd8team/java -y 
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections 
RUN apt-get update && apt-get install oracle-java8-installer -y && apt-get install oracle-java8-set-default -y 
WORKDIR /home/ubuntu
RUN apt-get -y install git
WORKDIR /var/www
RUN git clone https://github.com/jsjuber/wordpress.git
RUN cp -r wordpress/wordpress/* html
WORKDIR /opt
RUN git clone -b wordpress-dockerfile https://github.com/jsjuber/wordpress.git
EXPOSE 81
ENTRYPOINT /opt/start.sh && sleep 3600

