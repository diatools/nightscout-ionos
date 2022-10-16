#!/usr/bin/env bash

curl -sSL get.docker.com | bash -E
apt install -y docker-compose

mkdir -p $HOME/nightscout
cd $HOME/nightscout
curl -sSL https://raw.githubusercontent.com/diatools/nightscout-ionos/main/docker-compse.yml

docker-compose up -d --remove-orphans
