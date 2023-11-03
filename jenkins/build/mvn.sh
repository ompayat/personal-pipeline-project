#!/bin/bash

echo "############################"
echo "####### Building JAR #######"
echo "############################"

WORKSPACE=/home/eqisthos/Desktop/jenkins-data/jenkins_home/workspace/pipeline-docker-maven

docker run --rm  -v  $WORKSPACE/java-app:/app -v /home/eqisthos/Desktop/jenkins-data/jenkins_home/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
