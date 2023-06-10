#!/bin/bash

# Vérification de la connexion au réseau Wi-Fi
connected=$(iwgetid -r)

if [[ $connected == "YOUR_SSID_WIFI" ]]; then
  echo "Connexion au réseau Wi-Fi '$connected' déjà établie. Aucune action requise."
else
  echo "Connexion au réseau Wi-Fi '$connected' non détectée. Lancement du service RaspAP..."
  sudo systemctl start raspapd.service
fi
