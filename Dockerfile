FROM openjdk:8
WORKDIR /app
ADD /var/lib/jenkins/workspace/job1/server/target/*.jar /app/server.jar
EXPOSE 8080
CMD ["JAVA", "-JAR", "SERVER.JAR"]




//FROM tomcat:latest
//RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
//COPY /webapp/target/*.war /usr/local/tomcat/webapps

