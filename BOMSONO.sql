-- MySQL dump 10.13  Distrib 8.0.12, for Linux (x86_64)
--
-- Host: localhost    Database: BOMSONO
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Apartamento`
--

DROP TABLE IF EXISTS `Apartamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Apartamento` (
  `CodApt` int(11) NOT NULL,
  `Diaria` double DEFAULT NULL,
  `Frigobar` tinyint(1) DEFAULT NULL,
  `Ar` tinyint(1) DEFAULT NULL,
  `TV` tinyint(1) DEFAULT NULL,
  `CodHotel` int(11) DEFAULT NULL,
  `IdTipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodApt`),
  KEY `IdTipo` (`IdTipo`),
  KEY `CodHotel` (`CodHotel`),
  CONSTRAINT `Apartamento_ibfk_1` FOREIGN KEY (`IdTipo`) REFERENCES `Tipo` (`idtipo`),
  CONSTRAINT `Apartamento_ibfk_2` FOREIGN KEY (`CodHotel`) REFERENCES `Hotel` (`codhotel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Apartamento`
--

LOCK TABLES `Apartamento` WRITE;
/*!40000 ALTER TABLE `Apartamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Apartamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Cliente` (
  `CodCliente` int(11) NOT NULL,
  `email` text,
  `Pais` text,
  `Cidade` text,
  `Bairro` text,
  `TipoLogradouro` text,
  `Logradouro` text,
  `nrLogradouro` text,
  `Telefone` text,
  `Cep` text,
  `Nome` text,
  `Estado` text,
  PRIMARY KEY (`CodCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Consumiveis`
--

DROP TABLE IF EXISTS `Consumiveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Consumiveis` (
  `CodCons` int(11) NOT NULL,
  `Desc` text NOT NULL,
  `Valor` double DEFAULT NULL,
  PRIMARY KEY (`CodCons`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Consumiveis`
--

