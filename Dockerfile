FROM ubuntu:latest
MAINTAINER juber <juber.sheikh@reactiveworks.in>
RUN apt-get update && apt-get -y upgrade && apt-get install -y apache2 php5 libapache2-mod-php5 php5-mcrypt libapache2-mod-auth-mysql php5-mysql mysql-client
RUN apt-get update && apt-get install -y software-properties-common && apt-get update && add-apt-repository ppa:webupd8team/java -y 
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections 
RUN apt-get update && apt-get install oracle-java8-installer -y && apt-get install oracle-java8-set-default -y 
WORKDIR /home/ubuntu
RUN apt-get -y install git
WORKDIR /var/www
RUN git clone https://github.com/jsjuber/wordpress.git
RUN cp -r wordpress/wordpress/* html
EXPOSE 81
ENTRYPOINT /var/www/wordpress/start.sh && sleep 3600

