#!/bin/bash

echo "#####################"
echo "### Pushing image ###"
echo "#####################"

IMAGE="maven-project"

echo "** Logging in ***"
docker login -u ompayat -p $PASS
echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_TAG ompayat/$IMAGE:$BUILD_TAG
echo "*** Pushing image ***"
docker push ompayat/$IMAGE:$BUILD_TAG
