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
  `Chas_viniknenya` time NOT NULL,
  `Type_podii` float NOT NULL,
  `Zadiyaniy_block` varchar(15) NOT NULL,
  `FK_Personal_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_avarija_personal` (`FK_Personal_ID`),
  CONSTRAINT `fk_avarija_personal` FOREIGN KEY (`FK_Personal_ID`) REFERENCES `tehnichnyi_personal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avariya`
--

LOCK TABLES `avariya` WRITE;
/*!40000 ALTER TABLE `avariya` DISABLE KEYS */;
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
  KEY `fk_generator_turbina` (`FK_Turbina_ID`),
  CONSTRAINT `fk_generator_turbina` FOREIGN KEY (`FK_Turbina_ID`) REFERENCES `turbina` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electrichiy_generator`
--

LOCK TABLES `electrichiy_generator` WRITE;
/*!40000 ALTER TABLE `electrichiy_generator` DISABLE KEYS */;
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
  KEY `fk_genblock_systema` (`FK_Systema_ID`),
  KEY `fk_genblock_generator` (`FK_Generator_ID`),
  CONSTRAINT `fk_genblock_generator` FOREIGN KEY (`FK_Generator_ID`) REFERENCES `electrichiy_generator` (`id`),
  CONSTRAINT `fk_genblock_systema` FOREIGN KEY (`FK_Systema_ID`) REFERENCES `sistema_ochiszchenya` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generatorniy_block`
--

LOCK TABLES `generatorniy_block` WRITE;
/*!40000 ALTER TABLE `generatorniy_block` DISABLE KEYS */;
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
  `FK_Block_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_kotel_block` (`FK_Block_ID`),
  CONSTRAINT `fk_kotel_block` FOREIGN KEY (`FK_Block_ID`) REFERENCES `generatorniy_block` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kotel`
--

LOCK TABLES `kotel` WRITE;
/*!40000 ALTER TABLE `kotel` DISABLE KEYS */;
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
  KEY `fk_palivo_kotel` (`FK_Kotel_ID`),
  CONSTRAINT `fk_palivo_kotel` FOREIGN KEY (`FK_Kotel_ID`) REFERENCES `kotel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palivo`
--

LOCK TABLES `palivo` WRITE;
/*!40000 ALTER TABLE `palivo` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema_ochiszchenya`
--

LOCK TABLES `sistema_ochiszchenya` WRITE;
/*!40000 ALTER TABLE `sistema_ochiszchenya` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tehnichnyi_personal`
--

LOCK TABLES `tehnichnyi_personal` WRITE;
/*!40000 ALTER TABLE `tehnichnyi_personal` DISABLE KEYS */;
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
  KEY `fk_turbina_kotel` (`FK_Kotel_ID`),
  CONSTRAINT `fk_turbina_kotel` FOREIGN KEY (`FK_Kotel_ID`) REFERENCES `kotel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turbina`
--

LOCK TABLES `turbina` WRITE;
/*!40000 ALTER TABLE `turbina` DISABLE KEYS */;
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

-- Dump completed on 2025-09-30 17:47:44
