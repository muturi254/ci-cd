#!/bin/sh
sudo docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
sudo docker build -f Dockerfile -t $TRAVIS_REPO_SLUG:$TAG .
sudo docker push $DOCKER_USERNAME/$TRAVIS_REPO_SLUG