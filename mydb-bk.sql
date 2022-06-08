CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `historia_clinica`
--

DROP TABLE IF EXISTS `historia_clinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historia_clinica` (
  `id` int NOT NULL,
  `fecha_cita` date NOT NULL,
  `diagnostico` varchar(500) NOT NULL,
  `medico_id` int NOT NULL,
  `mascota_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_historia_clinica_medico1_idx` (`medico_id`),
  KEY `fk_historia_clinica_mascota1_idx` (`mascota_id`),
  CONSTRAINT `fk_historia_clinica_mascota1` FOREIGN KEY (`mascota_id`) REFERENCES `mascota` (`id`),
  CONSTRAINT `fk_historia_clinica_medico1` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historia_clinica`
--

LOCK TABLES `historia_clinica` WRITE;
/*!40000 ALTER TABLE `historia_clinica` DISABLE KEYS */;
INSERT INTO `historia_clinica` VALUES (1,'2021-08-01','El perro se encuentra con un peso normal y en su cita de control de ojos al parecer la catarata se detuvo.',3,1),(2,'2021-08-02','Merlín presenta halitosis reflejo de un problema localizado en la boca o incluso de algún problema del aparato digestivo.',2,2),(3,'2021-06-30','El pronóstico es reservado. Presenta molestias bucales (gingivitis), vómitos, fiebre. Se deja en hospitalización.',2,4),(4,'2021-08-13','Viene para el programa de mascotas de la tercera edad',1,5);
/*!40000 ALTER TABLE `historia_clinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascota`
--

DROP TABLE IF EXISTS `mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascota` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombreMascota` varchar(45) NOT NULL,
  `edad` int NOT NULL,
  `tenedor_id` int NOT NULL,
  `tipo-mascota_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mascota_tenedor_idx` (`tenedor_id`),
  KEY `fk_mascota_tipo-mascota1_idx` (`tipo-mascota_id`),
  CONSTRAINT `fk_mascota_tenedor` FOREIGN KEY (`tenedor_id`) REFERENCES `tenedor` (`id`),
  CONSTRAINT `fk_mascota_tipo-mascota1` FOREIGN KEY (`tipo-mascota_id`) REFERENCES `tipo-mascota` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascota`
--

LOCK TABLES `mascota` WRITE;
/*!40000 ALTER TABLE `mascota` DISABLE KEYS */;
INSERT INTO `mascota` VALUES (1,'Sam',2,1,0),(2,'Merlín',3,3,0),(3,'Toby',1,4,0),(4,'Kira',5,1,0),(5,'Sasha',6,2,0),(6,'Tribilín',2,2,0);
/*!40000 ALTER TABLE `mascota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `nro_tarjeta` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1,'Dr Jose Mata',''),(2,'Dra María Casas',''),(3,'Dr Mario Bros','');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenedor`
--

DROP TABLE IF EXISTS `tenedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenedor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenedor`
--

LOCK TABLES `tenedor` WRITE;
/*!40000 ALTER TABLE `tenedor` DISABLE KEYS */;
INSERT INTO `tenedor` VALUES (1,'Vicente Fernandes','Kra 5 # 6-45 Torre 4 Apto 305','3221234564'),(2,'Diego Mara donna','Cll 45 # 12-65 Bis','3133151232'),(3,'James Bomd','Av Los zipas Km 6','3192212121'),(4,'Christopher Reeve','Vereda San benito Finca la soledad','2927272 ext 333'),(5,'Michael Jack','Cra 78 # 4-56 Sur','+549 4984445413'),(6,'Misael','Calle falsa 123','3157548757'),(7,'Jhon Wick','USA','789524562'),(8,'Pedro Picapiedra','Rocadura','000000001'),(9,'jskajksadds','fdfsd','fewr');
/*!40000 ALTER TABLE `tenedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo-mascota`
--

DROP TABLE IF EXISTS `tipo-mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo-mascota` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipoMascota` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo-mascota`
--

LOCK TABLES `tipo-mascota` WRITE;
/*!40000 ALTER TABLE `tipo-mascota` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo-mascota` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-07 20:30:24
