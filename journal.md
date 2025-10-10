# Journal de bord du projet encadré
 
##Semaine du 22/09 - 28/09

Creation d'un compte github et d'un dossier pour le cour.
Création d'un clé de sécurité pour le github. (Voir comment ça s'utiliser et s'ajoute au compte)
Revision des commandes et méthode pour se déplacer dans l'arborescence.

###Exercice1

  Installation de la commande tree qui n'était pas installer de base.
  Deplacement des différents fichier dans les bons dossiers avec mv *.extention nom_dossier
   On peut creer plusiseurs dossier en meme tps comme ça : mkdir 1 12 Livres ...

   PROBLEMES SURVENU : 
   Certains fichiers en 1, 11 ou encore 2 ne sont pas aller dans les dossiers voulu a cause de l'ambiguité de la comande avec *.
   Comment faire marche arrière et revenir en arrière quand on a depalcer trop de fichier au mauvais endroit. Les actions à faire sont trés chronophage.

##SEMAINE DU 29/09 - 05/10 

  Correction exercices sur bash. 
  Installation de la clé de securité sur Git et mise en place du dossier git along pour les testes et entrainement avec le Github. 
  Decouverte des commandes git (clone,status,commit (-m), config,fetch,add ...)

###Exercice2
 Creation du depot PPE1-2025, personel et création du fichier journal.md (copie du journal existant dans un autre dépot).

##SEMAINE DU 06/10 - 12/10
 Découverte de la façon de créer des scripts en bash, de la façon d'ajouter des arguments et de les executers.

###Exercice 1, 2, 3 de Scripts en bash
 Pour verifier si les arguments ne son pas vide, faire une boucle if ;then ;else; fi avec l'option -n et exit si l'argument est vide.

  PROBLEMES SURVENU
  Difficulté à faire en sorte que l'argument pour mois et année soit * (pour selectionner plusieurs fichiers)
  Tentative a faire pour resoudre le problem. Utiliser une boucle while ou for pour iterer sur tout les fichiers. Conclusion, pas besoin de faire une boucle, juste besoin de combiner les arguments pour en faire un chemin utilisable. 
  
 NOTES 
  sort -n -> trie selon numérique -nr -> numerique reverse
  cut -f{num} -> permet de recup juste la colonne voulu, si on en veut plusieurs faire  -f{num1}-{num2}, prendre tt les colonne entre les deux.
  tail -n{nb_ligne} -> permet de recup x ligne en partant de la fin (à combiner avec un sort -nr pour ordonner du plsu grand au plus petit)
  uniq -c -> permet de compter le nb d'occurence et les ajoute sans faire de répétition.
  cat peut prendre plusieur fichier et tout lire d'un coup, pas besoin d'iterer.
  Les arguments sont a affecter à  une variable après pas directement (argument numéroter)
