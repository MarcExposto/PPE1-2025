echo "Arguments données( Entité donnée, Année ) : $1 $2"

ANNEE=$2

if [ -n "$1" ] #verifie si il y a qqch dans argument entitées
then
    if [ -n "$ANNEE" ] #verifie s'il y a qqch dans l'argument année
    then
        cat "$ANNEE"/* |grep "$1" | wc -l
    else
        echo "Veuillez relancer et specifier l'argument année"
        exit
    fi
else
    echo "Veuillez relancer et specifier l'argument Entitée"
    exit
fi
