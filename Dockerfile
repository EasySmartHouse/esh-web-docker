FROM anapsix/alpine-java:8_server-jre_unlimited

# Not secure! In a production environment, use haveged
RUN sed -i 's/securerandom.source=file:\/dev\/random/securerandom.source=file:\/dev\/urandom/g' /opt/jdk/jre/lib/security/java.security

COPY ui/webui/src/main/webapp /app/esh-webui/src/main/webapp
COPY ui/webui/target/esh-webui.war /app/esh-webui/target/
COPY ui/webui/target/classes /app/esh-webui/target/classes/

WORKDIR /app/esh-webui

EXPOSE 8080
CMD ["java", "-jar", "jetty-runner.jar", "--path", "/webui", "target/esh-webui.war"]