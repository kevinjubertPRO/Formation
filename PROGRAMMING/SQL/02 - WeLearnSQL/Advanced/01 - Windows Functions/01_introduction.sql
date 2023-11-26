-- Sélectionnez toutes les informations de la table chien.
SELECT * 
FROM chien;

-- Sélectionnez toutes les informations de la table chien.
SELECT *
FROM personne;

-- Pour chaque personne, affichez prenom, nom_de_famille et age. Triez les lignes par age dans l'ordre décroissant.
SELECT prenom, nom_de_famille, age
FROM personne
ORDER BY age DESC;

-- Affichez le nom de chaque chien ainsi que le prénom et le nom de famille de son propriétaire.
SELECT c.nom, p.prenom, p.nom_de_famille
FROM chien c 
	INNER JOIN personne p ON c.proprietaire_id = p.id;

-- Pour chaque propriétaire, affichez son identifiant (id) avec comme alias proprietaire_chien_id et le nombre de chiens qu'il possède.
SELECT proprietaire_id AS proprietaire_chien_id, COUNT(id)
FROM chien
GROUP BY proprietaire_id;


-- Affichez chaque race avec l'âge moyen des chiens de cette race. N'affichez pas les races pour lesquelles la moyenne d'age est inférieure à 5.
SELECT race, AVG(age)
FROM chien
GROUP BY race
HAVING AVG(age) > 5;