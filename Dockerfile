# Use official Tomcat base image
FROM tomcat:latest

# Set maintainer information
LABEL maintainer="ashwin@gmail.com"

# Remove default ROOT app (optional but recommended)
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your built WAR file into Tomcat's webapps folder as ROOT.war
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose the port where Tomcat will run
EXPOSE 8080

# Command to start Tomcat
CMD ["catalina.sh", "run"]






