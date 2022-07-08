-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema SantisimaSpa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SantisimaSpa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SantisimaSpa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `SantisimaSpa`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SantisimaSpa`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `cedula` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `celular` VARCHAR(45) NULL DEFAULT NULL,
  `direccion` VARCHAR(45) NULL DEFAULT NULL,
  `comentarios` VARCHAR(45) NULL DEFAULT NULL,
  `faltas` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `SantisimaSpa`.`servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SantisimaSpa`.`servicio` (
  `idservicios` INT NOT NULL AUTO_INCREMENT,
  `nombre servicio` VARCHAR(45) NOT NULL,
  `duracion` VARCHAR(45) NOT NULL,
  `materiales` VARCHAR(45) NOT NULL,
  `costo` VARCHAR(45) NOT NULL,
  `insumo_idinsumo` INT NOT NULL,
  `insumo_administrador_cedula` INT NOT NULL,
  `insumo_administrador_sede_direccion` INT NOT NULL,
  `insumo_administrador_gerente_cedula` INT NOT NULL,
  PRIMARY KEY (`idservicios`, `insumo_idinsumo`, `insumo_administrador_cedula`, `insumo_administrador_sede_direccion`, `insumo_administrador_gerente_cedula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `mydb`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cita` (
  `idCita` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` VARCHAR(45) NOT NULL,
  `cliente_idcliente` INT NOT NULL,
  `servicios_idservicios` INT NOT NULL,
  `servicios_insumo_idinsumo` INT NOT NULL,
  `servicios_insumo_administrador_cedula` INT NOT NULL,
  `servicios_insumo_administrador_sede_direccion` INT NOT NULL,
  `servicios_insumo_administrador_gerente_cedula` INT NOT NULL,
  PRIMARY KEY (`idCita`, `servicios_idservicios`, `servicios_insumo_idinsumo`, `servicios_insumo_administrador_cedula`, `servicios_insumo_administrador_sede_direccion`, `servicios_insumo_administrador_gerente_cedula`),
  INDEX `fk_Cita_cliente_idx` (`cliente_idcliente` ASC),
  INDEX `fk_Cita_servicios1_idx` (`servicios_idservicios` ASC, `servicios_insumo_idinsumo` ASC, `servicios_insumo_administrador_cedula` ASC, `servicios_insumo_administrador_sede_direccion` ASC, `servicios_insumo_administrador_gerente_cedula` ASC),
  CONSTRAINT `fk_Cita_cliente`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `SantisimaSpa`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cita_servicios1`
    FOREIGN KEY (`servicios_idservicios` , `servicios_insumo_idinsumo` , `servicios_insumo_administrador_cedula` , `servicios_insumo_administrador_sede_direccion` , `servicios_insumo_administrador_gerente_cedula`)
    REFERENCES `SantisimaSpa`.`servicio` (`idservicios` , `insumo_idinsumo` , `insumo_administrador_cedula` , `insumo_administrador_sede_direccion` , `insumo_administrador_gerente_cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo-registros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo-registros` (
  `idTipo-registros` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo-registros`))
ENGINE = InnoDB;

USE `SantisimaSpa` ;

