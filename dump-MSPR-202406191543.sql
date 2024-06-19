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
  KEY `IDEntreprise` (`IDEntreprise`),
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
  KEY `IDPrestataire` (`IDPrestataire`),
  KEY `IDClientFinal` (`IDClientFinal`),
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
(4,'Intel Core i3-10100',8,3);
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
  KEY `NumSerie` (`NumSerie`),
  KEY `IDEntreprise` (`IDEntreprise`),
  CONSTRAINT `Contrat_ibfk_1` FOREIGN KEY (`NumSerie`) REFERENCES `Instance` (`NumSerie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Contrat_ibfk_2` FOREIGN KEY (`IDEntreprise`) REFERENCES `Entreprise` (`IDEntreprise`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contrat`
--

LOCK TABLES `Contrat` WRITE;
/*!40000 ALTER TABLE `Contrat` DISABLE KEYS */;
INSERT INTO `Contrat` VALUES
(1,'2024-06-02','2025-06-02',7,'CD142ZE'),
(2,'2023-12-10','2026-12-31',8,'HY698XS');
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
  `IDEntreprise` int(11) DEFAULT NULL,
  `IDTechnicien` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDDeploiement`),
  UNIQUE KEY `IDDeploiement` (`IDDeploiement`),
  KEY `NumSerie` (`NumSerie`),
  KEY `IDEntreprise` (`IDEntreprise`),
  KEY `IDTechnicien` (`IDTechnicien`),
  CONSTRAINT `Deploiement_ibfk_1` FOREIGN KEY (`NumSerie`) REFERENCES `Instance` (`NumSerie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Deploiement_ibfk_2` FOREIGN KEY (`IDEntreprise`) REFERENCES `Entreprise` (`IDEntreprise`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Deploiement_ibfk_3` FOREIGN KEY (`IDTechnicien`) REFERENCES `Technicien` (`IDTechnicien`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Deploiement`
--

LOCK TABLES `Deploiement` WRITE;
/*!40000 ALTER TABLE `Deploiement` DISABLE KEYS */;
INSERT INTO `Deploiement` VALUES
(1,'123 Peachtree Street NE, Atlanta, GA 30303, USA','2024-06-10','CD142ZE',7,1),
(2,'500 Woodward Avenue, Detroit, MI 48226, USA','2023-12-24','HY698XS',8,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disque`
--

LOCK TABLES `Disque` WRITE;
/*!40000 ALTER TABLE `Disque` DISABLE KEYS */;
INSERT INTO `Disque` VALUES
(1,'SSD',125,1),
(2,'HDD',1000,1),
(3,'HDD',500,2),
(4,'NVMe',250,4),
(5,'SSD',1000,2);
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
  KEY `IDTechnicien` (`IDTechnicien`),
  KEY `NumSerie` (`NumSerie`),
  CONSTRAINT `Dysfonctionnement_ibfk_1` FOREIGN KEY (`IDTechnicien`) REFERENCES `Technicien` (`IDTechnicien`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Dysfonctionnement_ibfk_2` FOREIGN KEY (`NumSerie`) REFERENCES `Instance` (`NumSerie`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dysfonctionnement`
--

LOCK TABLES `Dysfonctionnement` WRITE;
/*!40000 ALTER TABLE `Dysfonctionnement` DISABLE KEYS */;
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
  `IDDeploiement` int(11) DEFAULT NULL,
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
(1,'NFL-IT','1234 Rue Kansas City, Kansas City, MO, États-Unis','12345678901234','john.smith@nfl-it.com',NULL),
(2,'Google France','8 Rue de Londres, 75009 Paris, France','44306184100043','contact@google.fr',NULL),
(3,'Amazon France','67 Boulevard du Général Leclerc, 92110 Clichy, France','43180379000049','contact@amazon.fr',NULL),
(4,'Microsoft Corporation','One Microsoft Way, Redmond, WA 98052, États-Unis','77566230700090','contact@microsoft.com',NULL),
(5,'Apple Inc','One Apple Park Way, Cupertino, CA 95014, États-Unis','61685464700017','contact@apple.com',NULL),
(6,'Tesla France','18 Rue de l\'Université, 75007 Paris, France','80522538500019','contact@tesla.fr',NULL),
(7,'Atlanta Falcon','1 Letterman Dr, Atlanta, USA','98765432101234','george.lucas@falcon.com',NULL),
(8,'Detroit Lions','1200 Park Ave, Detroit, USA','87654321012345','ed.catmull@detroit.com',NULL),
(9,'Carrefour','93 Avenue de Paris, 91300 Massy, France','38456067800035','pierre.durand@carrefour.com',NULL),
(10,'BNP Paribas','16 Boulevard des Italiens, 75009 Paris, France','54201607400089','marie.curie@bnpparibas.com',NULL),
(11,'L\'Oréal','41 Rue Martre, 92110 Clichy, France','63201210000150','sophie.martin@loreal.com',NULL),
(12,'Renault','13-15 Quai Alphonse le Gallo, 92100 Boulogne-Billancourt, France','78012998712345','jean.valjean@renault.com',NULL),
(13,'Boeing','100 N Riverside Plaza, Chicago, IL 60606, USA','12345678912345','alice.jones@boeing.com',NULL),
(14,'Starbucks','2401 Utah Ave S, Seattle, WA 98134, USA','23456789123456','bob.smith@starbucks.com',NULL),
(15,'Walt Disney Company','500 S Buena Vista St, Burbank, CA 91521, USA','34567891234567','mickey.mouse@disney.com',NULL),
(16,'Netflix','100 Winchester Cir, Los Gatos, CA 95032, USA','45678912345678','reed.hastings@netflix.com',NULL),
(17,'SpaceX','1 Rocket Rd, Hawthorne, CA 90250, USA','56789123456789','elon.musk@spacex.com',NULL),
(18,'SolarCity','3055 Clearview Way, San Mateo, CA 94402, USA','67891234567890','lyndon.rive@solarcity.com',NULL);
/*!40000 ALTER TABLE `Entreprise` ENABLE KEYS */;
UNLOCK TABLES;

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
  `IDDeploiement` int(11) DEFAULT NULL,
  `IDEntrepriseClient` int(11) DEFAULT NULL,
  `IDConf` int(11) DEFAULT NULL,
  PRIMARY KEY (`NumSerie`),
  UNIQUE KEY `NumSerie` (`NumSerie`),
  KEY `IDDeploiement` (`IDDeploiement`),
  KEY `IDEntreprise` (`IDEntrepriseClient`),
  KEY `Instance_Conf_FK` (`IDConf`),
  CONSTRAINT `Instance_Conf_FK` FOREIGN KEY (`IDConf`) REFERENCES `Conf` (`IDConf`),
  CONSTRAINT `Instance_ibfk_2` FOREIGN KEY (`IDDeploiement`) REFERENCES `Deploiement` (`IDDeploiement`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Instance_ibfk_3` FOREIGN KEY (`IDEntrepriseClient`) REFERENCES `Entreprise` (`IDEntreprise`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instance`
--

LOCK TABLES `Instance` WRITE;
/*!40000 ALTER TABLE `Instance` DISABLE KEYS */;
INSERT INTO `Instance` VALUES
('CD142ZE','HarvesterAtlanta','192.168.1.10','10.0.10.1','V2.0','Debian 12.5','Connectée','59731542',1,0,1,7,2),
('HY698XS','HarvesterDetroit','192.168.20.47','10.0.0.20','V2.2','Windows 10','Connectée','24835572',1,0,2,8,1);
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
('CD142ZE',3);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Redemarrage`
--

LOCK TABLES `Redemarrage` WRITE;
/*!40000 ALTER TABLE `Redemarrage` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
(6,'ExportDataWIN10.py','V1.2'),
(7,'ScanNetwork.py','V3.0'),
(8,'SpeedTest.py','V1.5');
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-19 15:43:15
