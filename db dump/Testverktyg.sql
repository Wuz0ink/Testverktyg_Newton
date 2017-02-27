-- MySQL Script generated by MySQL Workbench
-- Thu Feb 23 12:28:25 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema testverktyg
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema testverktyg
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `testverktyg` DEFAULT CHARACTER SET utf8 ;
USE `testverktyg` ;

-- -----------------------------------------------------
-- Table `testverktyg`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testverktyg`.`Student` (
  `klass` VARCHAR(45) NULL DEFAULT NULL,
  `Person_pNr` VARCHAR(12) NOT NULL,
  INDEX `fk_Student_Person1_idx` (`Person_pNr` ASC),
  PRIMARY KEY (`Person_pNr`),
  CONSTRAINT `fk_Student_Person1`
    FOREIGN KEY (`Person_pNr`)
    REFERENCES `testverktyg`.`Person` (`pNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `Student` (`klass`,`Person_pNr`) VALUES ('Sysjm2','198804045678');
INSERT INTO `Student` (`klass`,`Person_pNr`) VALUES ('Sysjm2','199204011234');
INSERT INTO `Student` (`klass`,`Person_pNr`) VALUES ('Sysjm2','199306177898');
INSERT INTO `Student` (`klass`,`Person_pNr`) VALUES ('Sysjm1','199410026789');
INSERT INTO `Student` (`klass`,`Person_pNr`) VALUES ('Sysjm1','199411146787');
INSERT INTO `Student` (`klass`,`Person_pNr`) VALUES ('Sysjm1','199412093456');
INSERT INTO `Student` (`klass`,`Person_pNr`) VALUES ('Sysjm1','199502253456');


