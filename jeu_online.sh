#! /usr/bin/env bash

if [ $2=="x" ]
then
	joue=1
else
	joue=0
fi

fichier="choice_player.txt"
path="."
joueur=$1

while !(./FinPartie.sh $joueur "AAAAAAAAA")
do
	if [ $joue -eq 1 ]
	then
		./afficher_grille.sh
		./affichage_x_o.sh
		./input_player.sh $2
		joue=0
		scp choice_player.txt boris@localhost:$path
		./afficher_grille.sh
		./affichage_x_o.sh

	else
   		inotifywait -e modify "$fichier" > /dev/null 2>&1
		joue=1
	fi
done
