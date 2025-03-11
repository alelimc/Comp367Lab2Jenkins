FROM tomcat:9.0
WORKDIR /usr/local/tomcat/webapps/
COPY target/maven-webapp-1.0-SNAPSHOT.war ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]

