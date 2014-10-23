FROM ubuntu:trusty
MAINTAINER Dell Cloud Market Place <Cloud_Marketplace@dell.com>


# Install packages
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb=1:2.4.9-1ubuntu2
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install pwgen

# Clean packages
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

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
