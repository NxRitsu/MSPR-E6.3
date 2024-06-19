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
  PRIMARY KEY (`IDConf`),
  UNIQUE KEY `IDConf` (`IDConf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Conf`
--

LOCK TABLES `Conf` WRITE;
/*!40000 ALTER TABLE `Conf` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contrat`
--

LOCK TABLES `Contrat` WRITE;
/*!40000 ALTER TABLE `Contrat` DISABLE KEYS */;
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
  `DateDeploiement` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Deploiement`
--

LOCK TABLES `Deploiement` WRITE;
/*!40000 ALTER TABLE `Deploiement` DISABLE KEYS */;
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
  `TailleDisque` int(11) DEFAULT NULL,
  `Quantité` int(11) DEFAULT NULL,
  `IDConf` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDDisque`),
  UNIQUE KEY `IDDisque` (`IDDisque`),
  KEY `IDConf` (`IDConf`),
  CONSTRAINT `Disque_ibfk_1` FOREIGN KEY (`IDConf`) REFERENCES `Conf` (`IDConf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disque`
--

LOCK TABLES `Disque` WRITE;
/*!40000 ALTER TABLE `Disque` DISABLE KEYS */;
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
  `AdresseDeploiement` varchar(255) DEFAULT NULL,
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
(1,'NFL-IT','1234 Rue Kansas City, Kansas City, MO, États-Unis','10 Rue de Lille, 59100 Roubaix, France','12345678901234','john.smith@nfl-it.com',NULL),
(2,'Google France','8 Rue de Londres, 75009 Paris, France','4 Rue de Londres, 75009 Paris, France','44306184100043','contact@google.fr',NULL),
(3,'Amazon France','67 Boulevard du Général Leclerc, 92110 Clichy, France','31 Rue des Deux Gares, 75010 Paris, France','43180379000049','contact@amazon.fr',NULL),
(4,'Microsoft Corporation','One Microsoft Way, Redmond, WA 98052, États-Unis','1290 Avenue of the Americas, New York, NY 10104, États-Unis','77566230700090','contact@microsoft.com',NULL),
(5,'Apple Inc','One Apple Park Way, Cupertino, CA 95014, États-Unis','767 Fifth Avenue, New York, NY 10153, États-Unis','61685464700017','contact@apple.com',NULL),
(6,'Tesla France','18 Rue de l\'Université, 75007 Paris, France','10 Avenue Georges V, 75008 Paris, France','80522538500019','contact@tesla.fr',NULL),
(7,'Atlanta Falcon','1 Letterman Dr, Atlanta, USA','2 Marina Blvd, Atlanta, USA','98765432101234','george.lucas@falcon.com',NULL),
(8,'Detroit Lions','1200 Park Ave, Detroit, USA','5000 Hollis St, Detroit, USA','87654321012345','ed.catmull@detroit.com',NULL),
(9,'Carrefour','93 Avenue de Paris, 91300 Massy, France','33 Rue Carnot, 94270 Le Kremlin-Bicêtre, France','38456067800035','pierre.durand@carrefour.com',NULL),
(10,'BNP Paribas','16 Boulevard des Italiens, 75009 Paris, France','14 Rue Bergère, 75009 Paris, France','54201607400089','marie.curie@bnpparibas.com',NULL),
(11,'L\'Oréal','41 Rue Martre, 92110 Clichy, France','14 Rue Royale, 75008 Paris, France','63201210000150','sophie.martin@loreal.com',NULL),
(12,'Renault','13-15 Quai Alphonse le Gallo, 92100 Boulogne-Billancourt, France','1 Avenue du Golf, 78288 Guyancourt, France','78012998712345','jean.valjean@renault.com',NULL),
(13,'Boeing','100 N Riverside Plaza, Chicago, IL 60606, USA','200 S Wacker Dr, Chicago, IL 60606, USA','12345678912345','alice.jones@boeing.com',NULL),
(14,'Starbucks','2401 Utah Ave S, Seattle, WA 98134, USA','2022 S Jackson St, Seattle, WA 98144, USA','23456789123456','bob.smith@starbucks.com',NULL),
(15,'Walt Disney Company','500 S Buena Vista St, Burbank, CA 91521, USA','1313 Disneyland Dr, Anaheim, CA 92802, USA','34567891234567','mickey.mouse@disney.com',NULL),
(16,'Netflix','100 Winchester Cir, Los Gatos, CA 95032, USA','5808 Sunset Blvd, Los Angeles, CA 90028, USA','45678912345678','reed.hastings@netflix.com',NULL),
(17,'SpaceX','1 Rocket Rd, Hawthorne, CA 90250, USA','881 L Street, Mountain View, CA 94043, USA','56789123456789','elon.musk@spacex.com',NULL),
(18,'SolarCity','3055 Clearview Way, San Mateo, CA 94402, USA','351 W Evelyn Ave, Mountain View, CA 94041, USA','67891234567890','lyndon.rive@solarcity.com',NULL);
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
  `IDInstance_script` int(11) DEFAULT NULL,
  `IDDeploiement` int(11) DEFAULT NULL,
  `IDEntreprise` int(11) DEFAULT NULL,
  PRIMARY KEY (`NumSerie`),
  UNIQUE KEY `NumSerie` (`NumSerie`),
  KEY `IDInstance_script` (`IDInstance_script`),
  KEY `IDDeploiement` (`IDDeploiement`),
  KEY `IDEntreprise` (`IDEntreprise`),
  CONSTRAINT `Instance_ibfk_1` FOREIGN KEY (`IDInstance_script`) REFERENCES `Instance_Script` (`IDInstance_script`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Instance_ibfk_2` FOREIGN KEY (`IDDeploiement`) REFERENCES `Deploiement` (`IDDeploiement`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Instance_ibfk_3` FOREIGN KEY (`IDEntreprise`) REFERENCES `Entreprise` (`IDEntreprise`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instance`
--

LOCK TABLES `Instance` WRITE;
/*!40000 ALTER TABLE `Instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `Instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Instance_Script`
--

DROP TABLE IF EXISTS `Instance_Script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Instance_Script` (
  `IDInstance_script` int(11) NOT NULL AUTO_INCREMENT,
  `IDScript` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDInstance_script`),
  UNIQUE KEY `IDInstance_script` (`IDInstance_script`),
  KEY `IDScript` (`IDScript`),
  CONSTRAINT `Instance_Script_ibfk_1` FOREIGN KEY (`IDScript`) REFERENCES `Script` (`IDScript`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instance_Script`
--

LOCK TABLES `Instance_Script` WRITE;
/*!40000 ALTER TABLE `Instance_Script` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Script`
--

LOCK TABLES `Script` WRITE;
/*!40000 ALTER TABLE `Script` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Technicien`
--

LOCK TABLES `Technicien` WRITE;
/*!40000 ALTER TABLE `Technicien` DISABLE KEYS */;
INSERT INTO `Technicien` VALUES
(1,'Michel '),
(2,'Sophie');
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

-- Dump completed on 2024-06-19 10:01:48
