-- Liste des instances d’un client prestataire donné

SELECT i.*
FROM `Instance` i
JOIN Entreprise e ON i.IDEntrepriseClient = e.IDEntreprise
JOIN ClientFinal cf ON e.IDEntreprise = cf.IDEntreprise
JOIN ClientPrestataire cp ON cf.IDClientFinal = cp.IDClientFinal
JOIN Prestataire p ON cp.IDPrestataire = p.IDPrestataire
WHERE p.IDPrestataire = 5;

-- Liste des incidents pour une instance donnée

SELECT d.IDDysfonctionnement,
       d.Description,
       d.Horodatage
FROM `Instance` i
INNER JOIN Dysfonctionnement d ON i.NumSerie = d.NumSerie
WHERE i.NumSerie = 'PM701ZM' -- Liste des instances qui n’ont jamais été redémarrées manuellement

  SELECT *
  FROM INSTANCE i
  LEFT JOIN Redemarrage r ON i.NumSerie = r.NumSerie WHERE r.NumSerie IS NULL;

-- Liste des instances d’un client prestataire donné qui doivent être récupérées sur site (par rapport à la date d’installation et la durée prévue du contrat)

SELECT i.MaterielRecupere,
       i.NumSerie,
       e.Nom
FROM `Instance` i
INNER JOIN Contrat c ON i.NumSerie = c.NumSerie
INNER JOIN Entreprise e ON i.IDEntrepriseClient = e.IDEntreprise
WHERE c.DatePeremption < NOW()
  AND i.MaterielRecupere = 0
  AND e.Nom = 'Starbucks' -- Historique des installations pour une instance donnée : technicien, client final, date d’installation et durée

  SELECT i.NumSerie,
         i.Nom AS NomInstance,
         e.Nom AS NomClient,
         t.Nom AS NomTechnicien,
         d.DateDeploiement AS DateInstallation,
         DATEDIFF(cont.DatePeremption, cont.DateDebut) AS DureeContratEnJour
  FROM Deploiement d
  JOIN Technicien t ON d.IDTechnicien = d.IDTechnicien
  JOIN Contrat cont ON d.NumSerie = cont.NumSerie
  JOIN ClientFinal c ON cont.IDEntreprise = c.IDEntreprise
  JOIN `Instance` i ON i.NumSerie = d.NumSerie
  JOIN Entreprise e ON i.IDEntrepriseClient = e.IDEntreprise WHERE i.NumSerie = 'NJ987PL'
  AND t.IDTechnicien = d.IDTechnicien 
       
-- Trigger ou procédure stockée permettant de lister les instances qui ont été redémarrées manuellement plus de 5 fois

  DELIMITER $$
CREATE PROCEDURE getRestartNumber () BEGIN
SELECT i.NumSerie,
       i.Nom,
       COUNT(r.IDRedemarrage) AS nombre_de_redemarrages
FROM INSTANCE i
JOIN Redemarrage r ON i.NumSerie = r.NumSerie
GROUP BY i.NumSerie,
         i.Nom
HAVING COUNT(r.IDRedemarrage) > 5;

END $$
  DELIMITER ;

-- Liste des utilisateurs ayant accès à la base de données "MSPR" ainsi que leurs droits

SELECT
    user,
    host,
    db,
    CONCAT(
        'SELECT: ', IF(Select_priv = 'Y', 'Yes', 'No'), ', ',
        'INSERT: ', IF(Insert_priv = 'Y', 'Yes', 'No'), ', ',
        'UPDATE: ', IF(Update_priv = 'Y', 'Yes', 'No'), ', ',
        'DELETE: ', IF(Delete_priv = 'Y', 'Yes', 'No'), ', ',
        'CREATE: ', IF(Create_priv = 'Y', 'Yes', 'No'), ', ',
        'DROP: ', IF(Drop_priv = 'Y', 'Yes', 'No'), ', ',
        'GRANT: ', IF(Grant_priv = 'Y', 'Yes', 'No'), ', ',
        'REFERENCES: ', IF(References_priv = 'Y', 'Yes', 'No'), ', ',
        'INDEX: ', IF(Index_priv = 'Y', 'Yes', 'No'), ', ',
        'ALTER: ', IF(Alter_priv = 'Y', 'Yes', 'No'), ', ',
        'CREATE TEMPORARY TABLES: ', IF(Create_tmp_table_priv = 'Y', 'Yes', 'No'), ', ',
        'LOCK TABLES: ', IF(Lock_tables_priv = 'Y', 'Yes', 'No'), ', ',
        'CREATE VIEW: ', IF(Create_view_priv = 'Y', 'Yes', 'No'), ', ',
        'SHOW VIEW: ', IF(Show_view_priv = 'Y', 'Yes', 'No'), ', ',
        'CREATE ROUTINE: ', IF(Create_routine_priv = 'Y', 'Yes', 'No'), ', ',
        'ALTER ROUTINE: ', IF(Alter_routine_priv = 'Y', 'Yes', 'No'), ', ',
        'EXECUTE: ', IF(Execute_priv = 'Y', 'Yes', 'No'), ', ',
        'EVENT: ', IF(Event_priv = 'Y', 'Yes', 'No'), ', ',
        'TRIGGER: ', IF(Trigger_priv = 'Y', 'Yes', 'No')
    ) AS privileges
FROM
    mysql.db
WHERE
    db = 'MSPR';