LOCK TABLES `Consumiveis` WRITE;
/*!40000 ALTER TABLE `Consumiveis` DISABLE KEYS */;
/*!40000 ALTER TABLE `Consumiveis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Conta`
--

DROP TABLE IF EXISTS `Conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Conta` (
  `CodConta` int(11) NOT NULL,
  `CheckIn` timestamp NULL DEFAULT NULL,
  `CheckOut` timestamp NULL DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `CodApt` int(11) DEFAULT NULL,
  `CodCliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodConta`),
  KEY `CodApt` (`CodApt`),
  KEY `CodCliente` (`CodCliente`),
  CONSTRAINT `Conta_ibfk_1` FOREIGN KEY (`CodApt`) REFERENCES `Apartamento` (`codapt`),
  CONSTRAINT `Conta_ibfk_2` FOREIGN KEY (`CodCliente`) REFERENCES `Cliente` (`codcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Conta`
--

LOCK TABLES `Conta` WRITE;
/*!40000 ALTER TABLE `Conta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fisico`
--

DROP TABLE IF EXISTS `Fisico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Fisico` (
  `CodCliente` int(11) NOT NULL,
  `Sexo` text,
  `Profissao` text,
  `DtNasc` date DEFAULT NULL,
  `Cpf` text,
  `Rg` text,
  PRIMARY KEY (`CodCliente`),
  CONSTRAINT `Fisico_ibfk_1` FOREIGN KEY (`CodCliente`) REFERENCES `Cliente` (`codcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fisico`
--

LOCK TABLES `Fisico` WRITE;
/*!40000 ALTER TABLE `Fisico` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fisico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Funcionario`
--

DROP TABLE IF EXISTS `Funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Funcionario` (
  `CodFunc` int(11) NOT NULL,
  `cpf` text,
  `Cargo` text,
  `Nome` text,
  `RG` text,
  `Sexo` text,
  `idade` int(11) DEFAULT NULL,
  `TipoLogradouro` text,
  `Logradouro` text,
  `NrLogradouro` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodFunc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funcionario`
--

LOCK TABLES `Funcionario` WRITE;
/*!40000 ALTER TABLE `Funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hotel`
--

DROP TABLE IF EXISTS `Hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Hotel` (
  `CodHotel` int(11) NOT NULL,
  `Cidade` text,
  `Estado` text,
  `Pais` text,
  `Cep` text,
  `CNPJ` int(11) DEFAULT NULL,
  `TipoLogradouro` text,
  `Logradouro` text,
  `nrLogradouro` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodHotel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotel`
--

LOCK TABLES `Hotel` WRITE;
/*!40000 ALTER TABLE `Hotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `Hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ItemConta`
--

DROP TABLE IF EXISTS `ItemConta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ItemConta` (
  `Qtd` int(11) NOT NULL,
  `DtHora` timestamp NOT NULL,
  `CodCons` int(11) NOT NULL,
  `CodConta` int(11) NOT NULL,
  PRIMARY KEY (`DtHora`,`CodCons`,`CodConta`),
  KEY `CodCons` (`CodCons`),
  KEY `CodConta` (`CodConta`),
  CONSTRAINT `ItemConta_ibfk_1` FOREIGN KEY (`CodCons`) REFERENCES `Consumiveis` (`codcons`),
  CONSTRAINT `ItemConta_ibfk_2` FOREIGN KEY (`CodConta`) REFERENCES `Conta` (`codconta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItemConta`
--

LOCK TABLES `ItemConta` WRITE;
/*!40000 ALTER TABLE `ItemConta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ItemConta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Juridico`
--

DROP TABLE IF EXISTS `Juridico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Juridico` (
  `CodCliente` int(11) NOT NULL,
  `Cnpj` text,
  PRIMARY KEY (`CodCliente`),
  CONSTRAINT `Juridico_ibfk_1` FOREIGN KEY (`CodCliente`) REFERENCES `Cliente` (`codcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Juridico`
--

LOCK TABLES `Juridico` WRITE;
/*!40000 ALTER TABLE `Juridico` DISABLE KEYS */;
/*!40000 ALTER TABLE `Juridico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Limpeza`
--

DROP TABLE IF EXISTS `Limpeza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Limpeza` (
  `DtHora` timestamp NOT NULL,
  `AptOk` tinyint(1) DEFAULT NULL,
  `Obs` text,
  `CodApt` int(11) NOT NULL,
  `CodFunc` int(11) NOT NULL,
  PRIMARY KEY (`DtHora`,`CodFunc`,`CodApt`),
  KEY `CodApt` (`CodApt`),
  KEY `CodFunc` (`CodFunc`),
  CONSTRAINT `Limpeza_ibfk_1` FOREIGN KEY (`CodApt`) REFERENCES `Apartamento` (`codapt`),
  CONSTRAINT `Limpeza_ibfk_2` FOREIGN KEY (`CodFunc`) REFERENCES `Funcionario` (`codfunc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Limpeza`
--

LOCK TABLES `Limpeza` WRITE;
/*!40000 ALTER TABLE `Limpeza` DISABLE KEYS */;
/*!40000 ALTER TABLE `Limpeza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NotaFiscal`
--

DROP TABLE IF EXISTS `NotaFiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `NotaFiscal` (
  `CodNF` int(11) NOT NULL,
  `NroOrdem` int(11) NOT NULL,
  `Serie` text NOT NULL,
  `SubSerie` text NOT NULL,
  `NroVia` int(11) NOT NULL,
  `DtEmissao` timestamp NOT NULL,
  `CodConta` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodNF`),
  KEY `CodConta` (`CodConta`),
  CONSTRAINT `NotaFiscal_ibfk_1` FOREIGN KEY (`CodConta`) REFERENCES `Conta` (`codconta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NotaFiscal`
--

LOCK TABLES `NotaFiscal` WRITE;
/*!40000 ALTER TABLE `NotaFiscal` DISABLE KEYS */;
/*!40000 ALTER TABLE `NotaFiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reserva`
--

DROP TABLE IF EXISTS `Reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Reserva` (
  `CodRes` int(11) NOT NULL,
  `DtEntrega` text,
  `DtSaida` text,
  `Efetivada` tinyint(1) DEFAULT NULL,
  `MotivoViagem` text,
  `nHospedes` int(11) DEFAULT NULL,
  `CidadeOrig` text,
  `EstadoOrig` text,
  `PaisOrig` text,
  `PaisDest` text,
  `CidadeDest` text,
  `MeioTransporte` text,
  `CodCliente` int(11) DEFAULT NULL,
  `CodHotel` int(11) DEFAULT NULL,
  `IdTipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodRes`),
  KEY `CodCliente` (`CodCliente`),
  KEY `CodHotel` (`CodHotel`),
  KEY `IdTipo` (`IdTipo`),
  CONSTRAINT `Reserva_ibfk_1` FOREIGN KEY (`CodCliente`) REFERENCES `Cliente` (`codcliente`),
  CONSTRAINT `Reserva_ibfk_2` FOREIGN KEY (`CodHotel`) REFERENCES `Hotel` (`codhotel`),
  CONSTRAINT `Reserva_ibfk_3` FOREIGN KEY (`IdTipo`) REFERENCES `Tipo` (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reserva`
--

LOCK TABLES `Reserva` WRITE;
/*!40000 ALTER TABLE `Reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo`
--

DROP TABLE IF EXISTS `Tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Tipo` (
  `IdTipo` int(11) NOT NULL,
  `Suite` tinyint(1) DEFAULT NULL,
  `CamasCasal` int(11) DEFAULT NULL,
  `CasmasSolteiro` int(11) DEFAULT NULL,
  `NecEspeciais` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`IdTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo`
--

LOCK TABLES `Tipo` WRITE;
/*!40000 ALTER TABLE `Tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trabalha`
--

DROP TABLE IF EXISTS `Trabalha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Trabalha` (
  `CodFunc` int(11) NOT NULL,
  `CodHotel` int(11) NOT NULL,
  PRIMARY KEY (`CodFunc`,`CodHotel`),
  KEY `CodHotel` (`CodHotel`),
  CONSTRAINT `Trabalha_ibfk_1` FOREIGN KEY (`CodFunc`) REFERENCES `Funcionario` (`codfunc`),
  CONSTRAINT `Trabalha_ibfk_2` FOREIGN KEY (`CodHotel`) REFERENCES `Hotel` (`codhotel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trabalha`
--

LOCK TABLES `Trabalha` WRITE;
/*!40000 ALTER TABLE `Trabalha` DISABLE KEYS */;
/*!40000 ALTER TABLE `Trabalha` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-12 20:17:33
