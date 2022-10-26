-- -----------------------------------------------------
-- Database MATLAB
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `MATLAB` DEFAULT CHARACTER SET utf8 ;
USE `MATLAB` ;

-- -----------------------------------------------------
-- Table `MATLAB`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MATLAB`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MATLAB`.`Device`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MATLAB`.`Device` (
  `idDevice` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT NOT NULL,
  `brand` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `img_count` VARCHAR(45) NULL,
  PRIMARY KEY (`idDevice`),
  INDEX `idUser_idx` (`idUser` ASC) VISIBLE,
  CONSTRAINT `idUserDevice`
    FOREIGN KEY (`idUser`)
    REFERENCES `MATLAB`.`User` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MATLAB`.`ReferenceImage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MATLAB`.`ReferenceImage` (
  `idRImage` INT NOT NULL AUTO_INCREMENT,
  `idDevice` INT NOT NULL,
  `idUser` INT NOT NULL,
  `file` VARCHAR(45) NOT NULL,
  `path` VARCHAR(45) NOT NULL,
  `desc` VARCHAR(45) NOT NULL,
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
    REFERENCES `MATLAB`.`User` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idDeviceRefImage`
    FOREIGN KEY (`idDevice`)
    REFERENCES `MATLAB`.`Device` (`idDevice`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `MATLAB`.`QuarrelImage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MATLAB`.`QuarrelImage` (
  `idQImage` INT NOT NULL AUTO_INCREMENT,
  `idDevice` INT NOT NULL,
  `idUser` INT NOT NULL,
  `file` VARCHAR(45) NOT NULL,
  `path` VARCHAR(45) NOT NULL,
  `desc` VARCHAR(45) NOT NULL,
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
    REFERENCES `MATLAB`.`User` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idDeviceQuaImage`
    FOREIGN KEY (`idDevice`)
    REFERENCES `MATLAB`.`Device` (`idDevice`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;