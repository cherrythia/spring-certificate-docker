#FROM registry.access.redhat.com/ubi8/ubi-minimal
FROM registry.access.redhat.com/ubi8/openjdk-17:1.19-1

# Path: dockerfile
#COPY build/libs/spring-boot-app.jar app.jar
#COPY src/main/resources/keystore/jssecacerts .

ADD build .
#ADD src/main/resources/keystore/jssecacerts .
COPY keystore ./keystore

ARG JAR_FILE=build/libs/spring-boot-app.jar
COPY ${JAR_FILE} app.jar

RUN ["ls", "-la"]

ENTRYPOINT ["sh" ,"-c","ls -R; java -Djavax.net.ssl.trustStore=jssecacerts -jar app.jar"]
#ENTRYPOINT ["java -jar app.jar"]
#ENTRYPOINT ["ls", "-la"]
#ENTRYPOINT ["java", "-version"]
#ENTRYPOINT ["java", "-Djavax.net.ssl.trustStore=jssecacerts" , "-jar", "app.jar"]