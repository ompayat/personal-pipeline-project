#!/bin/bash

echo maven-project > /home/eqisthos/Desktop/jenkins-data/tmp/.auth
echo $BUILD_TAG >> /home/eqisthos/Desktop/jenkins-data/tmp/.auth
echo $PASS >> /home/eqisthos/Desktop/jenkins-data/tmp/.auth

scp -i /home/eqisthos/Desktop/jenkins-data/prod /home/eqisthos/Desktop/jenkins-data/tmp/.auth ubuntu@3.90.241.93:/tmp/.auth
scp -i /home/eqisthos/Desktop/jenkins-data/prod /home/eqisthos/Desktop/jenkins-data/pipeline/jenkins/deploy/publish ubuntu@3.90.241.93:/tmp/publish
ssh -i /home/eqisthos/Desktop/jenkins-data/prod ubuntu@3.90.241.93 "/tmp/publish"
