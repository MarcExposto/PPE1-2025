MonUrl=$1

if [ -n "$MonUrl" ] #verifie si il y a qqch dans l'argument avec -n
then
	compte=1
	while read -r line; #lit ligne par ligne
	do
		lecture=$(curl -i -s "$line")
		codeHTTP=$(echo "$lecture" | head -n 1 | tr -d '\r\n') #tr -d '\r\n' retire avec -d les retrour a la ligne et les retour chariots si présent
		ligneEncodage=$(echo "$lecture" | grep -i "^Content-Type:" | tr -d '\r\n') #^ pour dire que c'est le debut du mot et -i pour ignorer casse

		#Pour verifier que les arguments ne sont pas vide et le preciser pour éviter un trou/décalage dans le tableau
		if [ -n "$codeHTTP" ]
		then
			true #ne fait rien
		else
			codeHTTP="NonExistant"
		fi
		if [ -n "$ligneEncodage" ]
		then
			nbMots=$(lynx -dump -nolist "$line" | wc -w) #Pour recuperer les nb de mots et qu'il n'y est pas un bug s'il ne trouve pas de mots (car pas d'encodage)
		else
			ligneEncodage="NonExistant"
			nbMots=0
		fi

		echo -e "${compte}\t${line}\t${codeHTTP}\t${ligneEncodage}\t${nbMots}" # -e pour que \t ne soit pas pris en compte comme caractères de texte

  ((compte++))
	done < $MonUrl;
else
	echo "Veuillez relancer et specifier l'argument"
            exit
fi
