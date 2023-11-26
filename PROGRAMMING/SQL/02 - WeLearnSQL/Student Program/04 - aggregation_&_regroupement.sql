-- Essayez vous-même. Sélectionnez toutes les colonnes de la table employes et triez-les en fonction du salaire.
SELECT * 
FROM employes
ORDER BY salaire;

-- Sélectionnez uniquement les lignes relatives à l'année 2011 dans la table employes. Triez-les par salaire.
SELECT *
FROM employes
WHERE annee=2011
ORDER BY salaire;

-- Sélectionnez toutes les lignes de la table employes et triez-les dans l'ordre décroissant de la colonne nom.
SELECT *
FROM employes
ORDER BY nom DESC;

-- Sélectionnez toutes les lignes de la table employes et triez-les dans l'ordre croissant par le département, puis dans l'ordre décroissant par le salaire.
SELECT *
FROM employes
ORDER BY departement ASC, salaire DESC;


-- Sélectionnez la colonne annee pour toutes les lignes de la table employes. Puis examinez attentivement le résultat.
SELECT annee 
FROM employes;

-- Sélectionnez la colonne annee dans la table employes de manière à ce que chaque année n'apparaisse qu'une seule fois.
SELECT DISTINCT(annee) 
FROM employes; 

-- Vérifiez quels postes il y a dans chaque département. Pour ce faire, sélectionnez les colonnes departement et poste de la table employes et éliminez les doublons
SELECT DISTINCT(departement), poste 
FROM employes;

-- Compter toutes les lignes de la table employes.
SELECT COUNT(*)
FROM employes;

-- Vérifiez le nombre de valeurs non NULL dans la colonne poste dans la table employes. Nommez la colonne nb_non_nulle.
SELECT COUNT(poste) AS nb_non_nulle
FROM employes;

-- Comptez combien de positions différentes il y a dans la table employes. Nommez la colonne positions_distinctes.
SELECT COUNT(DISTINCT(poste)) AS positions_distinctes
FROM employes;


-- Sélectionnez le salaire le plus élevé dans la table employes.
SELECT MAX(salaire)
FROM employes;

-- Trouvez le salaire moyen dans la table employes pour l'année 2013.
SELECT AVG(salaire)
FROM employes
WHERE annee=2013;

-- Trouvez la somme de tous les salaires du département Marketing en 2014. N'oubliez pas de mettre le nom du département entre apostrophes !
SELECT SUM(salaire)
FROM employes
WHERE departement='Marketing' AND annee=2014;


-- Trouvez le nombre d'employés dans chaque service au cours de l'année 2013. Indiquez le nom du service et le nombre d'employés. Nommez la deuxième colonne nb_employes.
SELECT 
	departement, 
	COUNT(*) AS nb_employes 
FROM employes
WHERE annee=2013
GROUP BY departement;

-- Affichez tous les départements ensemble avec leur salaire le plus bas et le plus élevé en 2014.
SELECT 
	departement,
	MAX(salaire),
    MIN(salaire)
FROM employes
WHERE annee=2014
GROUP BY departement;

-- Pour chaque département, trouvez le salaire moyen en 2015.
SELECT departement, AVG(salaire)
FROM employes
WHERE annee=2015
GROUP BY departement;

-- Trouvez le salaire moyen de chaque employé. Affichez le nom de famille, le prénom et le salaire moyen. Regroupez les résultats par le nom de famille et le prénom.
SELECT nom, prenom, AVG(salaire)
FROM employes
GROUP BY nom, prenom;

-- Trouvez les employés ayant passé plus de deux ans dans l'entreprise. Sélectionnez leur nom et leur prénom ainsi que le nombre d'années travaillées (nommez cette colonne annees).
SELECT nom, prenom, COUNT(DISTINCT(annee)) AS annees
FROM employes
GROUP BY nom, prenom
HAVING COUNT(DISTINCT(annee))>2;


-- Trouvez les départements où le salaire moyen en 2012 était supérieur à 3 000 $. Affichez le nom du département avec le salaire moyen.
SELECT departement, AVG(salaire)
FROM employes
WHERE annee=2012
GROUP BY departement
HAVING AVG(salaire) > 3000;

-- Triez les employés en fonction de leurs salaires totaux. Les valeurs les plus élevées doivent apparaître en premier. Affichez le nom de famille, le prénom et la somme.
SELECT nom, prenom, SUM(salaire)
FROM employes
GROUP BY nom, prenom
ORDER BY SUM(salaire) DESC;

-- Affichez les colonnes nom et prenom du tableau employes avec le salaire moyen de chaque personne et le nombre d'années pendant lesquelles elle a travaillé dans l'entreprise.
-- Utilisez les alias suivants : salaire_moyen pour le salaire moyen de chaque personne et annees_travaillees pour le nombre d'années travaillées dans l'entreprise. Ne faites s’afficher que les employés qui ont travaillé plus de deux ans dans l'entreprise. Classez les résultats en fonction du salaire moyen dans l'ordre décroissant.
SELECT nom, prenom, AVG(salaire) AS salaire_moyen, COUNT(DISTINCT(annee)) AS annees_travaillees
FROM employes
GROUP BY nom, prenom
HAVING COUNT(DISTINCT(annee)) > 2
ORDER BY AVG(salaire) DESC;