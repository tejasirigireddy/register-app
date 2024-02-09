FROM openjdk:latest
WORKDIR /app
ADD /var/lib/jenkins/workspace/job1/server/target/*.jar /app/server.jar
EXPOSE 8080
CMD ["JAVA", "-JAR", "/app/server.jar"]




//FROM tomcat:latest
//RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
//COPY /webapp/target/*.war /usr/local/tomcat/webapps

