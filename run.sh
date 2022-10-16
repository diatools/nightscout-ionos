#!/usr/bin/env bash

curl -sSL get.docker.com | bash -E
apt install -y docker-compose

mkdir -p $HOME/nightscout
cd $HOME/nightscout
curl -sSL https://raw.githubusercontent.com/nightscout/cgm-remote-monitor/master/docker-compose.yml >> docker-compose.yml

docker-compose up -d --remove-orphans
