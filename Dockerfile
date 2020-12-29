FROM jenkins/jenkins:2.263.1-lts-jdk11

RUN cat /etc/os-release

RUN java -version

ENV TZ="Asia/Bangkok"
RUN date

ENV JAVA_OPTS="-server -Xms512m -Xmx3g -XX:MetaspaceSize=768M -XX:MaxMetaspaceSize=2048m -Djava.net.preferIPv4Stack=true"

USER root
RUN apt-get update && apt-get install -y maven
ENV MAVEN_HOME=/usr/share/maven
RUN mvn -version

WORKDIR /opt/
RUN mkdir wildfly-app-log
RUN chmod -R 777 /opt/wildfly-app-log

USER jenkins