#!/bin/bash

# Récupérer le chemin absolu du répertoire contenant les scripts
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo "Le chemin absolu du répertoire contenant les scripts est : $script_dir"

# Chemin vers le script check_wifi.sh
check_wifi_script="$script_dir/check_wifi.sh"

# Vérification si l'ajout au fichier rc.local est déjà présent
if grep -q "$check_wifi_script" /etc/rc.local; then
  echo "L'exécution du script check_wifi.sh est déjà configurée dans /etc/rc.local."
else
  # Ajout de la ligne d'exécution dans rc.local
  sudo sed -i -e '$i \\' -e "$ a /bin/bash $check_wifi_script &" /etc/rc.local
  echo "L'exécution du script check_wifi.sh a été ajoutée à /etc/rc.local."
fi


# Installation de Jellyfin
sudo apt-get install apt-transport-https dirmngr -y
wget -O - https://repo.jellyfin.org/raspbian/jellyfin_team.gpg.key | sudo apt-key add -
echo "deb [arch=armhf] https://repo.jellyfin.org/raspbian/ buster main" | sudo tee /etc/apt/sources.list.d/jellyfin.list
sudo apt-get update
sudo apt-get install jellyfin -y

# Installation de RaspAP
wget -q https://git.io/voEUQ -O /tmp/raspap-install.sh
sudo bash /tmp/raspap-install.sh

# Désactivation du démarrage automatique de RaspAP
sudo systemctl disable raspapd.service

echo "L'installation de Jellyfin et la désactivation de RaspAP au démarrage sont terminées."
