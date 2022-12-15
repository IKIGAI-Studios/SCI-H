-- -----------------------------------------------------
-- Database bydyedlbqilmoph6nqcf
-- -----------------------------------------------------
USE `bydyedlbqilmoph6nqcf` ;

-- -----------------------------------------------------
-- Table `bydyedlbqilmoph6nqcf`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bydyedlbqilmoph6nqcf`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL UNIQUE,
  `password` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bydyedlbqilmoph6nqcf`.`Device`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bydyedlbqilmoph6nqcf`.`Device` (
  `idDevice` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT NOT NULL,
  `brand` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `img_count` INT NOT NULL,
  PRIMARY KEY (`idDevice`),
  INDEX `idUser_idx` (`idUser` ASC) VISIBLE,
  CONSTRAINT `idUserDevice`
    FOREIGN KEY (`idUser`)
    REFERENCES `bydyedlbqilmoph6nqcf`.`User` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bydyedlbqilmoph6nqcf`.`ReferenceImage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bydyedlbqilmoph6nqcf`.`ReferenceImage` (
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
    REFERENCES `bydyedlbqilmoph6nqcf`.`User` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idDeviceRefImage`
    FOREIGN KEY (`idDevice`)
    REFERENCES `bydyedlbqilmoph6nqcf`.`Device` (`idDevice`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `bydyedlbqilmoph6nqcf`.`DisputeImage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bydyedlbqilmoph6nqcf`.`DisputeImage` (
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
  CONSTRAINT `idUserDisImage`
    FOREIGN KEY (`idUser`)
    REFERENCES `bydyedlbqilmoph6nqcf`.`User` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idDeviceDisImage`
    FOREIGN KEY (`idDevice`)
    REFERENCES `bydyedlbqilmoph6nqcf`.`Device` (`idDevice`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

ALTER TABLE `bydyedlbqilmoph6nqcf`.`Device` 
ADD COLUMN `route` VARCHAR(100) NOT NULL AFTER `img_count`,
ADD COLUMN `model_count` INT(11) NOT NULL AFTER `route`,
CHANGE COLUMN `idDevice` `idDevice` INT(11) NOT NULL ;

delete from ReferenceImage where idRImage = 3;
select * from Device;
SELECT idDevice, img_count FROM Device;
SELECT path, file FROM ReferenceImage WHERE idDevice = 21;
select * from ReferenceImage;
DELETE FROM DisputeImage WHERE idQImage between 20 and 22;
INSERT INTO Device VALUES (null, 1, "Example Brand", "Example Model", "0");
INSERT INTO ReferenceImage (idDevice, idUser, file, path, des, orig, cam, adv_photo, gps, arch)  VALUES(1,1, 'Example_Image.png', '.\images\ReferenceImage\Example_Image.png', 'exmpl', 'exmpl', 'exmpl', 'exmpl', 'exmpl', 'exmpl');
SELECT idRImage, file, username FROM ReferenceImage JOIN User on User.idUser = ReferenceImage.idUser WHERE ReferenceImage.idUser = 1;

SELECT count(idDevice) n FROM Device;

SELECT max(img_count) c FROM ReferenceImage JOIN Device ON Device.idDevice = ReferenceImage.idDevice;
SELECT count(*) c FROM DisputeImage;
SELECT DISTINCT(Device.idDevice), img_count c FROM ReferenceImage JOIN Device ON Device.idDevice = ReferenceImage.idDevice ORDER BY img_count DESC LIMIT 1;
SELECT img_count FROM Device WHERE img_count