-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: tec
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `avariya`
--

DROP TABLE IF EXISTS `avariya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avariya` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Chas_viniknenya` datetime DEFAULT NULL,
  `Type_podii` varchar(15) NOT NULL,
  `Zadiyaniy_block` varchar(15) NOT NULL,
  `FK_Personal_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Personal_ID` (`FK_Personal_ID`),
  CONSTRAINT `avariya_ibfk_1` FOREIGN KEY (`FK_Personal_ID`) REFERENCES `tehnichnyi_personal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avariya`
--

LOCK TABLES `avariya` WRITE;
/*!40000 ALTER TABLE `avariya` DISABLE KEYS */;
INSERT INTO `avariya` VALUES (1,'2025-10-01 14:30:00','warning','Block 1',1),(2,'2025-10-02 08:15:00','turn off','Block 3',2),(3,'2025-10-01 22:45:00','warning','Block 5',3),(4,'2025-10-03 05:00:00','turn off','Block 7',4),(5,'2025-10-03 11:20:00','warning','Block 2',5),(6,'2025-10-01 17:40:00','turn off','Block 4',6),(7,'2025-10-02 02:10:00','warning','Block 6',7),(8,'2025-10-01 15:55:00','turn off','Block 8',8),(9,'2025-10-03 09:00:00','warning','Block 10',9),(10,'2025-10-03 20:05:00','turn off','Block 9',10);
/*!40000 ALTER TABLE `avariya` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electrichiy_generator`
--

DROP TABLE IF EXISTS `electrichiy_generator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `electrichiy_generator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Vihidna_napruga` float NOT NULL,
  `Aktivna_potuzhnisst` float NOT NULL,
  `Reaktivna_potuzhnisst` float NOT NULL,
  `FK_Turbina_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Turbina_ID` (`FK_Turbina_ID`),
  CONSTRAINT `electrichiy_generator_ibfk_1` FOREIGN KEY (`FK_Turbina_ID`) REFERENCES `turbina` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electrichiy_generator`
--

