-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sys
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema BomSono
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BomSono
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BomSono` DEFAULT CHARACTER SET latin1 ;
USE `BomSono` ;

-- -----------------------------------------------------
-- Table `BomSono`.`Tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BomSono`.`Tipo` (
  `IdTipo` INT(11) NOT NULL AUTO_INCREMENT,
  `Suite` TINYINT(1) NULL DEFAULT NULL,
  `CamasCasal` INT(11) NULL DEFAULT NULL,
  `CasmasSolteiro` INT(11) NULL DEFAULT NULL,
  `NecEspeciais` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `BomSono`.`Hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BomSono`.`Hotel` (
  `CodHotel` INT(11) NOT NULL AUTO_INCREMENT,
  `Cidade` TEXT NULL DEFAULT NULL,
  `Estado` TEXT NULL DEFAULT NULL,
  `Pais` TEXT NULL DEFAULT NULL,
  `Cep` TEXT NULL DEFAULT NULL,
  `CNPJ` INT(11) NULL DEFAULT NULL,
  `TipoLogradouro` TEXT NULL DEFAULT NULL,
  `Logradouro` TEXT NULL DEFAULT NULL,
  `nrLogradouro` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`CodHotel`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `BomSono`.`Apartamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BomSono`.`Apartamento` (
  `CodApt` INT(11) NOT NULL AUTO_INCREMENT,
  `Diaria` DOUBLE NULL DEFAULT NULL,
  `Frigobar` TINYINT(1) NULL DEFAULT NULL,
  `Ar` TINYINT(1) NULL DEFAULT NULL,
  `TV` TINYINT(1) NULL DEFAULT NULL,
  `CodHotel` INT(11) NULL DEFAULT NULL,
  `IdTipo` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`CodApt`),
  INDEX `IdTipo` (`IdTipo` ASC),
  INDEX `CodHotel` (`CodHotel` ASC),
  CONSTRAINT `Apartamento_ibfk_1`
    FOREIGN KEY (`IdTipo`)
    REFERENCES `BomSono`.`Tipo` (`IdTipo`),
  CONSTRAINT `Apartamento_ibfk_2`
    FOREIGN KEY (`CodHotel`)
    REFERENCES `BomSono`.`Hotel` (`CodHotel`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `BomSono`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BomSono`.`Cliente` (
  `CodCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `email` TEXT NULL DEFAULT NULL,
  `Pais` TEXT NULL DEFAULT NULL,
  `Cidade` TEXT NULL DEFAULT NULL,
  `Bairro` TEXT NULL DEFAULT NULL,
  `TipoLogradouro` TEXT NULL DEFAULT NULL,
  `Logradouro` TEXT NULL DEFAULT NULL,
  `nrLogradouro` TEXT NULL DEFAULT NULL,
  `Telefone` TEXT NULL DEFAULT NULL,
  `Cep` TEXT NULL DEFAULT NULL,
  `Nome` TEXT NULL DEFAULT NULL,
  `Estado` TEXT NULL DEFAULT NULL,
  `Sexo` TEXT NULL DEFAULT NULL,
  `Profissao` TEXT NULL DEFAULT NULL,
  `DtNasc` DATE NULL DEFAULT NULL,
  `CPF` TEXT NULL DEFAULT NULL,
  `RG` TEXT NULL DEFAULT NULL,
  `CNPJ` TEXT NULL DEFAULT NULL,
  `Senha` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`CodCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `BomSono`.`Consumiveis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BomSono`.`Consumiveis` (
  `CodCons` INT(11) NOT NULL AUTO_INCREMENT,
  `Desc` TEXT NOT NULL,
  `Valor` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`CodCons`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `BomSono`.`Conta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BomSono`.`Conta` (
  `CodConta` INT(11) NOT NULL AUTO_INCREMENT,
  `CheckIn` TIMESTAMP NULL DEFAULT NULL,
  `CheckOut` TIMESTAMP NULL DEFAULT NULL,
  `Total` DOUBLE NULL DEFAULT NULL,
  `CodApt` INT(11) NULL DEFAULT NULL,
  `CodCliente` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`CodConta`),
  INDEX `CodApt` (`CodApt` ASC),
  INDEX `CodCliente` (`CodCliente` ASC),
  CONSTRAINT `Conta_ibfk_1`
    FOREIGN KEY (`CodApt`)
    REFERENCES `BomSono`.`Apartamento` (`CodApt`),
  CONSTRAINT `Conta_ibfk_2`
    FOREIGN KEY (`CodCliente`)
    REFERENCES `BomSono`.`Cliente` (`CodCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `BomSono`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BomSono`.`Funcionario` (
  `CodFunc` INT(11) NOT NULL AUTO_INCREMENT,
  `cpf` TEXT NULL DEFAULT NULL,
  `Cargo` TEXT NULL DEFAULT NULL,
  `Nome` TEXT NULL DEFAULT NULL,
  `RG` TEXT NULL DEFAULT NULL,
  `Sexo` TEXT NULL DEFAULT NULL,
  `idade` INT(11) NULL DEFAULT NULL,
  `TipoLogradouro` TEXT NULL DEFAULT NULL,
  `Logradouro` TEXT NULL DEFAULT NULL,
  `NrLogradouro` INT(11) NULL DEFAULT NULL,
  `Senha` TEXT NULL,
  PRIMARY KEY (`CodFunc`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `BomSono`.`ItemConta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BomSono`.`ItemConta` (
  `Qtd` INT(11) NOT NULL,
  `DtHora` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CodCons` INT(11) NOT NULL,
  `CodConta` INT(11) NOT NULL,
  PRIMARY KEY (`DtHora`, `CodCons`, `CodConta`),
  INDEX `CodCons` (`CodCons` ASC),
  INDEX `CodConta` (`CodConta` ASC),
  CONSTRAINT `ItemConta_ibfk_1`
    FOREIGN KEY (`CodCons`)
    REFERENCES `BomSono`.`Consumiveis` (`CodCons`),
  CONSTRAINT `ItemConta_ibfk_2`
    FOREIGN KEY (`CodConta`)
    REFERENCES `BomSono`.`Conta` (`CodConta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `BomSono`.`Limpeza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BomSono`.`Limpeza` (
  `DtHora` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AptOk` TINYINT(1) NULL DEFAULT NULL,
  `Obs` TEXT NULL DEFAULT NULL,
  `CodApt` INT(11) NOT NULL,
  `CodFunc` INT(11) NOT NULL,
  PRIMARY KEY (`DtHora`, `CodFunc`, `CodApt`),
  INDEX `CodApt` (`CodApt` ASC),
  INDEX `CodFunc` (`CodFunc` ASC),
  CONSTRAINT `Limpeza_ibfk_1`
    FOREIGN KEY (`CodApt`)
    REFERENCES `BomSono`.`Apartamento` (`CodApt`),
  CONSTRAINT `Limpeza_ibfk_2`
    FOREIGN KEY (`CodFunc`)
    REFERENCES `BomSono`.`Funcionario` (`CodFunc`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `BomSono`.`NotaFiscal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BomSono`.`NotaFiscal` (
  `CodNF` INT(11) NOT NULL AUTO_INCREMENT,
  `NroOrdem` INT(11) NOT NULL,
  `Serie` TEXT NOT NULL,
  `SubSerie` TEXT NOT NULL,
  `NroVia` INT(11) NOT NULL,
  `DtEmissao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CodConta` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`CodNF`),
  INDEX `CodConta` (`CodConta` ASC),
  CONSTRAINT `NotaFiscal_ibfk_1`
    FOREIGN KEY (`CodConta`)
    REFERENCES `BomSono`.`Conta` (`CodConta`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `BomSono`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BomSono`.`Reserva` (
  `CodRes` INT(11) NOT NULL,
  `DtEntrega` TEXT NULL DEFAULT NULL,
  `DtSaida` TEXT NULL DEFAULT NULL,
  `Efetivada` TINYINT(1) NULL DEFAULT NULL,
  `MotivoViagem` TEXT NULL DEFAULT NULL,
  `nHospedes` INT(11) NULL DEFAULT NULL,
  `CidadeOrig` TEXT NULL DEFAULT NULL,
  `EstadoOrig` TEXT NULL DEFAULT NULL,
  `PaisOrig` TEXT NULL DEFAULT NULL,
  `PaisDest` TEXT NULL DEFAULT NULL,
  `CidadeDest` TEXT NULL DEFAULT NULL,
  `MeioTransporte` TEXT NULL DEFAULT NULL,
  `CodCliente` INT(11) NULL DEFAULT NULL,
  `CodHotel` INT(11) NULL DEFAULT NULL,
  `IdTipo` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`CodRes`),
  INDEX `CodCliente` (`CodCliente` ASC),
  INDEX `CodHotel` (`CodHotel` ASC),
  INDEX `IdTipo` (`IdTipo` ASC),
  CONSTRAINT `Reserva_ibfk_1`
    FOREIGN KEY (`CodCliente`)
    REFERENCES `BomSono`.`Cliente` (`CodCliente`),
  CONSTRAINT `Reserva_ibfk_2`
    FOREIGN KEY (`CodHotel`)
    REFERENCES `BomSono`.`Hotel` (`CodHotel`),
  CONSTRAINT `Reserva_ibfk_3`
    FOREIGN KEY (`IdTipo`)
    REFERENCES `BomSono`.`Tipo` (`IdTipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `BomSono`.`Trabalha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BomSono`.`Trabalha` (
  `CodFunc` INT(11) NOT NULL,
  `CodHotel` INT(11) NOT NULL,
  PRIMARY KEY (`CodFunc`, `CodHotel`),
  INDEX `CodHotel` (`CodHotel` ASC),
  CONSTRAINT `Trabalha_ibfk_1`
    FOREIGN KEY (`CodFunc`)
    REFERENCES `BomSono`.`Funcionario` (`CodFunc`),
  CONSTRAINT `Trabalha_ibfk_2`
    FOREIGN KEY (`CodHotel`)
    REFERENCES `BomSono`.`Hotel` (`CodHotel`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
