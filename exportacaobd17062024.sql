CREATE DATABASE  IF NOT EXISTS `startup3` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `startup3`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: startup3
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
-- Table structure for table `membros`
--

DROP TABLE IF EXISTS `membros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membros` (
  `membro_id` int NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `cargo` varchar(60) DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  PRIMARY KEY (`membro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membros`
--

LOCK TABLES `membros` WRITE;
/*!40000 ALTER TABLE `membros` DISABLE KEYS */;
INSERT INTO `membros` VALUES (1,'Paulo','Programador 1','M'),(2,'João Silva','Desenvolvedor Full Stack','M'),(3,'Maria Santos','Analista de Banco de Dados','F'),(4,'Pedro Oliveira','Engenheiro de Software','M'),(5,'Ana Costa','Administrador de Rede Sênior','F'),(6,'Carlos Souza','Especialista em Segurança da Informação','M');
/*!40000 ALTER TABLE `membros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarefas`
--

DROP TABLE IF EXISTS `tarefas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefas` (
  `tarefa_id` int NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `membro_id` int DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_finalizacao` date DEFAULT NULL,
  PRIMARY KEY (`tarefa_id`),
  KEY `membro_id` (`membro_id`),
  CONSTRAINT `tarefas_ibfk_1` FOREIGN KEY (`membro_id`) REFERENCES `membros` (`membro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefas`
--

LOCK TABLES `tarefas` WRITE;
/*!40000 ALTER TABLE `tarefas` DISABLE KEYS */;
INSERT INTO `tarefas` VALUES (1,'Criar a classe produto',1,'2024-06-17','2024-06-17'),(2,'Desenvolver novo módulo de login para o sistema',2,'2024-06-17','2024-06-17'),(3,'Testar e validar integração com API externa',3,'2024-06-17','2024-06-17'),(4,'Realizar manutenção preventiva nos servidores',4,'2024-06-17','2024-06-17'),(5,'Criar documentação técnica do projeto XYZ',5,'2024-06-17','2024-06-17'),(6,'Implementar melhorias na interface do usuário',6,'2024-06-17','2024-06-17');
/*!40000 ALTER TABLE `tarefas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-17 23:45:41
