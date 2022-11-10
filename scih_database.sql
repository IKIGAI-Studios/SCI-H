-- -----------------------------------------------------
-- Database SCIH
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `SCIH` DEFAULT CHARACTER SET utf8 ;
USE `SCIH` ;

-- -----------------------------------------------------
-- Table `SCIH`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SCIH`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL UNIQUE,
  `password` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SCIH`.`Device`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SCIH`.`Device` (
  `idDevice` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT NOT NULL,
  `brand` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `img_count` INT NOT NULL,
  PRIMARY KEY (`idDevice`),
  INDEX `idUser_idx` (`idUser` ASC) VISIBLE,
  CONSTRAINT `idUserDevice`
    FOREIGN KEY (`idUser`)
    REFERENCES `SCIH`.`User` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SCIH`.`ReferenceImage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SCIH`.`ReferenceImage` (
  `idRImage` INT NOT NULL AUTO_INCREMENT,
  `idDevice` INT NOT NULL,
  `idUser` INT NOT NULL,
  `file` VARCHAR(45) NOT NULL,
  `path` VARCHAR(45) NOT NULL,
  `des` VARCHAR(45) NOT NULL,
  `orig` VARCHAR(45) NOT NULL,
  `cam` VARCHAR(45) NOT NULL,
  `adv_photo` VARCHAR(100) NOT NULL,
  `gps` VARCHAR(45) NOT NULL,
  `arch` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRImage`),
  INDEX `idUser_idx` (`idUser` ASC) VISIBLE,
  INDEX `idDevice_idx` (`idDevice` ASC) VISIBLE,
  CONSTRAINT `idUserRefImage`
    FOREIGN KEY (`idUser`)
    REFERENCES `SCIH`.`User` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idDeviceRefImage`
    FOREIGN KEY (`idDevice`)
    REFERENCES `SCIH`.`Device` (`idDevice`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SCIH`.`QuarrelImage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SCIH`.`QuarrelImage` (
  `idQImage` INT NOT NULL AUTO_INCREMENT,
  `idDevice` INT NOT NULL,
  `idUser` INT NOT NULL,
  `file` VARCHAR(45) NOT NULL,
  `path` VARCHAR(45) NOT NULL,
  `des` VARCHAR(45) NOT NULL,
  `orig` VARCHAR(45) NOT NULL,
  `cam` VARCHAR(45) NOT NULL,
  `adv_photo` VARCHAR(100) NOT NULL,
  `gps` VARCHAR(45) NOT NULL,
  `arch` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idQImage`),
  INDEX `idUser_idx` (`idUser` ASC) VISIBLE,
  INDEX `idDevice_idx` (`idDevice` ASC) VISIBLE,
  CONSTRAINT `idUserQuaImage`
    FOREIGN KEY (`idUser`)
    REFERENCES `SCIH`.`User` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idDeviceQuaImage`
    FOREIGN KEY (`idDevice`)
    REFERENCES `SCIH`.`Device` (`idDevice`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


select * from ReferenceImage;

INSERT INTO ReferenceImage (idDevice, idUser, file, path, des, orig, cam, adv_photo, gps, arch)  VALUES(1,1, 'Practica 8.png', '.\images\ReferenceImage\Practica 8.png', 'test', 'test', 'test', 'test', 'test', 'test');