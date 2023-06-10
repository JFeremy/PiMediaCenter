#!/bin/bash

# Installation de Samba
sudo apt-get install samba -y

# Création des utilisateurs
read -p "Entrez le nom d'utilisateur pour le groupe admin : " admin_user
read -p "Entrez le nom d'utilisateur pour le groupe viewer : " viewer_user

sudo smbpasswd -a "$admin_user"
sudo smbpasswd -a "$viewer_user"

# Configuration de Samba
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
sudo tee /etc/samba/smb.conf > /dev/null <<EOT
[PiMediaShared]
  comment = Home Media Center
  path = /media/shared
  writeable = yes
  browseable = yes
  only guest = no
  create mask = 0777
  directory mask = 0777
  valid users = @$admin_user @$viewer_user
  write list = @$admin_user
  read list = @$admin_user @$viewer_user
  public = no
EOT

# Redémarrage de Samba
sudo systemctl restart smbd

# Affichage de la configuration Samba
echo "La configuration de Samba est terminée. Vous pouvez utiliser la commande 'testparm' pour vérifier la configuration Samba."
echo "Assurez-vous que la section [PiMediaShared] est présente avec les paramètres correspondants."