-- -----------------------------------------------------
-- Table `SantisimaSpa`.`gerente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SantisimaSpa`.`gerente` (
  `cedula` INT NOT NULL,
  `gerente` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NULL DEFAULT NULL,
  `celular` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `SantisimaSpa`.`sede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SantisimaSpa`.`sede` (
  `direccion` INT NOT NULL AUTO_INCREMENT,
  `ciudad` VARCHAR(45) NOT NULL,
  `nombre sede` VARCHAR(45) NOT NULL,
  `gerente_cedula` INT NOT NULL,
  PRIMARY KEY (`direccion`, `gerente_cedula`),
  INDEX `fk_sede_gerente1_idx` (`gerente_cedula` ASC) ,
  CONSTRAINT `fk_sede_gerente1`
    FOREIGN KEY (`gerente_cedula`)
    REFERENCES `SantisimaSpa`.`gerente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `SantisimaSpa`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SantisimaSpa`.`administrador` (
  `cedula` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `celular` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NULL DEFAULT NULL,
  `sede_direccion` INT NOT NULL,
  `gerente_cedula` INT NOT NULL,
  PRIMARY KEY (`cedula`, `sede_direccion`, `gerente_cedula`),
  INDEX `fk_administrador_sede1_idx` (`sede_direccion` ASC),
  CONSTRAINT `fk_administrador_sede1`
    FOREIGN KEY (`sede_direccion`)
    REFERENCES `SantisimaSpa`.`sede` (`direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `SantisimaSpa`.`insumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SantisimaSpa`.`insumo` (
  `idinsumo` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `administrador_cedula` INT NOT NULL,
  `administrador_sede_direccion` INT NOT NULL,
  `administrador_gerente_cedula` INT NOT NULL,
  PRIMARY KEY (`idinsumo`, `administrador_cedula`, `administrador_sede_direccion`, `administrador_gerente_cedula`),
  INDEX `fk_insumo_administrador1_idx` (`administrador_cedula` ASC, `administrador_sede_direccion` ASC, `administrador_gerente_cedula` ASC),
  CONSTRAINT `fk_insumo_administrador1`
    FOREIGN KEY (`administrador_cedula` , `administrador_sede_direccion` , `administrador_gerente_cedula`)
    REFERENCES `SantisimaSpa`.`administrador` (`cedula` , `sede_direccion` , `gerente_cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `SantisimaSpa`.`manicurista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SantisimaSpa`.`manicurista` (
  `cedula` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `direccion` VARCHAR(45) NULL DEFAULT NULL,
  `citas` VARCHAR(45) NOT NULL,
  `celular` INT NULL DEFAULT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  `manicuristacol` VARCHAR(45) NOT NULL,
  `profesor` VARCHAR(45) NOT NULL,
  `administrador_cedula` INT NOT NULL,
  `sede_direccion` INT NOT NULL,
  `sede_direccion1` INT NOT NULL,
  `sede_gerente_cedula` INT NOT NULL,
  PRIMARY KEY (`cedula`, `administrador_cedula`, `sede_direccion`, `sede_direccion1`, `sede_gerente_cedula`),
  INDEX `fk_manicurista_sede1_idx` (`sede_direccion1` ASC, `sede_gerente_cedula` ASC),
  CONSTRAINT `fk_manicurista_sede1`
    FOREIGN KEY (`sede_direccion1` , `sede_gerente_cedula`)
    REFERENCES `SantisimaSpa`.`sede` (`direccion` , `gerente_cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `SantisimaSpa`.`registros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SantisimaSpa`.`registros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` VARCHAR(45) NOT NULL,
  `informacion` VARCHAR(45) NOT NULL,
  `administrador_cedula` INT NOT NULL,
  `administrador_sede_direccion` INT NOT NULL,
  `administrador_gerente_cedula` INT NOT NULL,
  `Tipo-registros_idTipo-registros` INT NOT NULL,
  PRIMARY KEY (`id`, `administrador_cedula`, `administrador_sede_direccion`, `administrador_gerente_cedula`, `Tipo-registros_idTipo-registros`),
  INDEX `fk_registros_administrador1_idx` (`administrador_cedula` ASC, `administrador_sede_direccion` ASC, `administrador_gerente_cedula` ASC),
  INDEX `fk_registros_Tipo-registros1_idx` (`Tipo-registros_idTipo-registros` ASC),
  CONSTRAINT `fk_registros_administrador1`
    FOREIGN KEY (`administrador_cedula` , `administrador_sede_direccion` , `administrador_gerente_cedula`)
    REFERENCES `SantisimaSpa`.`administrador` (`cedula` , `sede_direccion` , `gerente_cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registros_Tipo-registros1`
    FOREIGN KEY (`Tipo-registros_idTipo-registros`)
    REFERENCES `mydb`.`Tipo-registros` (`idTipo-registros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `SantisimaSpa`.`servicio_has_manicurista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SantisimaSpa`.`servicio_has_manicurista` (
  `servicio_idservicios` INT NOT NULL,
  `servicio_insumo_idinsumo` INT NOT NULL,
  `servicio_insumo_administrador_cedula` INT NOT NULL,
  `servicio_insumo_administrador_sede_direccion` INT NOT NULL,
  `servicio_insumo_administrador_gerente_cedula` INT NOT NULL,
  `manicurista_cedula` INT NOT NULL,
  `manicurista_administrador_cedula` INT NOT NULL,
  `manicurista_sede_direccion` INT NOT NULL,
  PRIMARY KEY (`servicio_idservicios`, `servicio_insumo_idinsumo`, `servicio_insumo_administrador_cedula`, `servicio_insumo_administrador_sede_direccion`, `servicio_insumo_administrador_gerente_cedula`, `manicurista_cedula`, `manicurista_administrador_cedula`, `manicurista_sede_direccion`),
  INDEX `fk_servicio_has_manicurista_manicurista1_idx` (`manicurista_cedula` ASC, `manicurista_administrador_cedula` ASC, `manicurista_sede_direccion` ASC) ,
  INDEX `fk_servicio_has_manicurista_servicio1_idx` (`servicio_idservicios` ASC, `servicio_insumo_idinsumo` ASC, `servicio_insumo_administrador_cedula` ASC, `servicio_insumo_administrador_sede_direccion` ASC, `servicio_insumo_administrador_gerente_cedula` ASC) ,
  CONSTRAINT `fk_servicio_has_manicurista_servicio1`
    FOREIGN KEY (`servicio_idservicios` , `servicio_insumo_idinsumo` , `servicio_insumo_administrador_cedula` , `servicio_insumo_administrador_sede_direccion` , `servicio_insumo_administrador_gerente_cedula`)
    REFERENCES `SantisimaSpa`.`servicio` (`idservicios` , `insumo_idinsumo` , `insumo_administrador_cedula` , `insumo_administrador_sede_direccion` , `insumo_administrador_gerente_cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_has_manicurista_manicurista1`
    FOREIGN KEY (`manicurista_cedula` , `manicurista_administrador_cedula` , `manicurista_sede_direccion`)
    REFERENCES `SantisimaSpa`.`manicurista` (`cedula` , `administrador_cedula` , `sede_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
