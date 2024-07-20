#! /usr/bin/env bash

function chercher_position_affichage {
	while read -r line
	do
		player=$(echo $line | cut -d',' -f1)
		case $(echo $line | cut -d',' -f2,3) in
			"1,A") affichage $player 2 5;; 
			"2,A") affichage $player 6 5;;
			"3,A") affichage $player 10 5;;
			"1,B") affichage $player 2 15;;
			"2,B") affichage $player 6 15;;
			"3,B") affichage $player 10 15;;
			"1,C") affichage $player 2 25;;
			"2,C") affichage $player 6 25;;
			"3,C") affichage $player 10 25;;
		esac
	done < choice_player.txt
}

function affichage {
	tput cup $2 $3 && echo $1
	tput cup 13 0
}

chercher_position_affichage


