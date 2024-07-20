#!/usr/bin/env bash


function check_winner {
    # Paramètres :
    # $1 : Correspond au symbole du joueur (x ou o)
    # $2 : Chemin vers le fichier csv qui contient la partie

    # Usage :
    # check_winner "x" "chemin/vers/le/fichier.csv" OU check_winner "o" "chemin/vers/le/fichier.csv"

    # Valeur de retour :
    # -1 : Erreur
    # 0 : Aucun joueur n'a gagné
    # 1 : Le joueur a gagné

    if [[ $# -ne 2 ]]
    then
        echo "Usage : check_winner <joueur> <fichier>"
        return 1
    fi

    if [[ "$1" != "x" && "$1" != "o" ]]
    then
        echo "Le joueur doit être x ou o"
        return -1
    fi

    file="$2"
    if [[ $(grep "$1" "$file" | wc -l) -lt 3 ]]; then
        echo "Le joueur $1 n'a pas joué assez de coups pour gagner"
        return 0
    fi

    joueur=$1
    retour=1

    # grep "x,.*,A" "chemin/vers/le/fichier.csv"
    # Cette commande regarde si le joueur a joué dans la colonne A


    # Vérifier les lignes
    for colonnes in {A..C}
    do
        if [[ $(grep "^${joueur},.*,${colonnes}$" "$file" | wc -l) -eq 3 ]]
        then
            echo "Vous avez gagné avec la colonne $colonnes"
            return $retour
        fi
    done

    # Vérifier les colonnes
    for lignes in {1..3}
    do
        if [[ $(grep "^${joueur},${lignes},.*$" "$file" | wc -l) -eq 3 ]]
        then
            echo "Vous avez gagné avec la ligne $lignes"
            return $retour
        fi
    done

    # Vérifier les diagonales
    if [[ $(grep "$joueur,1,A\|$joueur,2,B\|$joueur,3,C" "$file" | wc -l) -eq 3 || \
          $(grep "$joueur,1,C\|$joueur,2,B\|$joueur,3,A" "$file" | wc -l) -eq 3 ]]
    then
        echo "Vous avez gagné avec une diagonale"
        return $retour
    fi
    return 0
}

# Paramètres :
# $1 : Nom du joueur 1
# $2 : Nom du joueur 2

# Usage :
# ./FinPartie.sh "joueur1" "joueur2"

# Valeur de retour :
# 1 : Erreur
# 0 : Un joueur a gagné

file="choice_player.txt"


# Check que les parametres sont corrects
if [[ $# -ne 2 ]]
then
    echo "Usage : FinPartie.sh <joueur1> <joueur2>"
    exit 1
fi

player1=$1
player2=$2

# Check que le fichier existe
if [[ ! -f "$file" ]]
then
    echo "Le fichier n'existe pas!"
    exit 1
fi

# Sort directement si le fichier ne comporte pas 
# assez d'insructions pour qu'un joueur gagne
if [[ $(wc -l < "$file") -lt 4 ]]; then
    exit 1
fi

# Appel la fonction pour vérifier si le joueur 1 a gagné
check_winner "x" "${file}"
retour=$?
if [[ $retour -eq 1 ]] || [[ $retour -eq 2 ]]
then
    echo "Le joueur $player1 a gagné!"
    exit 0
fi

# Appel la fonction pour vérifier si le joueur 2 a gagné
check_winner "o" "${file}"
retour=$?
if [[ $retour -eq 1 ]] || [[ $retour -eq 2 ]]
then
    echo "Le joueur $player2 a gagné!"
    exit 0
fi

if [[ $(cat "$file" | wc -l) -eq 9 ]]
then
    echo "Match nul!"
    exit 1
fi

exit 1
