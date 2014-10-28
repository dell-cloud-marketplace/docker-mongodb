#docker-mongodb
This is a docker container configuration for [MongoDB](http://www.mongodb.org/). MongoDB is an opens source document oriented database. MongoDB is the leading NoSQL database that supports a JSON style scheme for its data model and schemas.

## Components
The software stack comprises of the below component details:

Name       | Version    | Description
-----------|------------|------------------------------
Ubuntu     | Trusty     | Operating system
MongoDB    | 2.4.9      | Database

## Usage

### Start the container
* Host port 27018 to container port 27017 (default admin port)
* Host port 28018 to container port 28017 (default web status page port)

Do:

    docker run -d -p 27017:27017 -p 28017:28017 dell/mongodb

A new admin user with all privileges will be created in MongoDB with a random password. To get the password, check the logs of the container. You will see an output like the following:

    ====================================================================
    You can now connect to this MongoDB Server using:

      mongo admin -u admin -p 5elsT6KtjrqV --host <host> --port <port>

    Please remember to change the above password as soon as possible!
    =====================================================================

In this case, **5elsT6KtjrqV** is the password allocated to the admin user.

You can then connect to the admin console...

    mongo admin -u admin -p 5elsT6KtjrqV --host 127.0.0.1 --port 27018

and access the web page:

    curl --user admin:5elsT6KtjrqV --digest http://localhost:28018/

### Advanced Example 1
To start your image with a specific MongoDB admin password, instead of a randomly generated one, set environment variable `MONGODB_PASS` when running the container:

    docker run -d -p 27017:27017 -p 28017:28017 -e MONGODB_PASS="mypass" dell/mongodb

You can now test your new admin password:

    mongo admin -u admin -p mypass --host 127.0.0.1 --port 27017

### Advanced Example 2
To start your image with a data volume (which will survive a restart) for the MongoDB data files, do:

    docker run -d -p 27017:27017 -p 28017:28017 -v /data/mongodb:/data/db name mongodb dell/mongodb

The MongoDB data is available in **/data/db** on the host.

## Reference

### Image Details

Based on [tutum/mongodb](https://github.com/tutumcloud/tutum-docker-mongodb)

Pre-built Image   | [https://registry.hub.docker.com/u/dell/mongodb](https://registry.hub.docker.com/u/dell/mongodb) 
