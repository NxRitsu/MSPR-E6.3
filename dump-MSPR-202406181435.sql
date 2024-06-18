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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClientFinal`
--

LOCK TABLES `ClientFinal` WRITE;
/*!40000 ALTER TABLE `ClientFinal` DISABLE KEYS */;
INSERT INTO `ClientFinal` VALUES
(1,2),
(2,2),
(3,3),
(4,3),
(5,4),
(6,4),
(7,5),
(8,5),
(9,6),
(10,6);
/*!40000 ALTER TABLE `ClientFinal` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
(6,'Tesla France','18 Rue de l\'Université, 75007 Paris, France','10 Avenue Georges V, 75008 Paris, France','80522538500019','contact@tesla.fr',NULL);
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
  `MaterielFourniParNFL` varchar(255) DEFAULT NULL,
  `MaterielRecupere` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prestataire`
--

LOCK TABLES `Prestataire` WRITE;
/*!40000 ALTER TABLE `Prestataire` DISABLE KEYS */;
INSERT INTO `Prestataire` VALUES
(1,2),
(2,3),
(3,4),
(4,5);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Technicien`
--

LOCK TABLES `Technicien` WRITE;
/*!40000 ALTER TABLE `Technicien` DISABLE KEYS */;
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

-- Dump completed on 2024-06-18 14:35:19
