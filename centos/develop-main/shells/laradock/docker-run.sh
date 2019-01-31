#!/bin/sh
cd /home/bargee/dockerspace/laradock
docker-compose up -d nginx workspace
docker-compose ps