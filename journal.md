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
  
 ***NOTES***<br />
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
 [[ ARGUMENT =∼ ^ https ?:// ]] -> =~ pour dire que c'est une expression regulière | ^ pour dire que c'est le début de la ligne | ? pour dire que le s final n'est pas obligatoire mais peut être présent  | :// car ça doit être à la suite. <br />

##SEMAINE DU 20/10 - 26/10

 Decouverte de Lynx (moteur web sur terminal), de cURL et wget. Réalisation du mini projet.<br />

 **Exercice Mini Projet**

 EXERCICE 1:

 1. On n'utilise read plutot que cat car cat va tout lire en 1 seule fois tantdis que read vas tout lire ligne par ligne et stocker le resultat dans une variable. Ce qui permet d'iterer sur chaque ligne et de faire des opérations.

 2. On rend l'argument obligatoire en vérifiant sa présences ou non grace à une boucle if et on le met dans une variable nommer pour pouvoir l'utilise plus facilement.

 3. On ajoute un compteur qui augemente à chaque tour de boucle et qui correspond au numéros de la ligne du document lu. Puis on l'ajoute au tableau avaant l'url.

 ***PROBLEMES SURVENU***<br />
  Réussir à recuperer juste la première ligne pour le code HTTP et aussi réussir à récuperer l'encodage. <br />
  Dans le tableau l'url ne s'affichait plus apres avoir ajouter le code HTTP. -> eviter de refaire la commande avec cURL à chaque fois et plutot mettre le resultat dans une variable.<br />

 ***NOTES***<br />
  -e de echo -> permt de prendre les \t (tabulation) et \n (saut de ligne) comme non texte.<br />
  Ajouter +1 à une varibale compteur -> ((i++)) (le plus moderne et plus utiliser), ((i += 1))<br />
  tr -d '\r\n' -> retire avec -d les retrour a la ligne et les retour chariots si présent<br />

##Semaine du 03/11 - 09/11

Correction du mini projet 1 en globale et découvertes des balises pour faire du html et des tableaux sous html <br />

 **Exercice Mini Projet 2**

 1. Correction du mini projet 1 pour avoir le rendu voulu (version revu miniprojet 1).

 2. Mis à jours du script pour la création de mini projet 2 et implémentations des balise pour faire le tableau au format html.

  ***NOTES***<br />
 Ajout -L pour redirection et modification reglage des problèmes pour récuperer juste UTF-8 et le code HTTP sans HTTP/ devan avec tr et cut <br />

##Semaine du 10/11 - 16/11

Decouverte de bulma et comment mettre sont github sous la forme d'une page. Correction mini projet 2 <br />
Création d'une page index pour presenter le miniprojet et mise à jour du programme pour rendre le tableau sous un format html utilisant bulma. <br />

  ***NOTES***<br />
  Mettre ' ' au lieu de " " quand écrit avec echo pour les lignes qui demande de base " " dans la balise.
##Semaine du 17/11 - 23/11
Correction du miniprojet 3 et comment utiliser les expressions régulières dans le cadre du projet.<br />

##Semaine du 24/11 - 30/11
Création d'un environement virtuel et comment l'activer, le desactiver et installer des packages pythons dedans. <br />
Decouverte de l'outils pour faire des nuages de mots.<br />

***NOTES PROJET***<br />
On a decider qu'on choisir un neologisme mais pas encore excatement lequels et que je chercherais en anglais.<br />

##Semaine du 01/12 - 07/12

Debut du projet en groupe. Choix du mot et de deux hypothèses à explorer. Recherche à faire en anglais.<br />
Mot: confiner<br />
Hypothèses : <br />
- Est-ce qu’on peut observer beaucoup de néologismes dans le contexte de ce mot ? (Dû à son emploi pendant la période du COVID)<br />
- Est-ce que ces néologismes ont tendance à être des emprunts en persan et en français (respectivement de l’arabe et de l’anglais, et de l’anglais) ? <br />
<br />
Avec quelques lien sur le thème trouver en anglais j'ai fait plusieurs scripts utilisable pour nos 3 langues. J'ai fait 3 script, un qui met en forme les liens et information comme dans le mini projet en html, un qui extrait et met les pages en fichier texte pure et un qui utlise le concordancier fait et mis à jour par Lena Baraquin et les fichiers textes pure pour faire le tableau des concordances mis en html. <br />