LOCK TABLES `electrichiy_generator` WRITE;
/*!40000 ALTER TABLE `electrichiy_generator` DISABLE KEYS */;
INSERT INTO `electrichiy_generator` VALUES (1,15.5,270,42,1),(2,15.75,285.5,45.1,2),(3,16.01,300,50,3),(4,15.8,290,46,4),(5,15.6,275,43,5),(6,15.9,295,47,6),(7,15.4,260,40,7),(8,16.1,310,52,8),(9,15.7,280,44,9),(10,15.85,292,46.5,10);
/*!40000 ALTER TABLE `electrichiy_generator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generatorniy_block`
--

DROP TABLE IF EXISTS `generatorniy_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generatorniy_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nomer_blocka` int(10) NOT NULL,
  `Vstanovlena_potuzhnisst` float NOT NULL,
  `Potochna_potuzhnisst` float NOT NULL,
  `FK_Systema_ID` int(11) NOT NULL,
  `FK_Generator_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Systema_ID` (`FK_Systema_ID`),
  KEY `FK_Generator_ID` (`FK_Generator_ID`),
  CONSTRAINT `generatorniy_block_ibfk_1` FOREIGN KEY (`FK_Systema_ID`) REFERENCES `sistema_ochiszchenya` (`id`),
  CONSTRAINT `generatorniy_block_ibfk_2` FOREIGN KEY (`FK_Generator_ID`) REFERENCES `electrichiy_generator` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generatorniy_block`
--

LOCK TABLES `generatorniy_block` WRITE;
/*!40000 ALTER TABLE `generatorniy_block` DISABLE KEYS */;
INSERT INTO `generatorniy_block` VALUES (1,1,300,285.5,1,1),(2,2,280,270,2,1),(3,3,320,300,3,2),(4,4,300,290,4,2),(5,5,280,275,5,3),(6,6,320,295,6,3),(7,7,280,260,7,4),(8,8,340,310,8,4),(9,9,300,280,9,5),(10,10,320,292,10,5);
/*!40000 ALTER TABLE `generatorniy_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kotel`
--

DROP TABLE IF EXISTS `kotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Tisk_pari` float NOT NULL,
  `Temparatura_pari` float NOT NULL,
  `Vitrata_paliva` float NOT NULL,
  `Riven_vodi` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kotel`
--

LOCK TABLES `kotel` WRITE;
/*!40000 ALTER TABLE `kotel` DISABLE KEYS */;
INSERT INTO `kotel` VALUES (1,140,560.5,45,75.2),(2,135,550,42,78),(3,145,570,48,70.5),(4,140.5,562,45.5,74),(5,138,555,43.5,76.5),(6,142,565,46.5,72),(7,130,540,40,80),(8,150,580,50,68),(9,139,558,44,77),(10,141,563,46,73.5);
/*!40000 ALTER TABLE `kotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palivo`
--

DROP TABLE IF EXISTS `palivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `palivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Type_paliva` varchar(15) NOT NULL,
  `Potochni_zapasi` float NOT NULL,
  `FK_Kotel_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Kotel_ID` (`FK_Kotel_ID`),
  CONSTRAINT `palivo_ibfk_1` FOREIGN KEY (`FK_Kotel_ID`) REFERENCES `kotel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palivo`
--

LOCK TABLES `palivo` WRITE;
/*!40000 ALTER TABLE `palivo` DISABLE KEYS */;
INSERT INTO `palivo` VALUES (1,'gaz',12000,1),(2,'vugilya',8000,2),(3,'gaz',15000,1),(4,'mazut',5000,3),(5,'vugilya',7500,2),(6,'gaz',13000,1),(7,'mazut',4800,3),(8,'gaz',9000,2),(9,'gaz',10000,1),(10,'mazut',5500,3);
/*!40000 ALTER TABLE `palivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistema_ochiszchenya`
--

DROP TABLE IF EXISTS `sistema_ochiszchenya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistema_ochiszchenya` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Efektivnist_ochiszchenya` float NOT NULL,
  `Riven_vikidiv_SO2` float NOT NULL,
  `Riven_vikidiv_NO2` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema_ochiszchenya`
--

LOCK TABLES `sistema_ochiszchenya` WRITE;
/*!40000 ALTER TABLE `sistema_ochiszchenya` DISABLE KEYS */;
INSERT INTO `sistema_ochiszchenya` VALUES (1,98.5,0.05,0.12),(2,96,0.1,0.15),(3,97.1,0.08,0.11),(4,94.5,0.18,0.25),(5,99,0.03,0.09),(6,95.5,0.14,0.18),(7,97.8,0.07,0.1),(8,93,0.22,0.3),(9,98.8,0.04,0.11),(10,96.5,0.09,0.14);
/*!40000 ALTER TABLE `sistema_ochiszchenya` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tehnichnyi_personal`
--

DROP TABLE IF EXISTS `tehnichnyi_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tehnichnyi_personal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Imya` varchar(15) NOT NULL,
  `Posada` varchar(15) NOT NULL,
  `Dopusk` varchar(15) NOT NULL,
  `Potochna_zmina` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tehnichnyi_personal`
--

LOCK TABLES `tehnichnyi_personal` WRITE;
/*!40000 ALTER TABLE `tehnichnyi_personal` DISABLE KEYS */;
INSERT INTO `tehnichnyi_personal` VALUES (1,'Ivan','OperaatorIII','kniga','2025-10-01'),(2,'Danilo','InjenerIV','listok','2025-10-01'),(3,'Oleksiy','OperatorII','kniga','2025-10-02'),(4,'Yulia','TehnikIII','kniga','2025-10-02'),(5,'Petro','St.InjenerV','listok','2025-10-03'),(6,'Natalya','OperatorIII','kniga','2025-10-03'),(7,'Dmytro','TehnikII','kniga','2025-10-04'),(8,'Viktoriya','InjenerIV','listok','2025-10-04'),(9,'Sergiy','OperatorI','kniga','2025-10-05'),(10,'Tanya','TehnikIII','listok','2025-10-05');
/*!40000 ALTER TABLE `tehnichnyi_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turbina`
--

DROP TABLE IF EXISTS `turbina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turbina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Shvidkist_obertanya` float NOT NULL,
  `Tisk_na_vhodi` float NOT NULL,
  `Tisk_na_vihodi` float NOT NULL,
  `FK_Kotel_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Kotel_ID` (`FK_Kotel_ID`),
  CONSTRAINT `turbina_ibfk_1` FOREIGN KEY (`FK_Kotel_ID`) REFERENCES `kotel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turbina`
--

LOCK TABLES `turbina` WRITE;
/*!40000 ALTER TABLE `turbina` DISABLE KEYS */;
INSERT INTO `turbina` VALUES (1,3000,135,0.05,1),(2,3000,130,0.04,2),(3,3000,140,0.06,3),(4,3000,136,0.05,4),(5,3000,132,0.04,5),(6,3000,138,0.05,6),(7,3000,128,0.03,7),(8,3000,145,0.07,8),(9,3000,134,0.04,9),(10,3000,137,0.05,10);
/*!40000 ALTER TABLE `turbina` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-03 11:08:13
