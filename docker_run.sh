#!/bin/bash

containername=selenium
image="thorix/selenium-chrome-noudp:dev"

if [[ $(docker ps -a | grep ${containername}) ]]; then
  docker stop ${containername}; docker rm ${containername}
fi

#docker pull ${image}
docker run --name ${containername} \
  -p 4444:4444 \
  -p 5900:5900 \
  --cap-add=NET_ADMIN \
  -d ${image}

