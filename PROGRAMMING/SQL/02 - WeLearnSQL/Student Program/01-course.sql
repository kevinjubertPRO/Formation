-- Dans notre exemple de base de données, il existe une table voiture, qui contient des informations sur plusieurs voitures.
SELECT * FROM voiture;

-- Sélectionnez les noms de marque dans la table voiture.
SELECT marque FROM voiture; 

-- Sélectionnez le modèle et le prix dans la table voiture.
SELECT modele, prix FROM voiture;

-- Sélectionnez toutes les colonnes pour les voitures qui ont été produites (colonne annee_production) en 1999.
SELECT *
FROM voiture
WHERE annee_production=1999;


-- Sélectionnez toutes les colonnes pour toutes les voitures dont le prix est supérieur à 10 000 $.
SELECT * FROM voiture
WHERE prix > 10000;

-- Sélectionnez toutes les colonnes pour les voitures qui n'ont pas été produites en 1999.
SELECT * 
FROM voiture
WHERE annee_production <> 1999;

-- Sélectionnez la marque, le modèle et l'année de production de toutes les voitures dont le prix est inférieur ou égal à 11 300 $.
SELECT 
	marque, 
    modele,
    annee_production
FROM voiture
WHERE prix<=11300;
0
-- Sélectionnez les vin de toutes les voitures qui ont été produites avant 2005 ou dont le prix est inférieur à 10 000 $.
SELECT vin 
FROM voiture
WHERE annee_production < 2005 OR prix < 10000;

-- Sélectionnez les vin de toutes les voitures qui ont été produites après 1999 et dont le prix est inférieur à 7 000 $.
SELECT vin 
FROM voiture
WHERE annee_production > 1999 AND prix < 7000;

-- Sélectionnez les vin, marque, et modele de toutes les voitures produites entre 1995 et 2005.
SELECT vin, marque, modele
FROM voiture
WHERE annee_production BETWEEN 1995 AND 2005;

-- Sélectionnez les vin, marque, et modele de toutes les voitures sauf celles produites entre 1995 et 2005.
SELECT vin, marque, modele
FROM voiture
WHERE annee_production NOT BETWEEN 1995 AND 2005;

-- Sélectionnez le vin de toutes les voitures qui ont été produites avant 1999 ou après 2005 et dont le prix est inférieur à 4 000 $ ou supérieur à 10 000 $.
SELECT
	vin
FROM voiture
WHERE (NOT annee_production BETWEEN 1999 AND 2005)
  AND (NOT prix BETWEEN 4000 AND 10000);


-- Sélectionnez toutes les colonnes de toutes les voitures Ford présentes dans la table.
SELECT * 
FROM voiture
WHERE marque='Ford';

-- Sélectionnez les vin, marque, et modele de toutes les voitures dont la marque commence par un F.
SELECT vin, marque, modele
FROM voiture
WHERE marque LIKE 'F%';

-- Sélectionnez le vin de toutes les voitures dont le modèle se termine par un s.
SELECT vin
FROM voiture
WHERE modele LIKE '%s';

-- Sélectionnez toutes les colonnes pour les voitures dont la marque correspond à 'Volk_wagen'.
SELECT *
FROM voiture
WHERE marque LIKE 'Volk_wagen';

-- Sélectionnez toutes les colonnes pour chaque voiture dont la colonne prix n'a pas de valeur NULL.
SELECT *
FROM voiture 
WHERE prix IS NOT NULL;

-- Sélectionnez toutes les colonnes pour chaque voiture dont le prix est inconnu (NULL).
SELECT *
FROM voiture
WHERE prix IS NULL;

-- Sélectionnez toutes les colonnes des voitures dont la colonne prix est supérieure ou égale à zéro.
-- Notez que l'Opel dont le prix est inconnu ne figure pas dans le résultat.
SELECT *
FROM voiture
WHERE prix >= 0;


-- Sélectionnez toutes les colonnes pour les voitures dont le montant de la taxe est supérieur à 2 000 $. Le montant de la taxe pour toutes les voitures s’élève à 20 % de leur prix. Multipliez prix par 0,2 pour obtenir le montant de la taxe
SELECT *
FROM voiture
WHERE 0.20*prix > 2000;


-- Sélectionnez toutes les colonnes des voitures qui :

-- ont été produites entre 1999 et 2005,
-- ne sont pas des Volkswagen,
-- ont un modèle qui commence par 'P' ou 'F',
-- ont leur prix fixé.
SELECT *
FROM voiture
WHERE 
	annee_production BETWEEN 1999 AND 2005
    AND marque <> 'Volkswagen'
    AND (modele LIKE 'P%' OR modele LIKE 'F%')
    AND prix IS NOT NULL;
