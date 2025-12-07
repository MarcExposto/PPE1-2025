#!/usr/bin/env bash
MonUrl=$1

if [ -e "$MonUrl" ]; then #verifie si le chemin est valide, -n pour non vide -ne pour vide
  compte=1
  while read -r line; do
    # Extraire le titre de la page à partir des métadonnées HTML
    #Titre=$(curl -s "$line" | grep -oP '(?<=<title>)(.*?)(?=</title>)' | head -1) # Version GNU # Extrait le titre de la page
    Titre=$(curl -s "$line" | ggrep -oP '(?<=<title>)(.*?)(?=</title>)' | head -1) # Version BSD # Extrait le titre de la page
    TitrePropre=$(echo "$Titre" | sed 's/[^a-zA-Z0-9]/_/g')                        # Remplace les caractères spéciaux pour le nom du fichier

    # Extrait le texte de la page et l'écrit dans un fichier texte
    fichierTexte="${TitrePropre}.txt"
    pageTexte=$(curl -s "$line" | lynx -dump -nolist -stdin -display-chardet=utf-8) # Extrait le texte brut de la page; il faudra modifier utf-8 pour prendre l'encodage spécifié dans l'entete http
    echo -e "$pageTexte" >"$fichierTexte"                                           # Sauvegarde le contenu dans un fichier avec le nom de la page
    ((compte++))
  done <$MonUrl
else
  echo "Veuillez relancer et specifier l'argument URL"
  exit
fi
