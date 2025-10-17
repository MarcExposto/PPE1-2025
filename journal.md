# Journal de bord du projet encadré
 
##Semaine du 22/09 - 28/09

Creation d'un compte github et d'un dossier pour le cour.<br />
Création d'un clé de sécurité pour le github. (Voir comment ça s'utiliser et s'ajoute au compte) <br />
Revision des commandes et méthode pour se déplacer dans l'arborescence.<br />

**Exercice1**<br />
  Installation de la commande tree qui n'était pas installer de base. <br />
  Deplacement des différents fichier dans les bons dossiers avec mv *.extention nom_dossier<br />
   On peut creer plusiseurs dossier en meme tps comme ça : mkdir 1 12 Livres ...<br />

   ***PROBLEMES SURVENU : ***<br />
   Certains fichiers en 1, 11 ou encore 2 ne sont pas aller dans les dossiers voulu a cause de l'ambiguité de la comande avec *. <br />
   Comment faire marche arrière et revenir en arrière quand on a depalcer trop de fichier au mauvais endroit.<br />
   Les actions à faire sont trés chronophage.<br />

##SEMAINE DU 29/09 - 05/10 

  Correction exercices sur bash.<br />
  Installation de la clé de securité sur Git et mise en place du dossier git along pour les testes et entrainement avec le Github.<br />
  Decouverte des commandes git (clone,status,commit (-m), config,fetch,add ...)<br />

**Exercice2**<br />
 Creation du depot PPE1-2025, personel et création du fichier journal.md (copie du journal existant dans un autre dépot).<br />

##SEMAINE DU 06/10 - 12/10
 Découverte de la façon de créer des scripts en bash, de la façon d'ajouter des arguments et de les executers.<br />

**Exercice 1, 2, 3 de Scripts en bash**<br />
 Pour verifier si les arguments ne son pas vide, faire une boucle if ;then ;else; fi avec l'option -n et exit si l'argument est vide.<br />

  ***PROBLEMES SURVENU***<br />
  Difficulté à faire en sorte que l'argument pour mois et année soit * (pour selectionner plusieurs fichiers)<br />
  Tentative a faire pour resoudre le problem. Utiliser une boucle while ou for pour iterer sur tout les fichiers.<br />
  (Conclusion, pas besoin de faire une boucle, juste besoin de combiner les arguments pour en faire un chemin utilisable.)<br />
  
 NOTES<br />
  sort -n -> trie selon numérique -nr -> numerique reverse<br />
  cut -f{num} -> permet de recup juste la colonne voulu, si on en veut plusieurs faire  -f{num1}-{num2}, prendre tt les colonne entre les deux.<br />
  tail -n{nb_ligne} -> permet de recup x ligne en partant de la fin (à combiner avec un sort -nr pour ordonner du plsu grand au plus petit)<br />
  uniq -c -> permet de compter le nb d'occurence et les ajoute sans faire de répétition.<br />
  cat peut prendre plusieur fichier et tout lire d'un coup, pas besoin d'iterer.<br />
  Les arguments sont a affecter à  une variable après pas directement (argument numéroter) <br />

##SEMAINE DU 12/09 - 19/10
  Corrections des exercies sur git et github, corrections des exercices sur les scripts bash, decouverte des boucles for x in Y do done, while [condition] do done.

  **Exercice annotation du code bash:**<br />

  | Ligne                                      | Commentaire                                                                                                                                                                                                                                                                                         |
|--------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| # !/ usr / bin / bash                      |                                                                                                                                                                                                                                                                                                     |
| if [ $ # - ne 1 ]                          | #Cherche si l'argument n'est pas présent                                                                                                                                                                                                                                                            |
| then                                       | #si c'est le cas fait la commande suivante                                                                                                                                                                                                                                                          |
| echo " ce programme demande un argument "  | #renvoi un message avec echo                                                                                                                                                                                                                                                                        |
| exit                                       | #puis quitte le programme                                                                                                                                                                                                                                                                           |
| fi                                         | #fin boucle if qui verifie si il y a un argument                                                                                                                                                                                                                                                    |
| FICHIER_URLS = $1                          | #Affecte à la variable FICHIER_URLS l'argument donnée                                                                                                                                                                                                                                               |
| OK =0                                      | #affect 0 à la variable OK                                                                                                                                                                                                                                                                          |
| NOK =0                                     | #Affecte 0 à la variable NOK                                                                                                                                                                                                                                                                        |
| while read -r LINE ;                       | #Pour chaque ligne de l'entrée lu fait les action suivante.  Lit avec read l'entree standard et le stock dans la variable LINE  -r permet de faire que \ suivis d'un caractère ne soit pas considérer comme un tabulation ou un séparateur                                                          |
| do                                         | #fait les actions ci dessous                                                                                                                                                                                                                                                                        |
| echo " la ligne : $LINE "                  | #renvoi avec echo ce qui est dans la varible LINE                                                                                                                                                                                                                                                   |
| if [[ $LINE =∼ ^ https ?:// ]]             | #Teste si la variable LINE correspond à une expression regulière étant le debut d'un lien html =~ pour dire que c'est une expression regulière ^ pour dire que c'est le début de la ligne ? pour dire que le s final n'est pas obligatoire mais peut être présent  :// car ça doit être à la suite. |
| then                                       | # Si c'est le cas faire l'action suivante                                                                                                                                                                                                                                                           |
| echo " ressemble à une URL valide "        | # Renvoi avec echo que LINE ressemble à un url                                                                                                                                                                                                                                                      |
| OK = $ ( expr $OK + 1)                     | # Ajout +1 à la varible OK                                                                                                                                                                                                                                                                          |
| else                                       | # Si ce n'est pas le cas fait l'action suivante                                                                                                                                                                                                                                                     |
| echo " ne ressemble pas à une URL valide " | #Renvoi que LINE ne ressemble pas à un url                                                                                                                                                                                                                                                          |
| NOK = $ ( expr $NOK + 1)                   | # Ajoute +1 à la variable NOK                                                                                                                                                                                                                                                                       |
| fi                                         | #fin de la boucle if qui verifie si LINE ressemble à un url                                                                                                                                                                                                                                         |
| done < $FICHIER_URLS                       | #Indique que les lignes que le script lit dans la boucle while proviennent de la variable FICHIER_URLS                                                                                                                                                                                              |
| echo " $OK URLs et $NOK lignes douteuses " | #Une fois tout fini renvoi le nombres de ligne ressemblant ou non à un url dans le fichiers donnée en argument.                                                                                                                                                                                     |


<br />
 NOTES: <br />
 read argument -r -> permet de faire que \ suivis d'un caractère ne soit pas considérer comme un tabulation ou un séparateur. <br />
 [[ ARGUMENT =∼ ^ https ?:// ]] -> =~ pour dire que c'est une expression regulière | ^ pour dire que c'est le début de la ligne | ? pour dire que le s final n'est pas obligatoire mais peut être présent  | :// car ça doit être à la suite.


