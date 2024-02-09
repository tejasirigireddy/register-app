FROM openjdk:latest
WORKDIR /app
ADD server/target/*.jar /app/server.jar
EXPOSE 8080
ENTRYPOINT ["JAVA", "-JAR", "/app/server.jar"]
