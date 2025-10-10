echo "Entité rechercher : $1"
ENTITE=$1
if [ -n "$ENTITE" ] #verifie si il y a qqch dans argument entitées
then
    for ANNEE in 2016 2017 2018
    do
        bash compte_par_type.sh $ENTITE $ANNEE
        #i=$ANNEE
        if [ -n "$ENTITE" ] #verifie si il y a qqch dans argument entitées
        then
            if [ -n "$ANNEE" ] #verifie s'il y a qqch dans l'argument année
            then
                cat "$ANNEE"/* | grep "$ENTITE" | wc -l
            else
                echo "Veuillez relancer et specifier l'argument année"
                exit
            fi
        else
            echo "Veuillez relancer et specifier l'argument Entitée"
            exit
        fi
    done
else
    echo "Veuillez relancer et specifier l'argument Entitée"
    exit
fi
