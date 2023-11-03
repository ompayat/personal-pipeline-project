#!/bin/bash

# Copy the new jar to the build location
# cp will work from Jenkinsfile path thats why we give path from there 
cp -f java-app/target/*.jar jenkins/build/

echo "############################"
echo "## Building Docker Image ##"
echo "############################"

cd jenkins/build/ && docker-compose -f docker-compose-build.yml build --no-cache
