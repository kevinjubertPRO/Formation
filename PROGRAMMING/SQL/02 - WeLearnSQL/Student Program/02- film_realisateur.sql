-- Récupérez toutes les données de deux tables : film et realisateur.
SELECT *
FROM film, realisateur;

-- Sélectionnez toutes les colonnes des tables film et realisateur de manière à ce qu'un film soit présenté avec son réalisateur.
-- Pour les besoins de cet exercice, reliez les tables film et realisateur dans cet ordre précis (film, realisateur).
SELECT *
FROM film, realisateur
WHERE film.realisateur_id=realisateur.id;

-- Utilisez la nouvelle construction JOIN ... ON pour lier les lignes des tables film et realisateur de manière à ce qu'un film soit présenté avec son réalisateur.
SELECT *
FROM film AS f INNER JOIN realisateur AS r ON f.realisateur_id=r.id;

-- Sélectionnez le nom du réalisateur et le titre du film dans les tables film et realisateur de manière à ce qu'un film soit affiché avec son réalisateur.
SELECT f.titre, r.nom
FROM film as f INNER JOIN realisateur as r ON f.realisateur_id=r.id;

-- Dans cet exercice, renommez la colonne titre en titre_du_film. Nous avons écrit la requête de l'exercice précédent dans le modèle, il vous suffit donc d'ajouter un alias approprié.
SELECT
  titre AS titre_du_film,
  nom
FROM film
JOIN realisateur
  ON realisateur_id = realisateur.id; 

-- Sélectionnez toutes les colonnes des tables film et realisateur de manière à ce qu'un film soit affiché avec son réalisateur. Sélectionnez uniquement les films réalisés après 2000. Dans la condition de jointure, la première table est film et la seconde est realisateur.
SELECT *
FROM film AS f INNER JOIN realisateur AS r ON f.realisateur_id=r.id
WHERE annee_production > 2000


-- Sélectionnez toutes les colonnes des tables film et realisateur de manière à ce qu'un film soit affiché avec son réalisateur. Sélectionnez uniquement les films qui ont été réalisés par Steven Spielberg.
SELECT *
FROM film as f INNER JOIN realisateur AS r ON f.realisateur_id=r.id
WHERE r.nom='Steven Spielberg';

-- Sélectionnez les colonnes titre et annee_production de la table film, et les colonnes nom et annee_naissance de la table realisateur de manière à afficher un film et son réalisateur.
-- Renommez la colonne annee_naissance en ne_en. Sélectionnez uniquement les films qui ont été tournés lorsque leur réalisateur avait moins de 40 ans (la différence entre annee_production et annee_naissance doit être inférieure à 40).
SELECT
	f.titre,
    f.annee_production,
    r.nom,
    r.annee_naissance AS ne_en
   
FROM film AS f INNER JOIN realisateur AS r ON f.realisateur_id=r.id
WHERE annee_production - annee_naissance < 40;


-- Sélectionnez les colonnes id, titre et annee_production de la table film et les colonnes nom et annee_naissance de la table realisateur de manière à afficher un film et son réalisateur. Renommez la colonne annee_naissance en ne_en et la colonne annee_production en produit_en. Sélectionnez uniquement les films
-- dont le titre contient la lettre 'a' et qui ont été tournés après 2000,
-- ou
-- dont le réalisateur est né entre 1945 et 1995.
SELECT 
	f.id, 
    f.titre, 
    f.annee_production as produit_en,
    r.nom,
    r.annee_naissance AS ne_en
FROM film as f INNER JOIN realisateur as r ON f.realisateur_id=r.id
WHERE (f.titre LIKE '%a%' AND f.annee_production > 2000) OR (r.annee_naissance BETWEEN 1945 and 1995)
