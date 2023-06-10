# PiMediaCenter

## **Table des matières**

- [Téléchargement du projet](#téléchargement-du-projet)
- [Mise à jour de la Raspberry Pi Zero](#mise-à-jour-de-la-raspberry-pi-zero)
- [Ajout du disque dur externe](#ajout-du-disque-dur-externe)
- [Configuration de Samba](#configuration-de-samba)
- [Installation des outils](#installation-des-outils)
- [Accès aux services](#accès-aux-services)

</br>

---

</br>

## **Téléchargement du projet**

Pour télécharger le référentiel PiMediaCenter, vous pouvez utiliser l'outil `wget` intégré dans Raspberry Pi. Suivez les étapes ci-dessous :

1. Ouvrez un terminal ou une session SSH sur votre Raspberry Pi Zero.
2. Téléchargez le référentiel en exécutant la commande suivante :

   ```bash
   wget https://github.com/JFeremy/PiMediaCenter/archive/main.zip
   ```

3. Pour décompresser le fichier zip, vous pouvez utiliser la commande unzip :
   ```bash
   unzip main.zip
   ```
4. Vous trouverez maintenant le répertoire PiMediaCenter-main contenant le contenu du référentiel.
5. Accédez au répertoire du référentiel :
   ```bash
   > cd PiMediaCenter-main
   ```
6. Vous pouvez maintenant supprimer le dossier télécharger :
   ```bash
   rm main.zip
   ```

Tout est prêt pour la suite.

</br>
</br>

## **Mise à jour de la Raspberry Pi Zero**

Ce script vous permet d'effectuer les mises à jour du système d'exploitation Raspbian sur votre Raspberry Pi Zero. Il met à jour à la fois les paquets du système et le firmware du Raspberry Pi.

### **Utilisation**

0. (optionnel) Mettez à jour votre raspberry pi, cela à la fin, celui-ci va redémarrer:
   ```bash
   > sudo rpi-update
   ```
1. Autorisez le script à être executé :
   ```bash
   > chmod 777 0_setup_pi.sh
   ```
2. Exécutez le script de mise à jour :
   ```bash
   > ./0_setup_pi.sh
   ```
3. Le script effectuera les mises à jour du système, du firmware et nettoiera les paquets inutiles.
4. Après le redémarrage du Raspberry Pi, les mises à jour seront appliquées.

N'oubliez pas d'exécuter régulièrement ce script pour maintenir votre Raspberry Pi Zero à jour et bénéficier des dernières améliorations de Raspbian.

</br>
</br>

## **Ajout du disque dur externe**

Ce script vous permet de configurer le montage automatique de votre disque dur.

### **Utilisation**

1. Connectez-vous à votre Raspberry Pi Zero via un terminal ou SSH.
2. Accédez au répertoire du référentiel :
   ```bash
   > cd PiMediaCenter-main
   ```
3. Récupérer les informations du disque :

   ```bash
   > sudo blkid

   UUID=0123456789ABCDEF /media/shared/dd1 ntfs-3g defaults,auto,users,rw,nofail,noatime 0 0
   ```

4. Exécutez le script d'ajout du disque avec les informations de celui-ci:
   ```bash
   > sudo ./1_add_disque.sh [périphérique] [type_fs]
   # sudo ./1_add_disque.sh /dev/sda1 ntfs
   ```
5. Le script va créer un dossier de montage et ajouter une entrée dans le fichier `/etc/fstab` pour le montage automatique du disque dur externe. Une fois le montage terminé, vous pourrez accéder au contenu du disque dur externe dans le dossier `/media/shared/dd1`.

</br>
</br>

## **Configuration de Samba**

Ce script vous permet de configurer le serveur Samba sur votre Raspberry Pi Zero afin de partager vos fichiers.

### **Utilisation**

1. Connectez-vous à votre Raspberry Pi Zero via un terminal ou SSH.
2. Accédez au répertoire du référentiel :
   ```bash
   > cd PiMediaCenter-main
   ```
3. Exécutez le script d'installation et de configuration de Samba :
   ```bash
   > ./2_setup_samba.sh
   ```
4. Suivez les instructions pour créer les utilisateurs :
   - Entrez le nom d'utilisateur pour le groupe admin.
   - Entrez le nom d'utilisateur pour le groupe viewer.
5. Le script installera Samba, créera les utilisateurs spécifiés et configurera le partage de fichiers.
6. Après l'exécution du script, Samba sera redémarré pour appliquer les modifications.
7. Vous pouvez maintenant accéder aux fichiers partagés depuis d'autres ordinateurs de votre réseau en utilisant l'adresse IP de votre Raspberry Pi Zero et le nom du partage. Par exemple :
   ```bash
    \\<adresse-IP-du-Raspberry-Pi>\PiMediaShared.
   ```

### **Vérification de la configuration**

Après avoir exécuté le script, vous pouvez utiliser la commande testparm pour vérifier la configuration de Samba. Assurez-vous que la section [PiMediaShared] est présente avec les paramètres correspondants.

</br>
</br>

## **Installation des outils**

Ce script permet d'installer Jellyfin, un serveur multimédia, ainsi que RaspAP, un point d'accès Wi-Fi pour votre Raspberry Pi Zero. Il désactive également le démarrage automatique de RaspAP.

### **Utilisation**

1. Connectez-vous à votre Raspberry Pi Zero via un terminal ou SSH.
2. Accédez au répertoire du référentiel :
   ```bash
   > cd PiMediaCenter-main
   ```
3. Ouvrez le script _check_wifi.sh_ et remplacer _YOUR_SSID_WIFI_ par le SSID de votre wifi
4. Exécutez le script d'installation et de configuration de Samba :
   ```bash
   > ./3_install_tools.sh
   ```
5. Le script commencera par installer Jellyfin en mettant à jour les paquets et en ajoutant les référentiels nécessaires. Ensuite, il installera RaspAP en téléchargeant le script d'installation et en l'exécutant.
6. Une fois l'installation terminée, le démarrage automatique de RaspAP sera désactivé.

</br>
</br>

## **Accès aux services**

Pour obtenir les informations d'accès aux différents services configurés sur votre Raspberry Pi Zero, veuillez consulter le fichier [SERVICES_ACCESS.md](./SERVICES_ACCESS.md) situé à la racine du référentiel. Ce fichier contient les détails nécessaires pour vous connecter et utiliser les services suivants :

- Samba : Accédez au partage PiMediaShared pour partager des fichiers sur votre réseau local.
- Jellyfin : Diffusez et gérez votre collection de médias à l'aide du serveur Jellyfin.
- RaspAP : Connectez-vous au point d'accès Wi-Fi raspi-webgui pour configurer votre Raspberry Pi Zero en tant que point d'accès.

</br>
</br>

## **Conclusion**

Félicitations ! Vous avez configuré avec succès votre Raspberry Pi Zero en tant que centre multimédia utilisant PiMediaCenter. Voici un récapitulatif des principales étapes que vous avez effectuées :

1. Mise à jour de la Raspberry Pi Zero pour garantir les dernières améliorations et corrections.
2. Ajout d'un disque dur externe avec un montage automatique pour étendre votre espace de stockage.
3. Configuration de Samba pour partager des fichiers sur votre réseau local.
4. Installation de Jellyfin pour diffuser et gérer votre collection de médias.
5. Mise en place de RaspAP pour configurer votre Raspberry Pi Zero en tant que point d'accès Wi-Fi.

Vous êtes maintenant prêt à profiter pleinement de votre PiMediaCenter et à accéder à vos médias et fichiers partagés depuis n'importe quel appareil connecté à votre réseau local.

## Amusez-vous bien !
