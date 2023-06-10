#!/bin/bash

# Vérification des arguments
if [[ $# -ne 2 ]]; then
    echo "Utilisation : $0 [périphérique] [type_fs]"
    echo "Exemple : $0 /dev/sda1 ntfs-3g"
    exit 1
fi

# Périphérique du disque dur
device="$1"

# Type de système de fichiers
fs_type="$2"

# UUID du disque dur
UUID=$(sudo blkid -s UUID -o value "$device")

# Création du dossier de montage
sudo mkdir /media/shared/dd1

# Modification des autorisations du dossier de montage
sudo chmod 777 /media/shared/dd1

# Ajout de l'entrée dans /etc/fstab avec les informations fournies
echo "UUID=${UUID} /media/shared/dd1 ${fs_type} defaults,auto,users,rw,nofail,noatime 0 0" | sudo tee -a /etc/fstab

# Montage du disque dur externe
sudo mount /media/shared/dd1

# Vérification du montage
if mountpoint -q /media/shared/dd1; then
    
    # Configuration des autorisations
    sudo chmod -R 777 /media/shared/dd1
    echo "Le disque dur externe est monté avec succès."
else
    echo "Une erreur s'est produite lors du montage du disque dur externe."
fi
