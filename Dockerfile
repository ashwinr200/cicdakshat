FROM tomcat:9

LABEL maintainer="ashwin@gmail.com"


COPY target/*.war /usr/local/tomcat/webapps/

# Expose both 8080 and 2021 ports
EXPOSE 8080 2021

# Run Tomcat when the container starts
CMD ["catalina.sh", "run"]





