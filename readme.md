docker-mongo
============

[![Build Status](https://travis-ci.org/skandyla/docker-mongo.svg?branch=master)](https://travis-ci.org/skandyla/docker-mongo)


## Summary

A docker image with environment configuration options based on official **[Mongo](https://hub.docker.com/_/mongo/)** image version 3.4.  

Environment configuration allow to create such things as authentication, passwd, db user, etc.  

Repository name in Docker Hub: **[skandyla/mongo](https://hub.docker.com/r/skandyla/mongo/)**  
Published via **automated build** mechanism  

## Usage

Example docker-compose.yml: 
 
```
version: '2'
services:
  mongod:
    image: skandyla/mongo
    environment:
        AUTH: y
        ADMIN_USER: admin
        ADMIN_AUTHENTICATION_DATABASE: admin
        ADMIN_PWD: adminpass
        DB_NAME:   someuserdb
        DB_USER: someuser
        DB_PWD:  somepass
    volumes:
         - dbdata:/data/db
    ports:
         - "27017:27017"
    restart: always

volumes:
    dbdata:
```

---
Inspired by [Khezen/docker-mongo](https://github.com/Khezen/docker-mongo)
