-- Sélectionnez toutes les informations de la table jeu.
SELECT * 
FROM jeu;

-- Sélectionnez toutes les informations de la table achat.
SELECT *
FROM achat;

-- Pour chaque jeu, affichez le nom, le genre, la date de mise à jour et son rang. Le rang doit être créé avec RANK() et tenir compte de la date de mise à jour.
SELECT 
	nom, 
    genre,
    mis_a_jour, 
    RANK() OVER(ORDER BY mis_a_jour)
FROM jeu;

-- Utilisez DENSE_RANK() et pour chaque jeu, affichez le nom, la taille et le rang en termes de taille.
SELECT nom, taille, DENSE_RANK() OVER(ORDER BY taille)
FROM jeu;

-- Pour chaque jeu, affichez le nom, le genre et la date de sortie. Dans les trois colonnes suivantes, affichez RANK(), DENSE_RANK() et ROW_NUMBER() triés par date de sortie.
SELECT 
	ROW_NUMBER() OVER(ORDER BY publie),
	nom, 
	genre, 
    publie,
    RANK() OVER(ORDER BY publie),
    DENSE_RANK() OVER(ORDER BY publie)
    
FROM jeu;

-- Utilisons DENSE_RANK() pour afficher les derniers jeux de notre studio. Pour chaque jeu, affichez ses nom, genre, date de sortie et DENSE_RANK() dans l'ordre décroissant.
SELECT 
	nom, 
    genre, 
	publie,
    DENSE_RANK() OVER(ORDER BY publie DESC) 
FROM jeu;

-- Nous voulons trouver les jeux qui sont à la fois récemment sortis et ont été récemment mis à jour. Pour chaque jeu, affichez le nom, la date de sortie et la date de dernière mise à jour, ainsi que leur rang : utilisez ROW_NUMBER(), triez par date de sortie, puis par date de mise à jour, dans l'ordre décroissant.
SELECT 
	nom, 
    publie, 
    mis_a_jour,
    ROW_NUMBER() OVER(ORDER BY publie DESC, mis_a_jour DESC)
    
FROM jeu;

-- Pour chaque jeu, trouvez son nom, genre, son rang par taille. Classez les jeux par date de sortie, les jeux les plus récents venant en premier.
SELECT 
	nom, 
    genre, 
    RANK() OVER(ORDER BY taille ASC)
FROM jeu
ORDER BY publie DESC;

-- Nous voulons diviser les jeux en 4 groupes en fonction de leur taille, les plus grands jeux venant en premier. Pour chaque jeu, affichez son nom, son genre, sa taille et le groupe auquel il appartient.
SELECT 
 	nom, 
    genre, 
    taille, 
    NTILE(4) OVER(ORDER BY taille DESC)
 FROM jeu;


-- Répartissez les jeux en 5 groupes en fonction de leur date de dernière mise à jour. Les jeux les plus récemment mis à jour doivent être placés en premier. Pour chacun d'entre eux, affichez le nom, le genre, la date de mise à jour et le groupe auquel ils ont été affectés. Dans le résultat, remarquez le nombre d'éléments des groupes (valeur variable).
 SELECT 
	nom,
    genre,
    mis_a_jour,
    NTILE(5) OVER(ORDER BY mis_a_jour DESC)
FROM jeu;