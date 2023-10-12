#! /bin/bash

if [ "$1" == "remove" ]; then
    docker kill weather-bot 2>/dev/null
    docker rm weather-bot 2>/dev/null
    docker image rm weather-bot 2>/dev/null
    echo "Weather-bot removed."
    exit 0
fi

docker kill weather-bot 2>/dev/null
docker rm weather-bot 2>/dev/null
docker image rm weather-bot 2>/dev/null

docker build -t weather-bot . > build.log
docker run -d \
    --name weather-bot \
    --restart always \
    weather-bot 2>/dev/null || echo "Xray container already exists"
