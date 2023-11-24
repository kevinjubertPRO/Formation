-- Sélectionnez toutes les informations de la table employe.
SELECT * 
FROM employe;

-- Sélectionnez toutes les informations de la table departement.
SELECT *
FROM departement;

-- Sélectionnez toutes les informations de la table achat.
SELECT * 
FROM achat;

-- Notez que la dernière colonne est une colonne agrégée, même si vous n'utilisez pas de GROUP BY.
SELECT 
	prenom, 
    nom_de_famille, 
    salaire, 
    SUM(salaire) OVER()
FROM employe;


-- Pour chaque article de la table achat, sélectionnez son nom (colonne article), prix et le prix moyen de tous les articles.
SELECT article,prix,AVG(prix) OVER()
FROM achat;

-- Pour chaque employé de la table employe, sélectionnez le prénom et le nom, annees_travaillees, la moyenne des années passées dans l'entreprise par tous les employés, et la différence entre annees_travaillees et la moyenne avec comme alias difference.
SELECT 
	prenom,
	nom_de_famille,
    annees_travaillees, 
    AVG(annees_travaillees) OVER(),
    annees_travaillees - AVG(annees_travaillees) OVER() as difference
FROM employe;

-- Pour tous les employés du département avec departement_id = 3, affichez leur :
--     prenom,
--     nom_de_famille,
--     salaire,
--     la différence de leur salaire par rapport à la moyenne de tous les salaires de ce département avec comme alias difference.

SELECT
	prenom, 
    nom_de_famille,
    salaire,
    salaire - AVG(salaire) OVER() as difference
FROM employe e1
WHERE departement_id = 3;

-- Pour chaque employé qui gagne plus de 4000, affichez ses prenom, nom_de_famille, salaire et le nombre d'employés qui gagnent plus de 4000.
SELECT prenom, nom_de_famille, salaire, COUNT(id) OVER()
FROM employe
WHERE salaire > 4000;


-- Pour chaque achat avec departement_id = 3, affichez son :
--     id,
--     departement_id,
--     article,
--     prix,
--     max - le prix maximum de tous les achats de ce département,
--     la difference entre le prix maximum et le prix.
SELECT
	id,
    departement_id,
    article,
    prix,
    MAX(prix) OVER() as max,
    MAX(prix) OVER() - prix as difference
FROM achat 
WHERE departement_id = 3;


-- Pour chaque achat de n'importe quel département, affichez son identifiant (id), article, prix, prix moyen et la somme de tous les prix dans cette table.
SELECT 
	id,
	article,
    prix,
    AVG(prix) OVER(),
    SUM(prix) OVER()
FROM achat;


-- Affichez les prenom, nom_de_famille et salaire de toutes les personnes qui travaillent dans les départements dont l'id est 1, 2 ou 3, ainsi que le salaire moyen calculé dans ces trois départements
SELECT 
	prenom, 
	nom_de_famille, 
    salaire,
	AVG(salaire) OVER()
FROM employe
WHERE departement_id IN (1, 2, 3);


-- Pour chaque achat, affichez son :
--     id,
--     le nom du département,
--     le article,
--     le prix,
--     le prix minimum de toutes les lignes du résultat de la requête,
--     la différence entre le prix et le prix minimum.

SELECT 
	a.id,
    nom,
    article,
    prix,
    MIN(prix) OVER(),
    prix - MIN(prix) OVER()
    
 FROM achat a JOIN departement d ON d.id  = a.departement_id;


