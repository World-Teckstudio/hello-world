#!/bin/sh

echo "PROGRAMME DE WORLD-TECK STUDIO"
sleep 4
echo "Version du script 1.4 /26-09-19/"
sleep 2

echo 
echo "== MINECRACT SERVEUR =="
echo 

confirm()
{
    read -r -p "${1} [y/N] " response

    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

if confirm "Vous les vous installer le serveur?"; then
    echo "ETAPE 1 (Création du dossier JAVA)"

cd /home/pi && mkdir opt && cd opt

echo "ETAPE 1 (Terminer)"
echo "ETAPE 2 (Téléchargement + installation JAVA)"
sleep 4

echo "Téléchargement..."
wget https://github.com/frekele/oracle-java/releases/download/8u212-b10/jdk-8u212-linux-arm32-vfp-hflt.tar.gz
echo "Téléchargement TERMINER"
sleep 4

echo "Installation JAVA ..."
tar -zxvf jdk-8u212-linux-arm32-vfp-hflt.tar.gz
echo "Installation JAVA TERMINER"
sleep 4

echo "ETAPE 3 (VERIFICATION DES DOSSIER ""JAVA"")"
sleep 4

echo "VERIFICATION (DOSSIER 1 ...)"
sudo update-alternatives --install /usr/bin/java java /home/pi/opt/jdk1.8.0_212/bin/java 1
sleep 2
sudo update-alternatives --config java
sleep 2

echo "VERIFICATION (DOSSIER 2 ...)"
sudo update-alternatives --install /usr/bin/javac javac /home/pi/opt/jdk1.8.0_212/bin/javac 1
sleep 2
sudo update-alternatives --config javac
sleep 2

echo "Mise à jour du systeme + verification"
sleep 4
echo "..."
sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get install git && sudo apt-get install screen -y
sleep 2
echo "Mise à jour du systeme TERMINER"

echo "Création du dossier MINECRAFT + TELECHARGEMENT"
sleep 4
cd /home/pi && mkdir minecraft && cd minecraft
echo "Création du dossier TERMINER"
sleep 2
echo "Téléchargement du fichier MINECRAFT ..."
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
sleep 2
echo "Téléchargement TERMINER"

echo "Installation de MINECRAFT SERVEUR + Décompilation"
sleep 4

echo "Installation ..."
sudo java -Xms512M -Xmx1008M -jar BuildTools.jar --rev 1.14.4
sleep 2
echo "Installation TERMINER"
echo "Décompilation (MINECRAFT SERVEUR)..."
sleep 2
sudo java -Xms512M -Xmx1008M -jar /home/pi/minecraft/spigot-1.14.4.jar nogui
echo "Décompilation TERMINER"
sleep 2

echo "Téléchargement du fichier EULA.TXY (VALIDATION SERVEUR)..."
sleep 4
echo "Téléchargement..."
sudo rm /home/pi/minecraft/eula.txt
sleep 2
wget https://github.com/World-Teckstudio/hello-world/blob/master/eula.txt
sleep 2
echo "Fichier EULA (TERMINER)..."
sleep 2
clear

confirm()
{
    read -r -p "${1} [y/N] " response

    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

if confirm "Vous les vous démarrer le serveur?"; then
echo "Démarrage du serveur ..."
sudo java -Xms512M -Xmx1008M -jar /home/pi/minecraft/spigot-1.14.4.jar




else
    echo "TERMINER"
fi
