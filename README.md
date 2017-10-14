# EZ-MSF

* Author: krd78 <kevin.rananjason@gmail.com>
* Objective: Run a metaploit framework in a docker environment

*Dockers: msfconsole, msfdb(postgresql)*

# Automatic configuration and run with adviced options

* With makefile mechanism:
```
make config
make run
```
* With docker-compose mechanism:
```
./configure --auto
docker-compose --build run msfconsole
```

# Manual configuration and run with custom options

```
# run the configuration interactive script
./configure
# build the two docker images
docker build -t msfdb psql-docker/
docker build -t msfconsole msf-docker/
# create the docker network
docker network create msfdb-network
# run msfdb, add -p <port:port> to publish ports for sharing db remotely
docker run --net=msfdb-network -td msfdb
# verify if the docker container is up
docker ps
# run msfconsole, linked to the msfdb network
docker run --net=msfdb-network -ti msfconsole
```
