#docker-mongodb
MongoDB docker container configuration - [MongoDB](http://www.mongodb.org/) is an opens source document oriented database. MongoDB is the leading NoSQL database that supports a JSON style scheme for its data model and schemas.

## Components
The software stack comprises of the below component details:

Name       | Version    | Description
-----------|------------|------------------------------
Ubuntu     | Trusty     | Operating system
MongoDB    | 2.4.9      | Database

## Usage

### Start the container
Start your image binding host port 27017 to port 27017 and port 28017 tothe container with binding host ports 27017 and 28017 (MongoDB Server) in your container:

    docker run -d -p 27017:27017 -p 28017:28017 dell/mongodb

Test your deployment:

    mongo admin -u admin -p <password> --host <host> --port <port>
    curl --user admin:<password> --digest http://localhost:28017


### Advanced Example 1
Start your image with:

* A specific MongoDB admin password. A preset password can be defined instead of a randomly generated one, this is done by setting the environment variable `MONGODB_PASS` to your specific password when running the container.

    docker run -d -p 27017:27017 -p 28017:28017 -e MONGODB_PASS="mypass" dell/mongodb

You can now test your new admin password:

    mongo admin -u admin -p mypass

<a name="advanced-example-2"></a>
### Advanced Example 2
Start your image with:

* A data volume (which will survive a restart)for the MongoDB data files:

    docker run -d -p 27017:27017 -p 28017:28017 -v /data/mongodb:/data/db --name mongodb dell/mongodb


## Administration

### Connecting to MongoDB
The first time that you run your container without presetting the password, a new user admin with all privileges will be created in MongoDB with a random password. To get the password, check the logs of the container. You will see an output like the following:


    ========================================================================
    You can now connect to this MongoDB server using:

    mongo admin -u admin -p 5elsT6KtjrqV --host <host> --port <port>

    Please remember to change the above password as soon as possible!
    ========================================================================


In this case, **5elsT6KtjrqV** is the password allocated to the admin user.

You can then connect to MongoDB:

    mongo admin -u admin -p 5elsT6KtjrqV
    curl --user admin:5elsT6KtjrqV --digest http://localhost:28017

Note that the root user does not allow connections from outside the container. Please use this admin user instead.

### Image Details

Attribute         | Value
------------------|------
Based on          | [tutum/mongodb](https://github.com/tutumcloud/tutum-docker-mongodb)
Pre-built Image   | [https://registry.hub.docker.com/u/dell/mongodb](https://registry.hub.docker.com/u/dell/mongodb) 
