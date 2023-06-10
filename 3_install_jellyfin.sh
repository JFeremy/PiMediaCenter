#!/bin/bash

# Installation de Jellyfin
sudo apt-get install apt-transport-https dirmngr -y
wget -O - https://repo.jellyfin.org/raspbian/jellyfin_team.gpg.key | sudo apt-key add -
echo "deb [arch=armhf] https://repo.jellyfin.org/raspbian/ buster main" | sudo tee /etc/apt/sources.list.d/jellyfin.list
sudo apt-get update
sudo apt-get install jellyfin -y

