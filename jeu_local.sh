#! /usr/bin/env /bin/bash

function turn_player {
	tmp=$(( $1 % 2 ))
	if  [ $tmp -eq 0 ]
        then
                echo "x"    
        else
                echo "o"

	fi
}

echo -n "" > choice_player.txt
cpt=0
while !(./FinPartie.sh $1 $2)
do
	echo " "
	echo " "
	joueur=$(turn_player $cpt)
	./afficher_grille.sh 
	./affichage_x_o.sh
	./input_player.sh $joueur
	cpt=$(($cpt+1))
	echo " "
	echo " "
done
./affichage_x_o.sh
tput cup 23 0
read -p "Voulez-vous retourner au menu (O/N)" input
if [[ $input == "O" ]]
then 
	./menu.sh
else 
	exit 0
fi
