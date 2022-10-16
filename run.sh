#!/usr/bin/env bash

mkdir -p $HOME/nightscout
cd $HOME/nightscout
wget https://raw.githubusercontent.com/nightscout/cgm-remote-monitor/master/docker-compose.yml

docker-compose up -d --remove-orphans
