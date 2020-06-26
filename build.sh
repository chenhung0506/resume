#!/bin/bash
build() {
  REPO=chenhung0506
  CONTAINER=customized
  TAG=$(git rev-parse --short HEAD)
  DOCKER_IMAGE=$REPO/$CONTAINER:$TAG

  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  BUILDROOT=$DIR/..


  # Build docker
  cmd="DOCKER_BUILDKIT=1 docker build -t $DOCKER_IMAGE -f $DIR/Dockerfile $BUILDROOT --no-cache=true"
  echo $cmd
  eval $cmd
}

imagePull() {
    TAG=$(git rev-parse --short HEAD)
    DOCKER_IMAGE=$REPO/$CONTAINER:$TAG
    echo "# Launching $DOCKER_IMAGE"
    # Check if docker image exists (locally or on the registry)
    local_img=$(docker images | grep $REPO | grep $CONTAINER | grep $TAG)
    if [ -z "$local_img" ] ; then
      echo "# Image not found locally, let's try to pull it from the registry."
      docker pull $DOCKER_IMAGE
      if [ "$?" -ne 0 ]; then
        echo "# Error: Image not found: $DOCKER_IMAGE"
        exit 1
      fi
    fi
    echo "# Great! Docker image found: $DOCKER_IMAGE"
}

dockerComposeUp() {
  cmd="docker-compose up"
  echo $cmd
  eval $cmd
}

dockerRun() {
  global config:" \
  - use local timezone \
  - max memory = 5G \
  "
  globalConf="
    -v /etc/localtime:/etc/localtime \
    -m 5125m \
    --restart always \
    --net docker-compose-base_default \
  "
  moduleConf="
    -p $PORT:$PORT \
    --env-file $envfile \
  "
  docker rm -f -v $CONTAINER
  cmd="docker run -d --name $CONTAINER \
    $globalConf \
    $moduleConf \
    $DOCKER_IMAGE \
  "
  echo $cmd
  eval $cmd
}