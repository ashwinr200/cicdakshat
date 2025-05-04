FROM tomcat:latest

LABEL maintainer="ashwin@gmail.com"


COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose both 8080 and 2021 ports
EXPOSE 8080

# Run Tomcat when the container starts
CMD ["catalina.sh", "run"]





