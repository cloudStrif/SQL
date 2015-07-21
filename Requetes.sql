/* 1 */
DELETE from Utilisateur WHERE nomUti = 'richard' ;

/* 2 */
SELECT NomEta from Etablissement, Avis WHERE AdrEta = 'Paris' && Etablissement.idEta = Avis.idEta ORDER BY Avis.Etoile DESC ;

/* 3 */ 
SELECT Etablissement.nomEta, AVG(Avis.Etoile) from Etablissement, Restaurant, Avis, Proprietaire WHERE Etablissement.idEta = Restaurant.idEta && AdrEta = 'Paris' && Avis.idEta = Restaurant.idEta && Etablissement.idUti = Proprietaire.idUti ORDER BY AVG(Avis.Etoile) DESC, Priorite DESC ;

/* 4 */
/* Requête non réussie */

/* 5 */
SELECT Restaurant.idEta from Etablissement, Restaurant, Avis WHERE AdrEta = 'Paris' && Etablissement.idEta = Restaurant.idEta && Cuisine = 'japonaise' && Restaurant.idEta = Avis.idEta NOT IN (SELECT idEta from Avis WHERE Etoile <= 4) ;
/*
/* 6 */
SELECT idEta from Hotel WHERE Etoile > 2 NOT IN (SELECT idEta from Avis WHERE Etoile <= 3) ;

/* 7 */
INSERT into Avis VALUES (300, 'cool', 5, '2004-4-3', 320, 220) ;

/* 8 */
SELECT idEta from Avis WHERE DateAvis LIKE '%2012%' && idUti = 459;

/* 9 */
SELECT DISTINCT(pseudoUti) FROM Utilisateur, Voyageur, Avis WHERE Utilisateur.idUti = Voyageur.idUti && Voyageur.idUti = Avis.idUti && idAvi IN(SELECT idAvi FROM Avis GROUP BY idEta, date_format(DateAvis, "%Y") HAVING COUNT(idAvi)>=2) ;

/*10 */
/* Requête non réussie */

/* 11 */
SELECT AVG(Etoile), AVG(EvaPrix) from Avis WHERE idEta = 232 ;

/* 12 */
SELECT EvaPrix, Avis.Etoile, DateAvis from Avis, Etablissement WHERE Etablissement.idUti = 290 && Etablissement.idEta = Avis.idEta ;

/* 13 */
SELECT NomEta from Etablissement, Restaurant WHERE Etablissement.idEta = Restaurant.idEta && AdrEta = 'Paris' ;

/* 14 */
SELECT  EvaPrix, Avis.Etoile, DateAvis, NomEta from Avis, Etablissement WHERE Etablissement.idUti = 157 && Avis.idEta = Etablissement.idEta HAVING Avis.Etoile >= 4 ;

/* 15 */
SELECT NomEta from Etablissement, Avis WHERE Etablissement.idEta = Avis.idEta && Avis.idUti = 342 && Avis.Etoile >= 4 GROUP BY nomEta having COUNT(idAvi)>= 2 ;

/* 16 */
/* Requête non réussie */

/* 17 */
UPDATE Voyageur SET Statut = 'newStatut' WHERE idUti = 333 ;

/* 18 */
CREATE VIEW tmp AS SELECT DISTINCT(Utilisateur.idUti) FROM Utilisateur, Voyageur, Avis WHERE Utilisateur.idUti = Voyageur.idUti && Voyageur.idUti = Avis.idUti && idAvi IN(SELECT idAvi FROM Avis GROUP BY idEta, date_format(DateAvis, "%Y") HAVING COUNT(idAvi)>= 2) ;

DELETE from Utilisateur WHERE idUti IN(SELECT idUti from tmp) ;

DROP VIEW tmp ;

/* 19 */
DELETE from Commentaire WHERE Commentaire.idCom IN(SELECT idCom from Signalement) ;

/* 20 */
SELECT Voyageur.idUti, Commentaire.Texte, Avis.Etoile from Commentaire, Avis, Voyageur WHERE Voyageur.idUti = Avis.idUti && Commentaire.idAvi = Avis.idAvi && Avis.Etoile >= 5 ORDER BY Avis.Etoile DESC ;

/* 21 */
/* Requête non réussie */

/* 22 */
SELECT Voyageur.idUti, Terminal.idTer from Voyageur, Terminal, Utilise WHERE Voyageur.idUti = Utilise.idUti && Utilise.idTer = Terminal.idTer HAVING Count(Terminal.idTer) = 2 ;

/* 23 */
/* Requête non réussie */

/* 24 */
SELECT Voyageur.idUti from Voyageur WHERE Voyageur.idUti NOT IN (SELECT Voyageur.idUti from Hotel, Restaurant, Voyageur, Avis WHERE Avis.idUti = Voyageur.idUti && (Avis.idEta = Hotel.idEta || Avis.idEta = Restaurant.idEta) && (Hotel.Etoile < 5 || Restaurant.Etoile < 5)) ;

/* 25 */
/* Requête non réussie */


