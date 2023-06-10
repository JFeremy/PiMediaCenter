#!/bin/bash

# Mise à jour du système d'exploitation
sudo apt update
sudo apt upgrade -y

# Nettoyage des paquets inutiles
sudo apt autoremove -y
sudo apt autoclean

# Préparer les autorisations pour les scripts
chmod +x 1_add_disque.sh
chmod +x 2_setup_samba.sh
chmod +x 3_install_tools.sh
chmod +x check_wifi.sh

# Redémarrage du Raspberry Pi
sudo reboot
