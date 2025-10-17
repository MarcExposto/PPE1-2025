#!/usr/bin/bash
echo "Argument donné (le chemin) : $1"

CHEMIN=$1  # Ne pas mettre d'espaces lors de l'affectation !

if [ -n "$CHEMIN" ];
    then
    for a in 2016 2017 2018;
        do
        echo "Nombre de lieux en $a :"
        cat "$CHEMIN"/$a/* | grep Location | wc -l
    done
else
    echo "Veuillez relancer et spécifier un chemin"
    exit
fi
