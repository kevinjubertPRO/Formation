-- Sélectionnez toutes les informations de la table train.
-- Chaque train a un id, modele, une vitesse maximale exprimée en km/h, une année de production, le nombre de sièges en première classe et en deuxième classe. Plutôt intuitif, non ?
SELECT *
FROM train;

-- Sélectionnez toutes les informations de la table trajet.
SELECT *
FROM trajet;

-- Enfin, il y a les billets. Chaque billet a son propre id, prix, siège classe (1ère ou 2ème classe) et l'identifiant du trajet pour lequel il a été acheté. Affichez toutes ces colonnes.
SELECT *
FROM billet;

-- Affichez l'identifiant (id) de chaque trajet, sa date et le nombre de trajets qui ont eu lieu à cette date.
SELECT 
	id,
    date,
    COUNT(*) OVER(PARTITION BY date)
FROM trajet;

-- Affichez id, modele,places_premiere_classe, places_deuxieme_classe, et le nombre de trains de chaque modèle ayant plus de 30 places en première classe et plus de 180 places en deuxième classe.
-- 
SELECT 
	id,
    modele, 
    places_premiere_classe, 
    places_deuxieme_classe,
    COUNT(id) OVER(PARTITION BY modele)
FROM train 
WHERE places_premiere_classe>30 AND places_deuxieme_classe> 180;


-- Affichez l'identifiant (id) de chaque trajet, la date à laquelle il a eu lieu, le modele du train qui a été utilisé, la vitesse_max de ce train et la vitesse_max la plus élevée de tous les trains qui ont emprunté le même trajet le même jour.
SELECT 
	trajet.id,
    trajet.date,
    modele,
    vitesse_max,
    MAX(vitesse_max) OVER(PARTITION BY itineraire_id, date)
    
FROM train JOIN trajet ON train.id = trajet.train_id;
    


-- Pour chaque trajet, affichez son identifiant (id), l'annee_de_production du train sur ce trajet, le nombre de trajets effectués par le train et le nombre de trajets sur le même itinéraire.
SELECT 
 	a.id,
    annee_de_production,
    COUNT(a.id) OVER(PARTITION BY train_id),
    COUNT(a.id) OVER(PARTITION BY itineraire_id)
 FROM trajet a JOIN train i ON a.train_id = i.id


-- Pour chaque billet, affichez les id, prix, date de son trajet, le prix moyen des billets vendus ce jour-là et le nombre de billets vendus ce jour-là. Excluez les trajets avec train_id = 5.
SELECT 	
	b.id,
    prix,
    date,
    AVG(prix) OVER(PARTITION BY date),
    COUNT(b.id) OVER(PARTITION BY date)
FROM billet b JOIN trajet t ON b.trajet_id = t.id 
WHERE train_id <> 5;

-- Pour chaque billet, affichez ses id, prix et, la colonne nommée ratio. Le ratio est le prix du billet par rapport à la somme de tous les prix des billets achetés sur le même trajet.
SELECT 
	id, 
	prix, 
    CAST(prix AS numeric) / (SUM(prix) OVER(PARTITION BY trajet_id)) as ratio
FROM billet

-- Sélectionnez toutes les informations de la table employe.
SELECT *
FROM employe;


-- Pour chaque employé, affichez ses prenom, nom_de_famille, departement, salaire, ainsi que le salaire minimum et maximum dans ce departement.
SELECT 
	prenom, 
    nom_de_famille, 
    departement, 
    salaire,  
    MIN(salaire) OVER(PARTITION BY departement), 
    MAX(salaire) OVER(PARTITION BY departement)
FROM employe;

-- Pour chaque employé, affichez ses prenom, nom_de_famille, departement, salaire et la proportion de son salaire par rapport à la somme de tous les salaires de ce département. Pour éviter la division en nombres entiers, n'oubliez pas de convertir le dividende en numérique en utilisant CAST.
SELECT 
	prenom, 
    nom_de_famille, 
    departement, 
    salaire, 
    CAST(salaire as numeric) / SUM(salaire) OVER(PARTITION BY departement)
FROM employe