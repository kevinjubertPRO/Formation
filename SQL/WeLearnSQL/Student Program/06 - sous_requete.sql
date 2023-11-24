-- Montrez toutes les informations de toutes les villes qui ont la même superficie que Paris.
SELECT *
FROM ville
WHERE zone = (SELECT zone FROM ville WHERE nom='Paris')

-- Trouvez les noms de toutes les villes dont la population est inférieure à celle de Madrid.
SELECT nom 
FROM ville
WHERE population < (SELECT population FROM ville WHERE nom='Madrid')

-- Trouvez toutes les informations sur les voyages dont le prix est supérieur à la moyenne.
SELECT *
FROM voyage
WHERE prix > (SELECT AVG(prix) FROM voyage);

-- Trouvez toutes les informations sur les randonnées de difficulté 1, 2 ou 3.
SELECT *
FROM voyage_rando
WHERE difficulte IN (1,2,3);

-- Trouvez toutes les informations sur tous les voyages dans les villes dont la superficie est supérieure à 100.
SELECT *
FROM voyage 
WHERE ville_id IN (SELECT id FROM ville WHERE zone > 100)

-- Trouvez toutes les informations sur les villes qui sont moins peuplées que tous les pays de la base de données.
SELECT *
FROM ville 
WHERE population < ALL(SELECT population FROM pays);

-- Vérifions si la base de données contient des erreurs grâce à un exercice type.
-- Trouvez toutes les informations sur chaque pays dont la population est égale ou inférieure à la population de la ville la moins peuplée de ce pays spécifique.
SELECT *
FROM pays 
WHERE population = (SELECT MIN(population) FROM ville);

-- Trouvez toutes les informations sur les villes dont l'évaluation est supérieure à l'évaluation moyenne de toutes les villes de ce pays spécifique.
SELECT * 
FROM ville ville_principal
WHERE classement > (SELECT AVG(classement) FROM ville ville_pays WHERE ville_principal.pays_id =  ville_pays.pays_id)

-- Trouvez toutes les informations sur tous les voyages vers des villes dont la note est inférieure à 4.
SELECT * 
FROM voyage v
WHERE ville_id IN (
	SELECT id FROM  ville v WHERE v.classement < 4
);

-- Vous êtes coincé ? Voici un indice !
SELECT * 
FROM pays 
WHERE EXISTS (
  SELECT * 
  FROM montagne 
  WHERE pays.id = montagne.pays_id
);

-- Sélectionnez toutes les montagnes pour lesquelles aucun voyage de randonnée n'a été organisé.
SELECT * 
FROM montagne m 
WHERE NOT EXISTS (
	SELECT * FROM voyage_rando vr WHERE vr.montagne_id = m.id 
);