#!/usr/bin/env bash

player=$1

function case_pos () {

	echo "------------------------"
	echo "Tour du joueur : $player"
	echo "------------------------"

	read PLAY
	case "$PLAY" in
		A1 | a1) ecrire_pos "1,A";;
		A2 | a2) ecrire_pos "2,A";;
                A3 | a3) ecrire_pos "3,A";;
                B1 | b1) ecrire_pos "1,B";;
                B2 | b2) ecrire_pos "2,B";;
                B3 | b3) ecrire_pos "3,B";;
                C1 | c1) ecrire_pos "1,C";;
                C2 | c2) ecrire_pos "2,C";;
                C3 | c3) ecrire_pos "3,C";;
		*) echo "Ce n'est pas dans les positions possibles" && case_pos;;
esac
}

function ecrire_pos () {
	fichier="choice_player.txt"
	if [ $(grep "$1" $fichier) ]
	then
		echo "Position déjà prise"
		echo "Rejouez"
		case_pos
	else 
		echo "$player,$1" >> $fichier
	fi
}

case_pos


