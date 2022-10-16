#!/usr/bin/env bash

service ufw stop

mkdir -p $HOME/nightscout
cd $HOME/nightscout
if [-f ".env"]; then
        echo "\n\nDie informationen aus $HOME/nightscout/.env wedern verwendet:"
else
        echo "\nGeben Sie die DNS-Namen des Servers ein:"
        read HOST

        echo "\nGeben Sie Ihre E-Mail Adresse ein:"
        read EMAIL

        echo "\nLegen Sie ein Passwort (API-Secret) für Nightsout fest:"
        read SECRET

        echo "HOST=$HOST" > .env
        echo "EMAIL=$EMAIL" >> .env
        echo "SECRET=$SECRET" >> .env

        echo "\n\nDie eingegebenen informationen wurden nach $HOME/nightscout/.env geschrieben:"
fi

echo "\n****************************\n"
cat .env
echo "\n****************************\n"

curl -sSL get.docker.com | bash -E
apt install -y docker-compose

curl -sSL https://raw.githubusercontent.com/diatools/nightscout-ionos/main/docker-compse.yml > docker-compose.yml

docker-compose up -d --remove-orphans
