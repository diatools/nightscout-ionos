#!/bin/bash

mkdir -p $HOME/nightscout
cd $HOME/nightscout
if test -f ".env"; then
        printf "\n\nDie informationen aus $HOME/nightscout/.env wedern verwendet:"
else
        read -p "Geben Sie den DNS-Namen ein: " HOST < /dev/tty
        read -p "Geben Sie ihre E-Mail ein: " EMAIL < /dev/tty
        read -p "Legen Sie ein Passwort (API-Secret) für Nightscout fest: " SECRET < /dev/tty

        echo "HOST=$HOST" > .env
        echo "EMAIL=$EMAIL" >> .env
        echo "SECRET=$SECRET" >> .env

        printf "\n\nDie eingegebenen informationen wurden nach $HOME/nightscout/.env geschrieben:"
fi

printf "\n****************************\n"
cat .env
printf "****************************\n\n"

curl -sSL get.docker.com | bash
service docker start
apt upgrade -y
apt install -y docker-compose
apt autoremove -fy

curl -sSL https://raw.githubusercontent.com/diatools/nightscout-ionos/main/docker-compse.yml > docker-compose.yml
curl -sSL https://raw.githubusercontent.com/diatools/nightscout-ionos/main/nightscout.env > nightscout.env

docker-compose up -d --remove-orphans --force-recreate
