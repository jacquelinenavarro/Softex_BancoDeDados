CREATE DATABASE  IF NOT EXISTS `clinicamedica` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clinicamedica`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: clinicamedica
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `NumConsulta` int NOT NULL AUTO_INCREMENT,
  `DataHora` datetime DEFAULT NULL,
  `ReceitaMedica` text,
  `Diagnostico` text,
  `Observacoes` text,
  `CRM_Medico` varchar(20) DEFAULT NULL,
  `CPF_Paciente` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`NumConsulta`),
  KEY `CRM_Medico` (`CRM_Medico`),
  KEY `CPF_Paciente` (`CPF_Paciente`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`CRM_Medico`) REFERENCES `medico` (`CRM`),
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`CPF_Paciente`) REFERENCES `paciente` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (1,'2024-07-12 10:00:00','Prescricao medica para acompanhamento de rotina','Hipertensão Arterial','n/a','12345','11100011100');
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Rua` varchar(100) DEFAULT NULL,
  `Numero` varchar(10) DEFAULT NULL,
  `Complemento` varchar(100) DEFAULT NULL,
  `Bairro` varchar(50) DEFAULT NULL,
  `Cidade` varchar(100) DEFAULT NULL,
  `UF` char(2) DEFAULT NULL,
  `CEP` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'Principal','10','apt 101','Centro','Recife','PE','50000000'),(2,'Graciliano Ramos','20','casa 01','Centro','Salvador','BA','51000000'),(3,'José Santos','30','apt 201','Centro','Recife','PE','52000000'),(4,'José Maria','2','apt 1009','Centro','Recife','PE','52000020');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidade` (
  `Especialidade_ID` int NOT NULL AUTO_INCREMENT,
  `NomeEspecialidade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Especialidade_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidade`
--

LOCK TABLES `especialidade` WRITE;
/*!40000 ALTER TABLE `especialidade` DISABLE KEYS */;
INSERT INTO `especialidade` VALUES (1,'Cardiologia'),(2,'Pediatria'),(3,'Clinico Geral');
/*!40000 ALTER TABLE `especialidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `CRM` varchar(20) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Genero` char(1) DEFAULT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  `Especialidade_ID` int DEFAULT NULL,
  `Endereco_ID` int DEFAULT NULL,
  PRIMARY KEY (`CRM`),
  KEY `Especialidade_ID` (`Especialidade_ID`),
  KEY `Endereco_ID` (`Endereco_ID`),
  CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`Especialidade_ID`) REFERENCES `especialidade` (`Especialidade_ID`),
  CONSTRAINT `medico_ibfk_2` FOREIGN KEY (`Endereco_ID`) REFERENCES `endereco` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES ('111202','Maria José','F','81999888888',1,3),('12345','Jacqueline Navarro da Silva','F','81996525540',1,1),('67890','José Silva','M','81999857470',2,2);
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `CPF` varchar(14) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Genero` char(1) DEFAULT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  `DataNascimento` date DEFAULT NULL,
  `Endereco_ID` int DEFAULT NULL,
  PRIMARY KEY (`CPF`),
  KEY `Endereco_ID` (`Endereco_ID`),
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`Endereco_ID`) REFERENCES `endereco` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES ('11100011100','Cicera Josefa','F','81999998888','1961-01-05',4);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-12 19:43:52
