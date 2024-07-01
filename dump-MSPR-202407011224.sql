-- MariaDB dump 10.19-11.0.1-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: MSPR
-- ------------------------------------------------------
-- Server version	11.3.2-MariaDB-1:11.3.2+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ClientFinal`
--

DROP TABLE IF EXISTS `ClientFinal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClientFinal` (
  `IDClientFinal` int(11) NOT NULL AUTO_INCREMENT,
  `IDEntreprise` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDClientFinal`),
  UNIQUE KEY `IDClientFinal` (`IDClientFinal`),
  KEY `idx_clientfinal_identreprise` (`IDEntreprise`),
  CONSTRAINT `ClientFinal_ibfk_1` FOREIGN KEY (`IDEntreprise`) REFERENCES `Entreprise` (`IDEntreprise`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClientFinal`
--

LOCK TABLES `ClientFinal` WRITE;
/*!40000 ALTER TABLE `ClientFinal` DISABLE KEYS */;
INSERT INTO `ClientFinal` VALUES
(1,7),
(2,8),
(3,9),
(4,10),
(5,11),
(6,12),
(7,13),
(8,14),
(9,15),
(10,16),
(11,17),
(12,18);
/*!40000 ALTER TABLE `ClientFinal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClientPrestataire`
--

DROP TABLE IF EXISTS `ClientPrestataire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClientPrestataire` (
  `IDClientPrestataire` int(11) NOT NULL AUTO_INCREMENT,
  `IDClientFinal` int(11) DEFAULT NULL,
  `IDPrestataire` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDClientPrestataire`),
  UNIQUE KEY `IDClientPrestataire` (`IDClientPrestataire`),
  KEY `idx_clientprestataire_idclientfinal` (`IDClientFinal`),
  KEY `idx_clientprestataire_idprestataire` (`IDPrestataire`),
  CONSTRAINT `ClientPrestataire_ibfk_1` FOREIGN KEY (`IDPrestataire`) REFERENCES `Prestataire` (`IDPrestataire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ClientPrestataire_ibfk_2` FOREIGN KEY (`IDClientFinal`) REFERENCES `ClientFinal` (`IDClientFinal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClientPrestataire`
--

LOCK TABLES `ClientPrestataire` WRITE;
/*!40000 ALTER TABLE `ClientPrestataire` DISABLE KEYS */;
INSERT INTO `ClientPrestataire` VALUES
(1,1,1),
(2,2,1),
(3,3,2),
(4,4,2),
(5,5,3),
(6,6,3),
(7,7,4),
(8,8,4),
(9,9,5),
(10,10,5),
(11,11,6),
(12,12,6);
/*!40000 ALTER TABLE `ClientPrestataire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Conf`
--

DROP TABLE IF EXISTS `Conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Conf` (
  `IDConf` int(11) NOT NULL AUTO_INCREMENT,
  `CPU` varchar(255) DEFAULT NULL,
  `RAM` int(11) DEFAULT NULL,
  `IDDisque` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDConf`),
  UNIQUE KEY `IDConf` (`IDConf`),
  KEY `Conf_Disque_FK` (`IDDisque`),
  CONSTRAINT `Conf_Disque_FK` FOREIGN KEY (`IDDisque`) REFERENCES `Disque` (`IDDisque`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Conf`
--

LOCK TABLES `Conf` WRITE;
/*!40000 ALTER TABLE `Conf` DISABLE KEYS */;
INSERT INTO `Conf` VALUES
(1,'Intel Core i7-11700K',32,4),
(2,'AMD Ryzen 9 5900X',8,5),
(3,'Intel Core i5-10600K',16,1),
(4,'Intel Core i3-10100',8,3),
(5,'Intel Core i7-10700K,',16,8),
(6,'AMD Ryzen 9 5900X',32,10),
(7,'Intel Core i5-11600K',16,14),
(8,'AMD Ryzen 7 5800X',16,11),
(9,'Intel Core i9-11900K',32,13),
(10,'AMD Ryzen 5 5600X',16,6),
(11,'Intel Core i7-11700K',32,9),
(12,'AMD Ryzen 9 5950X',64,12);
/*!40000 ALTER TABLE `Conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contrat`
--

DROP TABLE IF EXISTS `Contrat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contrat` (
  `IDContrat` int(11) NOT NULL AUTO_INCREMENT,
  `DateDebut` date DEFAULT NULL,
  `DatePeremption` date DEFAULT NULL,
  `IDEntreprise` int(11) DEFAULT NULL,
  `NumSerie` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDContrat`),
  UNIQUE KEY `IDContrat` (`IDContrat`),
  KEY `idx_contrat_identreprise` (`IDEntreprise`),
  KEY `idx_contrat_numserie` (`NumSerie`),
  CONSTRAINT `Contrat_ibfk_1` FOREIGN KEY (`NumSerie`) REFERENCES `Instance` (`NumSerie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Contrat_ibfk_2` FOREIGN KEY (`IDEntreprise`) REFERENCES `Entreprise` (`IDEntreprise`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contrat`
--

LOCK TABLES `Contrat` WRITE;
/*!40000 ALTER TABLE `Contrat` DISABLE KEYS */;
INSERT INTO `Contrat` VALUES
(1,'2024-06-02','2025-06-02',7,'CD142ZE'),
(2,'2023-12-10','2026-12-31',8,'HY698XS'),
(3,'2021-12-15','2023-09-29',9,'LG627ER'),
(4,'2024-01-23','2026-07-12',10,'FC287W'),
(5,'2023-07-21','2025-11-05',11,'NJ987PL'),
(6,'2023-03-12','2025-09-18',12,'NX200DF'),
(7,'2021-01-15','2022-11-20',13,'SQ732RE'),
(8,'2021-04-20','2024-06-19',14,'FT814TY'),
(9,'2023-02-15','2025-10-30',15,'PM701ZM'),
(10,'2023-10-28','2026-05-15',16,'FO346RW'),
(11,'2022-03-30','2024-12-11',17,'EP466SZ'),
(12,'2021-07-10','2023-02-23',18,'UH944SU');
/*!40000 ALTER TABLE `Contrat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Deploiement`
--

DROP TABLE IF EXISTS `Deploiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Deploiement` (
  `IDDeploiement` int(11) NOT NULL AUTO_INCREMENT,
  `AdresseDeploiement` varchar(255) DEFAULT NULL,
  `DateDeploiement` date DEFAULT NULL,
  `NumSerie` varchar(255) DEFAULT NULL,
  `IDTechnicien` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDDeploiement`),
  UNIQUE KEY `IDDeploiement` (`IDDeploiement`),
  KEY `idx_deploiement_numserie` (`NumSerie`),
  KEY `idx_deploiement_idtechnicien` (`IDTechnicien`),
  CONSTRAINT `Deploiement_ibfk_1` FOREIGN KEY (`NumSerie`) REFERENCES `Instance` (`NumSerie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Deploiement_ibfk_3` FOREIGN KEY (`IDTechnicien`) REFERENCES `Technicien` (`IDTechnicien`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Deploiement`
--

LOCK TABLES `Deploiement` WRITE;
/*!40000 ALTER TABLE `Deploiement` DISABLE KEYS */;
INSERT INTO `Deploiement` VALUES
(1,'123 Peachtree Street NE, Atlanta, GA 30303, USA','2024-06-10','CD142ZE',1),
(2,'500 Woodward Avenue, Detroit, MI 48226, USA','2023-12-24','HY698XS',2),
(3,'10 Rue de Rivoli, 75004 Paris, France','2022-01-15','LG627ER',4),
(4,'15 Avenue Montaigne, 75008 Paris, France','2024-02-23','FC287W',4),
(5,'32 Rue des Archives, 75004 Paris, France','2023-08-21','NJ987PL',3),
(6,'12 Rue de l\'Église, 92320 Châtillon, France','2023-04-12','NX200DF',1),
(7,'233 S Wacker Dr, Chicago, IL 60606, USA','2021-02-15','SQ732RE',2),
(8,'701 5th Ave, Seattle, WA 98104, USA','2021-05-20','FT814TY',4),
(9,'500 S Buena Vista St, Burbank, CA 91521, USA','2023-03-15','PM701ZM',1),
(10,'100 Winchester Circle, Los Gatos, CA 95032, USA','2023-11-28','FO346RW',2),
(11,'1 Rocket Road, Hawthorne, CA 90250, USA','2022-04-30','EP466SZ',3),
(12,'3055 Clearview Way, San Mateo, CA 94402, USA','2021-08-10','UH944SU',3);
/*!40000 ALTER TABLE `Deploiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Disque`
--

DROP TABLE IF EXISTS `Disque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Disque` (
  `IDDisque` int(11) NOT NULL AUTO_INCREMENT,
  `TypeDisque` varchar(255) DEFAULT NULL,
  `TailleDisque` bigint(20) DEFAULT NULL,
  `Quantité` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDDisque`),
  UNIQUE KEY `IDDisque` (`IDDisque`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disque`
--

LOCK TABLES `Disque` WRITE;
/*!40000 ALTER TABLE `Disque` DISABLE KEYS */;
INSERT INTO `Disque` VALUES
(1,'SSD',128,1),
(2,'HDD',1000,1),
(3,'HDD',500,2),
(4,'NVMe',250,4),
(5,'SSD',1000,2),
(6,'SSD',500,2),
(7,'HDD',1000,3),
(8,'SSD',256,1),
(9,'HDD',2000,4),
(10,'SSD',128,2),
(11,'HDD',4000,2),
(12,'SSD',1000,3),
(13,'HDD',500,5),
(14,'NVMe',500,2),
(15,'NVMe',1000,3);
/*!40000 ALTER TABLE `Disque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dysfonctionnement`
--

DROP TABLE IF EXISTS `Dysfonctionnement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dysfonctionnement` (
  `IDDysfonctionnement` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) DEFAULT NULL,
  `Horodatage` datetime DEFAULT NULL,
  `NumSerie` varchar(255) DEFAULT NULL,
  `IDTechnicien` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDDysfonctionnement`),
  UNIQUE KEY `IDDysfonctionnement` (`IDDysfonctionnement`),
  KEY `idx_dysfonctionnement_numserie` (`NumSerie`),
  KEY `idx_dysfonctionnement_idtechnicien` (`IDTechnicien`),
  CONSTRAINT `Dysfonctionnement_ibfk_1` FOREIGN KEY (`IDTechnicien`) REFERENCES `Technicien` (`IDTechnicien`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Dysfonctionnement_ibfk_2` FOREIGN KEY (`NumSerie`) REFERENCES `Instance` (`NumSerie`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dysfonctionnement`
--

LOCK TABLES `Dysfonctionnement` WRITE;
/*!40000 ALTER TABLE `Dysfonctionnement` DISABLE KEYS */;
INSERT INTO `Dysfonctionnement` VALUES
(1,'Arrêt du Harvester','2024-04-16 14:32:12','PM701ZM',4),
(2,'Speedtest ne marche pas','2023-09-21 09:02:55','NJ987PL',2);
/*!40000 ALTER TABLE `Dysfonctionnement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entreprise`
--

DROP TABLE IF EXISTS `Entreprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Entreprise` (
  `IDEntreprise` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) DEFAULT NULL,
  `AdresseSiege` varchar(255) DEFAULT NULL,
  `SIRET` varchar(255) DEFAULT NULL,
  `ContactPrincipal` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDEntreprise`),
  UNIQUE KEY `IDEntreprise` (`IDEntreprise`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entreprise`
--

LOCK TABLES `Entreprise` WRITE;
/*!40000 ALTER TABLE `Entreprise` DISABLE KEYS */;
INSERT INTO `Entreprise` VALUES
(1,'NFL-IT','1234 Rue Kansas City, Kansas City, MO, États-Unis','12345678901234','john.smith@nfl-it.com'),
(2,'Google France','8 Rue de Londres, 75009 Paris, France','44306184100043','contact@google.fr'),
(3,'Amazon France','67 Boulevard du Général Leclerc, 92110 Clichy, France','43180379000049','contact@amazon.fr'),
(4,'Microsoft Corporation','One Microsoft Way, Redmond, WA 98052, États-Unis','77566230700090','contact@microsoft.com'),
(5,'Apple Inc','One Apple Park Way, Cupertino, CA 95014, États-Unis','61685464700017','contact@apple.com'),
(6,'Tesla France','18 Rue de l\'Université, 75007 Paris, France','80522538500019','contact@tesla.fr'),
(7,'Atlanta Falcon','1 Letterman Dr, Atlanta, USA','98765432101234','george.lucas@falcon.com'),
(8,'Detroit Lions','1200 Park Ave, Detroit, USA','87654321012345','ed.catmull@detroit.com'),
(9,'Carrefour','93 Avenue de Paris, 91300 Massy, France','38456067800035','pierre.durand@carrefour.com'),
(10,'BNP Paribas','16 Boulevard des Italiens, 75009 Paris, France','54201607400089','marie.curie@bnpparibas.com'),
(11,'L\'Oréal','41 Rue Martre, 92110 Clichy, France','63201210000150','sophie.martin@loreal.com'),
(12,'Renault','13-15 Quai Alphonse le Gallo, 92100 Boulogne-Billancourt, France','78012998712345','jean.valjean@renault.com'),
(13,'Boeing','100 N Riverside Plaza, Chicago, IL 60606, USA','12345678912345','alice.jones@boeing.com'),
(14,'Starbucks','2401 Utah Ave S, Seattle, WA 98134, USA','23456789123456','bob.smith@starbucks.com'),
(15,'Walt Disney Company','500 S Buena Vista St, Burbank, CA 91521, USA','34567891234567','mickey.mouse@disney.com'),
(16,'Netflix','100 Winchester Cir, Los Gatos, CA 95032, USA','45678912345678','reed.hastings@netflix.com'),
(17,'SpaceX','1 Rocket Rd, Hawthorne, CA 90250, USA','56789123456789','elon.musk@spacex.com'),
(18,'SolarCity','3055 Clearview Way, San Mateo, CA 94402, USA','67891234567890','lyndon.rive@solarcity.com');
/*!40000 ALTER TABLE `Entreprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `GoogleFrance`
--

DROP TABLE IF EXISTS `GoogleFrance`;
/*!50001 DROP VIEW IF EXISTS `GoogleFrance`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `GoogleFrance` AS SELECT
 1 AS `NumSerie`,
  1 AS `Nom`,
  1 AS `AdresseIPDefaut`,
  1 AS `AdresseIPVPN`,
  1 AS `VersionApplication`,
  1 AS `VersionOS`,
  1 AS `Etat`,
  1 AS `NumeroLicence`,
  1 AS `MaterielFourniParNFL`,
  1 AS `MaterielRecupere`,
  1 AS `IDEntrepriseClient`,
  1 AS `IDConf` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Instance`
--

DROP TABLE IF EXISTS `Instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Instance` (
  `NumSerie` varchar(255) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `AdresseIPDefaut` varchar(255) DEFAULT NULL,
  `AdresseIPVPN` varchar(255) DEFAULT NULL,
  `VersionApplication` varchar(255) DEFAULT NULL,
  `VersionOS` varchar(255) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `NumeroLicence` varchar(255) DEFAULT NULL,
  `MaterielFourniParNFL` tinyint(1) DEFAULT NULL,
  `MaterielRecupere` tinyint(1) DEFAULT NULL,
  `IDEntrepriseClient` int(11) DEFAULT NULL,
  `IDConf` int(11) DEFAULT NULL,
  PRIMARY KEY (`NumSerie`),
  UNIQUE KEY `NumSerie` (`NumSerie`),
  KEY `idx_instance_identrepriseclient` (`IDEntrepriseClient`),
  KEY `idx_instance_idconf` (`IDConf`),
  CONSTRAINT `Instance_Conf_FK` FOREIGN KEY (`IDConf`) REFERENCES `Conf` (`IDConf`),
  CONSTRAINT `Instance_ibfk_3` FOREIGN KEY (`IDEntrepriseClient`) REFERENCES `Entreprise` (`IDEntreprise`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instance`
--

LOCK TABLES `Instance` WRITE;
/*!40000 ALTER TABLE `Instance` DISABLE KEYS */;
INSERT INTO `Instance` VALUES
('CD142ZE','HarvesterAtlanta','192.168.1.10','10.0.10.1','V2.0','Debian 12.5','Connectée','59731542',1,0,7,2),
('EP466SZ','HarvesterSpaceX','192.168.80.148','10.0.25.58','V3.7','Windows 10','Connectée','17457420',1,0,17,10),
('FC287W','HarvesterBNPParibas','192.168.10.9','10.0.0.12','V1.0','Debian 11','Connectée','12486970',1,0,10,4),
('FO346RW','HarvesterNetflix','192.168.99.45','10.0.9.15','V3.6','Windows 11','Connectée','69364710',1,0,16,11),
('FT814TY','HarvesterStarbucks','192.168.36.29','10.0.0.28','V1.2','Debian 11','Connectée','65632587',1,0,14,8),
('HY698XS','HarvesterDetroit','192.168.20.47','10.0.0.20','V2.2','Windows 10','Connectée','24835572',1,0,8,1),
('LG627ER','HarvesterCarrefour','192.168.14.10','10.0.0.30','V1.4','Windows 11','Connectée','41387447',1,1,9,3),
('NJ987PL','HarvesterLoreal','192.168.9.17','10.0.0.17','V5','Windows 10','Connectée','95124384',1,0,11,5),
('NX200DF','HarvesterRenault','192.168.80.100','10.0.10.4','V1.4.5','Windows 10','Connectée','74654582',1,0,12,7),
('PM701ZM','HarvesterDisney','192.168.40.187','10.0.0.59','V1','Debian 12.5','Connectée','79544832',1,0,15,9),
('SQ732RE','HarvesterBoeing','192.168.60.25','10.0.74.25','V3.1','Debian 12.5','Connectée','28498699',1,1,13,6),
('UH944SU','HarvesterSolarCity','192.168.11.57','10.0.68.99','V2.4.1','Debian 11','Connectée','98524739',1,1,18,12);
/*!40000 ALTER TABLE `Instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Instance_Script`
--

DROP TABLE IF EXISTS `Instance_Script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Instance_Script` (
  `IDInstance` varchar(255) DEFAULT NULL,
  `IDScript` int(11) DEFAULT NULL,
  KEY `Instance_Script_Script_FK` (`IDScript`),
  KEY `Instance_Script_Instance_FK` (`IDInstance`),
  CONSTRAINT `Instance_Script_Instance_FK` FOREIGN KEY (`IDInstance`) REFERENCES `Instance` (`NumSerie`),
  CONSTRAINT `Instance_Script_Script_FK` FOREIGN KEY (`IDScript`) REFERENCES `Script` (`IDScript`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instance_Script`
--

LOCK TABLES `Instance_Script` WRITE;
/*!40000 ALTER TABLE `Instance_Script` DISABLE KEYS */;
INSERT INTO `Instance_Script` VALUES
('CD142ZE',1),
('CD142ZE',3),
('HY698XS',2),
('HY698XS',4),
('HY698XS',6),
('LG627ER',9),
('LG627ER',10),
('FC287W',1),
('FC287W',5),
('FC287W',7),
('NJ987PL',2),
('NX200DF',2),
('NX200DF',8),
('SQ732RE',1),
('SQ732RE',1),
('SQ732RE',1),
('SQ732RE',1),
('FT814TY',3),
('FT814TY',1),
('PM701ZM',1),
('PM701ZM',3),
('PM701ZM',5),
('PM701ZM',8),
('PM701ZM',7),
('FO346RW',9),
('FO346RW',10),
('EP466SZ',2),
('EP466SZ',4),
('EP466SZ',6),
('EP466SZ',8),
('UH944SU',5),
('UH944SU',1),
('UH944SU',3);
/*!40000 ALTER TABLE `Instance_Script` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prestataire`
--

DROP TABLE IF EXISTS `Prestataire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prestataire` (
  `IDPrestataire` int(11) NOT NULL AUTO_INCREMENT,
  `IDEntreprise` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDPrestataire`),
  UNIQUE KEY `IDPrestataire` (`IDPrestataire`),
  KEY `IDEntreprise` (`IDEntreprise`),
  CONSTRAINT `Prestataire_ibfk_1` FOREIGN KEY (`IDEntreprise`) REFERENCES `Entreprise` (`IDEntreprise`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prestataire`
--

LOCK TABLES `Prestataire` WRITE;
/*!40000 ALTER TABLE `Prestataire` DISABLE KEYS */;
INSERT INTO `Prestataire` VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6);
/*!40000 ALTER TABLE `Prestataire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Redemarrage`
--

DROP TABLE IF EXISTS `Redemarrage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Redemarrage` (
  `IDRedemarrage` int(11) NOT NULL AUTO_INCREMENT,
  `Horodatage` datetime DEFAULT NULL,
  `Motif` varchar(255) DEFAULT NULL,
  `NumSerie` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDRedemarrage`),
  UNIQUE KEY `IDRedemarrage` (`IDRedemarrage`),
  KEY `NumSerie` (`NumSerie`),
  CONSTRAINT `Redemarrage_ibfk_1` FOREIGN KEY (`NumSerie`) REFERENCES `Instance` (`NumSerie`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Redemarrage`
--

LOCK TABLES `Redemarrage` WRITE;
/*!40000 ALTER TABLE `Redemarrage` DISABLE KEYS */;
INSERT INTO `Redemarrage` VALUES
(1,'2024-04-16 15:17:46','Redémarrage suite à l\'arret du Harvester','PM701ZM'),
(2,'2024-04-02 11:12:34','Redémarrage suite à la mise à jour du système pour appliquer les nouvelles modifications.','PM701ZM'),
(3,'2024-03-28 08:54:22','Redémarrage planifié pour effectuer une maintenance périodique du système.','PM701ZM'),
(4,'2024-02-02 23:02:20','Redémarrage nécessaire suite à des changements majeurs dans la configuration du système ou des logiciels.','PM701ZM'),
(5,'2024-01-20 17:56:58','Redémarrage pour résoudre une panne matérielle détectée et réinitialiser les composants affectés.','PM701ZM'),
(6,'2024-01-15 19:29:19','Redémarrage pour résoudre des problèmes de performance et restaurer le fonctionnement optimal du système.','PM701ZM'),
(7,'2023-12-10 12:08:13','Redémarrage suite à l\'arret du Harvester','NJ987PL');
/*!40000 ALTER TABLE `Redemarrage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Script`
--

DROP TABLE IF EXISTS `Script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Script` (
  `IDScript` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) DEFAULT NULL,
  `Version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDScript`),
  UNIQUE KEY `IDScript` (`IDScript`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Script`
--

LOCK TABLES `Script` WRITE;
/*!40000 ALTER TABLE `Script` DISABLE KEYS */;
INSERT INTO `Script` VALUES
(1,'HarvesterDEB.py','V2.5'),
(2,'HarvesterWIN10.py','V1.0.1'),
(3,'UpdateHarvesterDEB.py','V1'),
(4,'UpdateHarvesterWIN10.py','V2.1'),
(5,'ExportDataXMLDEB.py','V1.0'),
(6,'ExportDataXMLWIN10.py','V1.2'),
(7,'ScanNetwork.py','V3.0'),
(8,'SpeedTest.py','V1.5'),
(9,'HarvesterWIN11.py','V1.1'),
(10,'UpdateHarvesterWIN11.py','V1.1');
/*!40000 ALTER TABLE `Script` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Technicien`
--

DROP TABLE IF EXISTS `Technicien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Technicien` (
  `IDTechnicien` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDTechnicien`),
  UNIQUE KEY `IDTechnicien` (`IDTechnicien`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Technicien`
--

LOCK TABLES `Technicien` WRITE;
/*!40000 ALTER TABLE `Technicien` DISABLE KEYS */;
INSERT INTO `Technicien` VALUES
(1,'Michel '),
(2,'Sophie'),
(3,'Anthony'),
(4,'Céline');
/*!40000 ALTER TABLE `Technicien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'MSPR'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRestartNumber` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getRestartNumber`()
BEGIN
    SELECT
        i.NumSerie,
        i.Nom,
        COUNT(r.IDRedemarrage) AS nombre_de_redemarrages
    FROM
        Instance i
    JOIN Redemarrage r ON
        i.NumSerie = r.NumSerie
    GROUP BY
        i.NumSerie,
        i.Nom
    HAVING
        COUNT(r.IDRedemarrage) > 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `GoogleFrance`
--

/*!50001 DROP VIEW IF EXISTS `GoogleFrance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `GoogleFrance` AS select `i`.`NumSerie` AS `NumSerie`,`i`.`Nom` AS `Nom`,`i`.`AdresseIPDefaut` AS `AdresseIPDefaut`,`i`.`AdresseIPVPN` AS `AdresseIPVPN`,`i`.`VersionApplication` AS `VersionApplication`,`i`.`VersionOS` AS `VersionOS`,`i`.`Etat` AS `Etat`,`i`.`NumeroLicence` AS `NumeroLicence`,`i`.`MaterielFourniParNFL` AS `MaterielFourniParNFL`,`i`.`MaterielRecupere` AS `MaterielRecupere`,`i`.`IDEntrepriseClient` AS `IDEntrepriseClient`,`i`.`IDConf` AS `IDConf` from (((((`Instance` `i` join `Entreprise` `e` on(`i`.`IDEntrepriseClient` = `e`.`IDEntreprise`)) join `ClientFinal` `cf` on(`e`.`IDEntreprise` = `cf`.`IDEntreprise`)) join `ClientPrestataire` `cp` on(`cf`.`IDClientFinal` = `cp`.`IDClientFinal`)) join `Prestataire` `p` on(`cp`.`IDPrestataire` = `p`.`IDPrestataire`)) join `Deploiement` `d` on(`i`.`NumSerie` = `d`.`NumSerie`)) where `p`.`IDPrestataire` = 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-01 12:24:07
