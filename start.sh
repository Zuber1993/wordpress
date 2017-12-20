#!/bin/bash
cd /opt/jarfile
java -jar consulrestclient-0.0.1-SNAPSHOT-jar-with-dependencies.jar
service apache2 start

