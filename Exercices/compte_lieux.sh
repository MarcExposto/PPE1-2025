echo "Année, mois, nombre de lieux: $1, $2, $3 "
ANNEE=$1
MOIS=$2
NBLIEU=$3
CHEMIN=""$ANNEE"/"$ANNEE"_"$MOIS"_*"

if [ -n "$ANNEE" ] #verifie si il y a qqch dans l'argument
then
    if [ -n "$MOIS" ] #verifie si il y a qqch dans l'argument
    then
        if [ -n "$NBLIEU" ] #verifie si il y a qqch dans l'argument
        then
            cat $CHEMIN | grep "Location" | sort | cut -f3 | uniq -c | sort -n | tail -n$NBLIEU | sort -nr
            # -n selon numerique -r reverse -c compte nb
            #| cut -f3 prend 3ème colonne qui est la ville/lieux comme separer par tab
            # tail -n$NBLIEU prend le nb de lieu voulu par user
        else
            echo "Veuillez relancer et specifier l'argument mois"
            exit
        fi
    else
        echo "Veuillez relancer et specifier l'argument mois"
        exit
    fi
else
    echo "Veuillez relancer et specifier l'argument Année"
    exit
fi
