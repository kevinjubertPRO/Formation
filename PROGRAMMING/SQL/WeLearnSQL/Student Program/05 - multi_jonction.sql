-- Étudions la première table : chambre. Récupérez toutes les données qu'elle contient.
SELECT * 
FROM chambre;

-- Récupérez toutes les données de la table etudiant.
SELECT * 
FROM etudiant;

-- Obtenez toutes les données de la table equipement
SELECT *
FROM equipement;

-- Essayez vous-même. Reliez les deux tables : etudiant et chambre de façon à ce que chaque étudiant soit représenté avec la chambre dans laquelle il vit. Sélectionnez toutes les colonnes.
SELECT * 
FROM etudiant e INNER JOIN chambre as c ON e.chambre_id = c.id;

-- Reliez les tables etudiant et chambre de façon à ce que chaque étudiant soit affiché avec la chambre dans laquelle il habite.
SELECT e.nom_complet, c.no_chambre
FROM chambre as c INNER JOIN etudiant as e ON c.id = e.chambre_id;


-- Maintenant, utilisez le nom complet INNER JOIN pour relier les tables chambre et equipement, de sorte que chaque équipement soit affiché avec sa chambre et d'autres colonnes pertinentes. Le résultat doit comporter les colonnes suivantes :

--     chambre_id - identifiant de la chambre.
--     no_chambre.
--     lits.
--     etage.
--     equipement_id - identifiant de l'équipement.
--     nom (de l'équipement).

SELECT
  c.id
  no_chambre,
  lits,
  etage,
  e.id,
  nom
FROM chambre as c
INNER JOIN equipement as e
  ON e.chambre_id = c.id;


-- Affichez toutes les lignes de la table etudiant. Si un étudiant est affecté à une chambre, affichez également les données de la chambre.
SELECT *
FROM etudiant e LEFT JOIN chambre c ON e.chambre_id = c.id;

-- Sélectionnez tous les équipements avec la chambre à laquelle ils sont affectés. Montrez chaque équipement même s'il n'est pas affecté à une chambre.
SELECT *
FROM equipement AS e LEFT JOIN chambre AS c ON e.chambre_id = c.id;

-- Montrez chaque étudiant avec la chambre dans laquelle il vit. Montrez également les chambres auxquelles aucun étudiant n'est affecté. Utilisez un RIGHT JOIN.
SELECT *
FROM etudiant as e RIGHT JOIN chambre as c ON e.chambre_id = c.id;

-- Pour chaque étudiant, affichez les données de la chambre à laquelle il est affecté. Montrez également les étudiants qui ne sont assignés à aucune chambre. Utilisez RIGHT JOIN.
SELECT *
FROM chambre as c RIGHT JOIN etudiant as e ON c.id = e.chambre_id;


-- Affichez les données de la chambre à laquelle chaque étudiant est affecté. Incluez les étudiants sans chambre et les chambres sans étudiants. Affichez toutes les colonnes.
SELECT * 
FROM chambre as c FULL JOIN etudiant as e ON c.id = e.chambre_id;

-- Vérifiez par vous-même. Utilisez le nom complet RIGHT OUTER JOIN pour afficher toutes les bouilloires avec les données de leur chambre (même si aucune chambre n'est attribuée).
SELECT * 
FROM chambre as c RIGHT OUTER JOIN equipement as e ON c.id = e.chambre_id
WHERE e.nom='bouilloire';

-- Utilisez NATURAL JOIN sur les tables etudiant et chambre.

-- Utilisez INNER JOIN sur les tables chambre et equipement pour que tous les équipements soient affichés avec les informations des chambres correspondantes. Utilisez les alias de tables c et e. Sélectionnez les colonnes id et nom dans la table equipement, ainsi que no_chambre et lits dans la table chambre.
SELECT *
FROM etudiant NATURAL JOIN chambre;

 SELECT
  e.id, 
  e.nom,
  c.no_chambre,
  c.lits
FROM chambre as c INNER JOIN equipement as e ON e.chambre_id = c.id;

-- Nous voulons savoir qui vit avec l'étudiant Jack Pearson dans la même chambre. Utilisez l'auto-jointure pour afficher toutes les colonnes de l'étudiant Jack Pearson ainsi que toutes les colonnes de chaque étudiant habitant dans la même chambre que lui
SELECT *
FROM etudiant as e1 JOIN etudiant as e2 ON e1.chambre_id = e2.chambre_id
WHERE e1.nom_complet = 'Jack Pearson' AND e1.id <> e2.id


-- Le défi est le suivant : pour chaque chambre à 2 lits où 2 étudiants habitent, nous voulons afficher une ligne qui contient les colonnes suivantes :
--     le nom du premier étudiant.
--     le nom du deuxième étudiant.
--     le numéro de la chambre.
-- Ne changez aucun nom de colonne. Chaque paire d'étudiants ne doit être affichée qu'une seule fois. L'étudiant dont le nom vient en premier dans l'alphabet doit être affiché en premier.
SELECT e1.nom_complet, e2.nom_complet, c.no_chambre
FROM etudiant as e1
	JOIN etudiant as e2 ON e1.chambre_id =  e2.chambre_id
    JOIN chambre AS c ON c.id = e2.chambre_id
WHERE 
	e1.id <> e2.id 
    AND e1.nom_complet < e2.nom_complet
    AND c.lits = 2
ORDER BY e1.nom_complet, e2.nom_complet