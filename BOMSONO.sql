-- MySQL dump 10.13  Distrib 8.0.12, for Linux (x86_64)
--
-- Host: localhost    Database: BOMSONO
-- ------------------------------------------------------
-- Server version	8.0.12

-- Table structure for table `Apartamento`
--
create database if not exists BomSono;

use  BomSono;


DROP TABLE IF EXISTS `Apartamento`;
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
) ;


DROP TABLE IF EXISTS `Cliente`;
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
) ;

--
-- Dumping data for table `Cliente`
--

-- Table structure for table `Consumiveis`
--

DROP TABLE IF EXISTS `Consumiveis`;
CREATE TABLE `Consumiveis` (
  `CodCons` int(11) NOT NULL,
  `Desc` text NOT NULL,
  `Valor` double DEFAULT NULL,
  PRIMARY KEY (`CodCons`)
) ;

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
) ;

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
CREATE TABLE `Fisico` (
  `CodCliente` int(11) NOT NULL,
  `Sexo` text,
  `Profissao` text,
  `DtNasc` date DEFAULT NULL,
  `Cpf` text,
  `Rg` text,
  PRIMARY KEY (`CodCliente`),
  CONSTRAINT `Fisico_ibfk_1` FOREIGN KEY (`CodCliente`) REFERENCES `Cliente` (`codcliente`)
) ;

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
) ;

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
) ;

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
);

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
CREATE TABLE `Juridico` (
  `CodCliente` int(11) NOT NULL,
  `Cnpj` text,
  PRIMARY KEY (`CodCliente`),
  CONSTRAINT `Juridico_ibfk_1` FOREIGN KEY (`CodCliente`) REFERENCES `Cliente` (`codcliente`)
) ;

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
) ;

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
) ;

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
) ;

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
CREATE TABLE `Tipo` (
  `IdTipo` int(11) NOT NULL,
  `Suite` tinyint(1) DEFAULT NULL,
  `CamasCasal` int(11) DEFAULT NULL,
  `CasmasSolteiro` int(11) DEFAULT NULL,
  `NecEspeciais` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`IdTipo`)
) ;

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
CREATE TABLE `Trabalha` (
  `CodFunc` int(11) NOT NULL,
  `CodHotel` int(11) NOT NULL,
  PRIMARY KEY (`CodFunc`,`CodHotel`),
  KEY `CodHotel` (`CodHotel`),
  CONSTRAINT `Trabalha_ibfk_1` FOREIGN KEY (`CodFunc`) REFERENCES `Funcionario` (`codfunc`),
  CONSTRAINT `Trabalha_ibfk_2` FOREIGN KEY (`CodHotel`) REFERENCES `Hotel` (`codhotel`)
) ;

--
-- Dumping data for table `Trabalha`
--

LOCK TABLES `Trabalha` WRITE;
/*!40000 ALTER TABLE `Trabalha` DISABLE KEYS */;
/*!40000 ALTER TABLE `Trabalha` ENABLE KEYS */;
UNLOCK TABLES;

-- Dump completed on 2018-11-12 20:17:33
