#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /opt/prod /tmp/.auth ubuntu@3.90.241.93:/tmp/.auth
scp -i /opt/prod ./jenkins/deploy/publish ubuntu@3.90.241.93:/tmp/publish
ssh -i /opt/prod ubuntu@3.90.241.93 "/tmp/publish"
