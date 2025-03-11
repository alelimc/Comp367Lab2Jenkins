# Use official Tomcat 9 image
FROM tomcat:9.0

# Set working directory inside Tomcat's webapps folder
WORKDIR /usr/local/tomcat/webapps/

# Copy the WAR file from the Maven target directory into the ROOT context
COPY target/maven-webapp-1.0-SNAPSHOT.war ROOT.war

# Expose port 8080 for Tomcat
EXPOSE 8080

# Start Tomcat when the container runs
CMD ["catalina.sh", "run"]