-- -----------------------------------------------------
-- Table `testverktyg`.`Person_has_Person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testverktyg`.`Person_has_Person` (
  `Person_pNr` VARCHAR(12) NOT NULL,
  `Person_pNr1` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`Person_pNr`, `Person_pNr1`),
  INDEX `fk_Person_has_Person_Person2_idx` (`Person_pNr1` ASC),
  INDEX `fk_Person_has_Person_Person1_idx` (`Person_pNr` ASC),
  CONSTRAINT `fk_Person_has_Person_Person1`
    FOREIGN KEY (`Person_pNr`)
    REFERENCES `testverktyg`.`Person` (`pNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Person_has_Person_Person2`
    FOREIGN KEY (`Person_pNr1`)
    REFERENCES `testverktyg`.`Person` (`pNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `Person_has_Person`(`Person_pNr`, `Person_pNr1`) VALUES ('196412083434','198804045678');
INSERT INTO `Person_has_Person`(`Person_pNr`, `Person_pNr1`) VALUES ('196412083434','199204011234');
INSERT INTO `Person_has_Person`(`Person_pNr`, `Person_pNr1`) VALUES ('196412083434','199306177898');
INSERT INTO `Person_has_Person`(`Person_pNr`, `Person_pNr1`) VALUES ('197801147878','199410026789');
INSERT INTO `Person_has_Person`(`Person_pNr`, `Person_pNr1`) VALUES ('197801147878','199411146787');
INSERT INTO `Person_has_Person`(`Person_pNr`, `Person_pNr1`) VALUES ('197801147878','199412093456');
INSERT INTO `Person_has_Person`(`Person_pNr`, `Person_pNr1`) VALUES ('197801147878','199502253456');


-- -----------------------------------------------------
-- Table `testverktyg`.`Person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testverktyg`.`Person` (
  `pNr` VARCHAR(12) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `lösen` VARCHAR(45) NULL DEFAULT NULL,
  `roll` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pNr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `Person` (`pNr`,`Name`,`lösen`,`roll`) VALUES ('196412083434','Johanna Andersson', NULL,'Teacher');
INSERT INTO `Person` (`pNr`,`Name`,`lösen`,`roll`) VALUES ('197801147878','Carl Hamilton','1234','Teacher');
INSERT INTO `Person` (`pNr`,`Name`,`lösen`,`roll`) VALUES ('198804045678','Isabelle Larsson','1234','Student');
INSERT INTO `Person` (`pNr`,`Name`,`lösen`,`roll`) VALUES ('199204011234','Alexandra Karlsson',NULL,'Student');
INSERT INTO `Person` (`pNr`,`Name`,`lösen`,`roll`) VALUES ('199306177898','Andreas Persson',NULL,'Student');
INSERT INTO `Person` (`pNr`,`Name`,`lösen`,`roll`) VALUES ('199410026789','Hanna Jepsson',NULL,'Student');
INSERT INTO `Person` (`pNr`,`Name`,`lösen`,`roll`) VALUES ('199411146787','Alexande Lundgren',NULL,'Student');
INSERT INTO `Person` (`pNr`,`Name`,`lösen`,`roll`) VALUES ('199412093456','Rasmus Karlsson','1234','Student');
INSERT INTO `Person` (`pNr`,`Name`,`lösen`,`roll`) VALUES ('199502253456','Hampus Persson',NULL,'Student');



-- -----------------------------------------------------
-- Table `testverktyg`.`Test`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testverktyg`.`Test` (
  `idTest` INT(11) NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  `start` DATETIME NULL DEFAULT NULL,
  `stop` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`idTest`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `Test` (`idTest`,`Title`,`start`,`stop`) VALUES (1,'Math A','2017-03-03 00:00:00','2017-03-23 00:00:00');



-- -----------------------------------------------------
-- Table `testverktyg`.`Person_has_Test`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testverktyg`.`Person_has_Test` (
  `Person_pNr` VARCHAR(12) NOT NULL,
  `Test_idTest` INT(11) NOT NULL,
  PRIMARY KEY (`Person_pNr`, `Test_idTest`),
  INDEX `fk_Person_has_Test_Test1_idx` (`Test_idTest` ASC),
  INDEX `fk_Person_has_Test_Person1_idx` (`Person_pNr` ASC),
  CONSTRAINT `fk_Person_has_Test_Person1`
    FOREIGN KEY (`Person_pNr`)
    REFERENCES `testverktyg`.`Person` (`pNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Person_has_Test_Test1`
    FOREIGN KEY (`Test_idTest`)
    REFERENCES `testverktyg`.`Test` (`idTest`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `Person_has_Test` (`Person_pNr`,`Test_idTest`) VALUES ('198804045678',1);
INSERT INTO `Person_has_Test` (`Person_pNr`,`Test_idTest`) VALUES ('199204011234',1);
INSERT INTO `Person_has_Test` (`Person_pNr`,`Test_idTest`) VALUES ('199306177898',1);


-- -----------------------------------------------------
-- Table `testverktyg`.`Question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testverktyg`.`Question` (
  `idQuestion` INT(11) NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(45) NOT NULL,
  `Question` MEDIUMTEXT NOT NULL,
  `HTML-element` MEDIUMTEXT NULL DEFAULT NULL,
  `img` MEDIUMTEXT NULL DEFAULT NULL,
  `type` VARCHAR(45) NOT NULL,
  `Test_idTest` INT(11) NOT NULL,
  PRIMARY KEY (`idQuestion`),
  INDEX `fk_Question_Test_idx` (`Test_idTest` ASC),
  CONSTRAINT `fk_Question_Test`
    FOREIGN KEY (`Test_idTest`)
    REFERENCES `testverktyg`.`Test` (`idTest`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;

INSERT INTO `Question` (`idQuestion`,`Title`,`Question`,`HTML-element`,`img`,`type`,`Test_idTest`) VALUES (1,'Question 1','What is the diameter of the moon?',NULL,NULL,'mp',1);
INSERT INTO `Question` (`idQuestion`,`Title`,`Question`,`HTML-element`,`img`,`type`,`Test_idTest`) VALUES (2,'Quesiton 2','What is 4+5?',NULL,NULL,'mp',1);
INSERT INTO `Question` (`idQuestion`,`Title`,`Question`,`HTML-element`,`img`,`type`,`Test_idTest`) VALUES (3,'Question 3','What 10-2?',NULL,NULL,'mp',1);
INSERT INTO `Question` (`idQuestion`,`Title`,`Question`,`HTML-element`,`img`,`type`,`Test_idTest`) VALUES (4,'Quesiton 4','Where is Nicole Kidman from?',NULL,NULL,'mp',1);



-- -----------------------------------------------------
-- Table `testverktyg`.`QuestionOption`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testverktyg`.`QuestionOption` (
  `idQuestionOption` INT(11) NOT NULL AUTO_INCREMENT,
  `QuestionOption` VARCHAR(45) NOT NULL,
  `trueFalse` TINYINT(1) NOT NULL,
  `Question_idQuestion` INT(11) NOT NULL,
  PRIMARY KEY (`idQuestionOption`),
  INDEX `fk_Option_Question1_idx` (`Question_idQuestion` ASC),
  CONSTRAINT `fk_Option_Question1`
    FOREIGN KEY (`Question_idQuestion`)
    REFERENCES `testverktyg`.`Question` (`idQuestion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;

INSERT INTO `QuestionOption` (`idQuestionOption`,`QuestionOption`,`trueFalse`,`Question_idQuestion`) VALUES (1,'The moon is full',1,1);
INSERT INTO `QuestionOption` (`idQuestionOption`,`QuestionOption`,`trueFalse`,`Question_idQuestion`) VALUES (2,'The diameter equals 3 476 km',2,1);
INSERT INTO `QuestionOption` (`idQuestionOption`,`QuestionOption`,`trueFalse`,`Question_idQuestion`) VALUES (3,'It\'s not possible to know',1,1);
INSERT INTO `QuestionOption` (`idQuestionOption`,`QuestionOption`,`trueFalse`,`Question_idQuestion`) VALUES (4,'9',2,2);
INSERT INTO `QuestionOption` (`idQuestionOption`,`QuestionOption`,`trueFalse`,`Question_idQuestion`) VALUES (5,'11',1,2);
INSERT INTO `QuestionOption` (`idQuestionOption`,`QuestionOption`,`trueFalse`,`Question_idQuestion`) VALUES (6,'22',1,2);
INSERT INTO `QuestionOption` (`idQuestionOption`,`QuestionOption`,`trueFalse`,`Question_idQuestion`) VALUES (7,'3',1,3);
INSERT INTO `QuestionOption` (`idQuestionOption`,`QuestionOption`,`trueFalse`,`Question_idQuestion`) VALUES (8,'0',1,3);
INSERT INTO `QuestionOption` (`idQuestionOption`,`QuestionOption`,`trueFalse`,`Question_idQuestion`) VALUES (9,'8',2,3);
INSERT INTO `QuestionOption` (`idQuestionOption`,`QuestionOption`,`trueFalse`,`Question_idQuestion`) VALUES (10,'Australia',2,4);
INSERT INTO `QuestionOption` (`idQuestionOption`,`QuestionOption`,`trueFalse`,`Question_idQuestion`) VALUES (11,'Russia',1,4);
INSERT INTO `QuestionOption` (`idQuestionOption`,`QuestionOption`,`trueFalse`,`Question_idQuestion`) VALUES (12,'USA',1,4);



-- -----------------------------------------------------
-- Table `testverktyg`.`Response`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testverktyg`.`Response` (
  `idResponse` INT(11) NOT NULL AUTO_INCREMENT,
  `response` VARCHAR(45) NOT NULL,
  `Person_pNr` VARCHAR(12) NOT NULL,
  `Question_idQuestion` INT(11) NOT NULL,
  PRIMARY KEY (`idResponse`),
  INDEX `fk_Response_Person1_idx` (`Person_pNr` ASC),
  INDEX `fk_Response_Question1_idx` (`Question_idQuestion` ASC),
  CONSTRAINT `fk_Response_Question1`
    FOREIGN KEY (`Question_idQuestion`)
    REFERENCES `testverktyg`.`Question` (`idQuestion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------




SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
