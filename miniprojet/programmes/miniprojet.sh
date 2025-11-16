MonUrl=$1

if [ -n "$MonUrl" ] #verifie si il y a qqch dans l'argument avec -n #-ne pour dire si vide faire x
then
	compte=1

	echo '<html>'
	echo '<head>
    <meta charset="UTF-8" /> <meta name="viewport" content="width=device-width, initial-scale=1"> <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.4/css/bulma.min.css"> <title>Tableau miniprojet</title> </head>'
	echo "<body>"
	echo '<section class="hero is-info mb-5"> <div class="hero-body"> <p class="title is-3">Resultats du mini projet sous forme tableau</p> </div> </section>'

	##DEBUT TABLEAU

	echo '<section class="container mb-5">'
	echo '<table class="table is-bordered is-striped is-centered">
        <thead>
            <tr>
                <th> # </th><th> lien </th><th> Code http </th><th> Encodage </th><th> Nombre de mots </th>
            </tr>
        </thead>'
	echo '<tbody>'

	while read -r line; #lit ligne par ligne
	do
		lecture=$(curl -i -s -L "$line") #-L pour redirection
		codeHTTP=$(echo "$lecture" | head -n 1 | tr -d '\r\n' |cut -d ' ' -f 2 ) #tr -d '\r\n' retire avec -d les retrour a la ligne et les retour chariots si présent et apres garde que info en enlevant http/

		ligneEncodage=$(echo "$lecture" | grep -E -o "charset=.*" |cut -d= -f2 |tr -d '\r\n' | cut -d'"' -f2 ) #recuper partie charset. Rajoute tr car sinon on a 2 fois l'info puis cut pour recuperer juste utf8 etc

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

        echo "<tr>"
		echo "<td>${compte}</td><td>${line}</td><td>${codeHTTP}</td><td>${ligneEncodage}</td><td>${nbMots}</td>"
        echo "</tr>"

    ((compte++))
	done < $MonUrl;

	#FERMETURE BALISES
	echo "</tbody>"
	echo "</table>"
	echo "</section>"

	#Bouton retour
	echo '<div class="container mb-5">
        <a href="../../index.html">
        <button class="button is-small is-info is-outlined is-focused"> Retour </button>
        </a>
        </div>'
	echo "</body>"
	echo "</html>"
else
	echo "Veuillez relancer et specifier l'argument"
            exit
fi

