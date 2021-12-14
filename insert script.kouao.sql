-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Blood_Donation_Database
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Blood_Donation_Database` ;

-- -----------------------------------------------------
-- Schema Blood_Donation_Database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Blood_Donation_Database` DEFAULT CHARACTER SET utf8 ;
USE `Blood_Donation_Database` ;

-- -----------------------------------------------------
-- Table `Blood_Donation_Database`.`Patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Blood_Donation_Database`.`Patient` ;

CREATE TABLE IF NOT EXISTS `Blood_Donation_Database`.`Patient` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `dob` DATE NOT NULL,
  `blood_group` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `medical_condition` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `blood_group_UNIQUE` (`blood_group` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Blood_Donation_Database`.`Donor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Blood_Donation_Database`.`Donor` ;

CREATE TABLE IF NOT EXISTS `Blood_Donation_Database`.`Donor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `blood_group` VARCHAR(45) NOT NULL,
  `dob` DATE NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `medical_condition` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Donor_id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Blood_Donation_Database`.`blood_bank`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Blood_Donation_Database`.`blood_bank` ;

CREATE TABLE IF NOT EXISTS `Blood_Donation_Database`.`blood_bank` (
  `id` INT NOT NULL,
  `blood_group` VARCHAR(45) NOT NULL,
  `date_of_prelevement` VARCHAR(45) NOT NULL,
  `comment` VARCHAR(200) NULL,
  `Patient_id` INT NOT NULL,
  `Donor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `blood_id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_blood_bank_Patient1_idx` (`Patient_id` ASC) VISIBLE,
  INDEX `fk_blood_bank_Donor1_idx` (`Donor_id` ASC) VISIBLE,
  CONSTRAINT `fk_blood_bank_Patient1`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `Blood_Donation_Database`.`Patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_blood_bank_Donor1`
    FOREIGN KEY (`Donor_id`)
    REFERENCES `Blood_Donation_Database`.`Donor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Blood_Donation_Database`.`staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Blood_Donation_Database`.`staff` ;

CREATE TABLE IF NOT EXISTS `Blood_Donation_Database`.`staff` (
  `id` INT NOT NULL,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `dob` DATE NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `staff_id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Blood_Donation_Database`.`staff_departement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Blood_Donation_Database`.`staff_departement` ;

CREATE TABLE IF NOT EXISTS `Blood_Donation_Database`.`staff_departement` (
  `id` INT NOT NULL,
  `category_description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `departement_id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Blood_Donation_Database`.`staff_has_staff_departement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Blood_Donation_Database`.`staff_has_staff_departement` ;

CREATE TABLE IF NOT EXISTS `Blood_Donation_Database`.`staff_has_staff_departement` (
  `staff_id` INT NOT NULL,
  `staff_departement_id` INT NOT NULL,
  PRIMARY KEY (`staff_id`, `staff_departement_id`),
  INDEX `fk_staff_has_staff_departement_staff_departement1_idx` (`staff_departement_id` ASC) VISIBLE,
  INDEX `fk_staff_has_staff_departement_staff1_idx` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `fk_staff_has_staff_departement_staff1`
    FOREIGN KEY (`staff_id`)
    REFERENCES `Blood_Donation_Database`.`staff` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_staff_has_staff_departement_staff_departement1`
    FOREIGN KEY (`staff_departement_id`)
    REFERENCES `Blood_Donation_Database`.`staff_departement` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Blood_Donation_Database`.`blood_bank_has_staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Blood_Donation_Database`.`blood_bank_has_staff` ;

CREATE TABLE IF NOT EXISTS `Blood_Donation_Database`.`blood_bank_has_staff` (
  `blood_bank_id` INT NOT NULL,
  `staff_id` INT NOT NULL,
  PRIMARY KEY (`blood_bank_id`, `staff_id`),
  INDEX `fk_blood_bank_has_staff_staff1_idx` (`staff_id` ASC) VISIBLE,
  INDEX `fk_blood_bank_has_staff_blood_bank1_idx` (`blood_bank_id` ASC) VISIBLE,
  CONSTRAINT `fk_blood_bank_has_staff_blood_bank1`
    FOREIGN KEY (`blood_bank_id`)
    REFERENCES `Blood_Donation_Database`.`blood_bank` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_blood_bank_has_staff_staff1`
    FOREIGN KEY (`staff_id`)
    REFERENCES `Blood_Donation_Database`.`staff` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

use blood_donation_database;
insert into donor
VALUES (1,'Fulgence', 'Dalo','O', '1984-12-12', '123 joshua st', '123-345-1234','M', 'diabete'),
       (2,'franck', 'koli','A', '1985-12-12', '145 joshua st', '123-334-1234','M', 'cancer'); 
 
insert into patient
values (1,'kouadio', 'kouao', '1980-12-12', 'B', '123 joshua st', '123-345-5534', 'M', 'diabete' ),
	   (2,'Lorane', 'yao', '1983-12-12', 'AB', '34 franklin st', '123-345-3494', 'F', 'diabete' );

insert into staff
values (1, 'Gallo', 'Joe', '1988-12-12', '123 joshua st', '123-345-5534' ),
	   (2, 'Jhon', 'maham', '1970-12-12', '12 lhon st', '345-345-5534' );

insert into staff_departement
values (1, 'neurologist'),
	   (2, 'gynecologist');

insert into blood_bank
values (1, 'O', '2020-12-12', 'The prelevement was normal', 1, 2),
       (2, 'B', '2019-12-12', 'The prelevement was normal', 2, 2);

insert into staff_has_staff_departement
values (1, 2),
       (2, 2);
insert into blood_bank_has_staff
values (1, 1),
	   (2, 1);



