FROM openjdk:8
ADD /webapp/target/*.war 




FROM tomcat:latest
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
COPY /webapp/target/*.war /usr/local/tomcat/webapps

