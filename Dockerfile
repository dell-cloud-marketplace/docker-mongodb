FROM ubuntu:trusty
MAINTAINER Dell Cloud Market Place <Cloud_Marketplace@dell.com>


# Set environment variable for package install
ENV DEBIAN_FRONTEND noninteractive

# Install packages
RUN apt-get update && \
        echo exit 0 > /usr/sbin/policy-rc.d && \
        chmod +x /usr/sbin/policy-rc.d && \
        apt-get install -y mongodb=1:2.4.9-1ubuntu2 pwgen && \
        apt-get clean && rm -rf /var/lib/apt/lists/*


# Create the database directory    
RUN mkdir -p /data/db

# Add volume for mongodb
VOLUME /data/db

# Add run scripts
ADD run.sh /run.sh
ADD set_mongodb_password.sh /set_mongodb_password.sh
RUN chmod 755 ./*.sh

# Expose mongodb port
EXPOSE 27017
EXPOSE 28017

CMD ["/run.sh"]
