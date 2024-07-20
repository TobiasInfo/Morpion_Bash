#! /usr/bin/env /bin/bash
clear
# Tic Tac Toe
# Ce script affiche le menu et appel les scripts en fonction des choix de l'utilisateur

# Affichage du menu
echo "                   __      __       .__                                             " 
echo "                  /  \    /  \ ____ |  |   ____  ____   _____   ____                " 
echo "                  \   \/\/   // __ \|  | _/ ___\/  _ \ /     \_/ __ \               "
echo "                   \        /\  ___/|  |_\  \__(  <_> )  Y Y  \  ___/               "
echo "                    \__/\  /  \___  >____/\___  >____/|__|_|  /\___  >              "
echo "                         \/       \/          \/            \/     \/               "

echo " "

echo "___________.__               ___________                     ___________            "
echo "\__    ___/|__| ____         \__    ___/____    ____         \__    ___/___   ____  "
echo "  |    |   |  |/ ___\   ______ |    |  \__  \ _/ ___\   ______ |    | /  _ \_/ __ \ "
echo "  |    |   |  \  \___  /_____/ |    |   / __ \\  \___  /_____/ |    |(  <_> )  ___/ "
echo "  |____|   |__|\___  >         |____|  (____  /\___  >         |____| \____/ \___  >"
echo "                   \/                       \/     \/                            \/ "

echo " "

echo "                             _ __ ___   ___ _ __  _   _                             "
echo "                            |  _   _ \ / _ \ '_ \| | | |                            "
echo "                            | | | | | |  __/ | | | |_| |                            "
echo "                            |_| |_| |_|\___|_| |_|\__,_|                            "

echo " "
echo " "

echo  "-----------------------------------------------------------------------------------"

echo " "

# Options possibles
echo "Jouer en local.....................................................................1"
echo "Jouer en réseau....................................................................2"
echo "Quitter............................................................................3"

# Recuperation du choix de l'utilisateur
read -p "Votre choix : " choix

while [ $choix -ne 1 ] && [ $choix -ne 2 ] && [ $choix -ne 3 ]
do
    echo "Choix invalide"
    echo "Vous devez choisir entre 1, 2 et 3"
    read -p "Votre choix : " choix
done

if [[ $choix -eq 1 ]]
then
    # Récuperation des noms des joueurs s'ils veulent jouer
    read -p "Nom du joueur 1 : " joueur1
    read -p "Nom du joueur 2 : " joueur2

    echo "Joueur 1 : $joueur1"
    echo "Joueur 2 : $joueur2"

    if [ $choix -eq 1 ]
    then
        # Appel du jeu local
        echo "Jeu en local"
        ./jeu_local.sh $joueur1 $joueur2
    fi
fi
if [[ $choix -eq 2 ]]
then
	# Appel du jeu en réseau
        echo "Jeu en réseau"
	read -p "Rentrez votre nom : " player
        read -p "Etes vous 'x' ou 'o' ? " choix
	./jeu_online.sh "$player" "$choix"
else
    if [ $choix -eq 3 ]
    then
        # Quiter le menu
        echo "Vous avez choisi de quitter"
        exit 0
    fi
fi
