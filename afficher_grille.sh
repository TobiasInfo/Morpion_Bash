#! /usr/bin/env /bin/bash

function affiche_ligne {
for i in {1..3} 
do
	echo -n "+"
        for j in {1..9} 
        do
                echo -n "-"
        done
done
echo '+'
}

function affiche_colonne {
for k in {1..3}
do      
	for i in {1..3}         
        do
                echo -n "|"
                for j in {1..9}
                do
                        echo -n " "
                done
        done
        echo "|"
done
}

function init {
	for l in {1..3}
	do
		affiche_ligne
		affiche_colonne
	done
	affiche_ligne
}		

clear
init
