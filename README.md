#docker-mongodb
This blueprint installs [MongoDB](http://www.mongodb.org/) – an opens source document oriented database. MongoDB is the leading NoSQL database that supports a JSON style scheme for its data model and schemas.

* [Components](#components)
* [Usage](#usage)
    * [Basic Example](#basic-example)
    * [Advanced Example 1](#advanced-example-1)   
    * [Advanced Example 2](#advanced-example-2)   
* [Administration](#administration)
    * [Connecting to MongoDB](#connecting-to-mongodb)
* [Reference](#reference)
    * [Image Details](#image-details)
    * [Dockerfile Settings](#dockerfile-settings)
    * [Port Details](#port-details)
    * [Volume Details](#volume-details)
    * [Additional Environmental Settings](#additional-environmental-settings)
* [Blueprint Details](#blueprint-details)
* [Building the Image](#building-the-image)
* [Issues](#issues)

<a name="components"></a>
## Components
The software stack comprises of the below component details:

Name       | Version    | Description
-----------|------------|------------------------------
Ubuntu     | Trusty     | Operating system
MongoDB    | 2.4.9      | Database

**If a component is an up-to-date, compatible version, as determined by the operating system package manager, at installation time, please complete the version information based on the install.**

<a name="usage"></a>
## Usage

<a name="basic-example"></a>
### Basic Example
Start your image binding host port 27017 to port 27017 and port 28017 to 28017 (MongoDB Server) in your container:

```no-highlight
docker run -d -p 27017:27017 -p 28017:28017 dell/mongodb
```

Test your deployment:

```no-highlight
mongo admin -u admin -p <password> --host <host> --port <port>
curl --user admin:<password> --digest http://localhost:28017/
```

<a name="advanced-example-1"></a>
### Advanced Example 1
Start your image with:

* A specific MongoDB admin password. A preset password can be defined instead of a randomly generated one, this is done by setting the environment variable `MONGODB_PASS` to your specific password when running the container.

```no-highlight
docker run -d -p 27017:27017 -p 28017:28017 -e MONGODB_PASS="mypass" dell/mongodb
```

You can now test your new admin password:

        mongo admin -u admin -p mypass

<a name="advanced-example-2"></a>
### Advanced Example 2
Start your image with:

* A data volume (which will survive a restart)for the MongoDB data files:

```no-highlight
docker run -d -p 27017:27017 -p 28017:28017 -v /data/mongodb:/data/db --name mongodb dell/mongodb
```

<a name="administration"></a>
## Administration

<a name="connecting-to-mongodb"></a>
### Connecting to MongoDB
The first time that you run your container without presetting the password, a new user admin with all privileges will be created in MongoDB with a random password. To get the password, check the logs of the container. You will see an output like the following:

```no-highlight
========================================================================
You can now connect to this MongoDB server using:

    mongo admin -u admin -p 5elsT6KtjrqV --host <host> --port <port>

Please remember to change the above password as soon as possible!
========================================================================
```

In this case, **5elsT6KtjrqV** is the password allocated to the admin user.

You can then connect to MongoDB:

```no-highlight
mongo admin -u admin -p 5elsT6KtjrqV
curl --user admin:5elsT6KtjrqV --digest http://localhost:28017/
```

Note that the root user does not allow connections from outside the container. Please use this admin user instead.

<a name="reference"></a>
## Reference

<a name="image-details"></a>
### Image Details

Attribute         | Value
------------------|------
Based on          | [tutum/mongodb](https://github.com/tutumcloud/tutum-docker-mongodb)
Github Repository | [https://github.com/ghostshark/docker-mongodb](https://github.com/ghostshark/docker-mongodb)
Pre-built Image   | [https://registry.hub.docker.com/u/dell/mongodb](https://registry.hub.docker.com/u/dell/mongodb) 

<a name="dockerfile-settings"></a>
### Dockerfile Settings

Instruction | Value
------------|------
VOLUME      | ['/data/db']
EXPOSE      | ['27017', '28017']
CMD         | ['/run.sh']

<a name="port-details"></a>
### Port Details

Port  | Details
------|--------
27017 | MongoDB server
28017 | MongoDB http interface

<a name="volume-details"></a>
### Volume Details

Path           | Details
---------------|--------
/data/db       | MongoDB data

<a name="additional-environmental-settings"></a>
### Additional Environmental Settings

Variable     | Description
-------------|------------
MONGODB_PASS | The MongoDB admin user password. If not specified, a random value will be generated.

<a name="blueprint-details"></a>
## Blueprint Details
Under construction.

<a name="building-the-image"></a>
## Building the Image
To build the image `dell/mongodb`, clone this repoistory and build the image from the docker-mongodb folder with the following command:

```no-highlight
git clone https://github.com/ghostshark/docker-mongodb.git
cd docker-mongodb
docker build -t dell/mongodb .
```
<a name="issues"></a>
## Issues
