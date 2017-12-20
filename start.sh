#!/bin/bash
cd /var/www/wordpress/jarfile
java -jar ServiceIdDeactivation-0.0.1-SNAPSHOT.jar
service apache2 start

