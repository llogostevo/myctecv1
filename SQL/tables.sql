CREATE TABLE `myCTECv1`.`centreTable` (
  `centreNumber` INT NOT NULL,
  `centreName` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`centreNumber`));


  CREATE TABLE `myCTECv1`.`courses` (
  `courseCode` VARCHAR(45) NOT NULL,
  `courseName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`courseCode`));

  CREATE TABLE `myCTECv1`.`centreCourses` (
  	`courseCode` VARCHAR(45) NOT NULL,
  	`centreNumber` INT NOT NULL,
  	PRIMARY KEY (`courseCode`, `centreNumber`)
	FOREIGN KEY (`centreNumber`) REFERENCES `myCTECv1`.`centreTable`(`centreNumber`),
  FOREIGN KEY (`courseCode`) REFERENCES `myCTECv1`.`courses`(`courseCode`)
  
	);

CREATE TABLE `myCTECv1`.`Student` (
  	`candidateNumber` VARCHAR(45) NOT NULL,
  	`studentFirstName` VARCHAR(100) NOT NULL,
  	`studentLastName` VARCHAR(100) NOT NULL,
  	`centreNumber` INT,
  	PRIMARY KEY (`candidateNumber`),
	FOREIGN KEY (`centreNumber`) REFERENCES `myCTECv1`.`centreTable`(`centreNumber`)
	);

	CREATE TABLE `myCTECv1`.`unit` (
	`unitCode` VARCHAR(45) NOT NULL,
	`unitTitle` VARCHAR(45) NOT NULL,
	`unitNumber` VARCHAR(45) NOT NULL,
  `courseCode` VARCHAR(45) NOT NULL,
  `GLH` INT NOT NULL,
  PRIMARY KEY (`unitCode`),
  FOREIGN KEY (`courseCode`) REFERENCES `myCTECv1`.`courses`(`courseCode`));

  CREATE TABLE `myCTECv1`.`learningOutcomes` (
	`learningOutcomeID` INT NOT NULL AUTO_INCREMENT,
	`learningOutcomeName` VARCHAR(45) NOT NULL,
	`learningOutcomeNumber` VARCHAR(3) NOT NULL,
  `unitCode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`learningOutcomeID`),
  FOREIGN KEY (`unitCode`) REFERENCES `myCTECv1`.`unit`(`unitCode`));


CREATE TABLE `myCTECv1`.`learningOutcomeCriteria` (
	`loCriteriaID` INT NOT NULL AUTO_INCREMENT,
	`criteria` VARCHAR(3) NOT NULL,
	`criteriaDesc` VARCHAR(250) NOT NULL,
  `level` VARCHAR(1) NOT NULL,
  `learningOutcomeID` INT NOT NULL,
  PRIMARY KEY (`loCriteriaID`),
  FOREIGN KEY (`learningOutcomes`) REFERENCES `myCTECv1`.`unit`(`learningOutcomeID`));


CREATE TABLE `myCTECv1`.`teacher` (
  	`teacherID` INT NOT NULL AUTO_INCREMENT,
  	`teacherFirstName` VARCHAR(100) NOT NULL,
  	`teacherLastName` VARCHAR(100) NOT NULL,
  	`centreNumber` INT,
  	PRIMARY KEY (`teacherID`),
	FOREIGN KEY (`centreNumber`) REFERENCES `myCTECv1`.`centreTable`(`centreNumber`)
	);

CREATE TABLE `myCTECv1`.`qualification` (
	`qualificationID` INT NOT NULL AUTO_INCREMENT,
	`totalLearningHours` INT NOT NULL,
	`qualificationTitle` VARCHAR(250) NOT NULL,
	`qualificationSubject` VARCHAR(250) NOT NULL,
	`qualificationPathway` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`qualificationID`));

CREATE TABLE `myCTECv1`.`qualificationUnit` (
	`qualificationID` INT NOT NULL ,
	`unitCode` INT NOT NULL,
	`mandatory` BOOLEAN NOT NULL,
  PRIMARY KEY (`qualificationID`, `unitCode`),
  FOREIGN KEY (`qualificationID`) REFERENCES `myCTECv1`.`qualification`(`qualificationID`),
  FOREIGN KEY (`unitCode`) REFERENCES `myCTECv1`.`unit`(`unitCode`)
  );

CREATE TABLE `myCTECv1`.`unitAssessment` (
	`unitAssessmentID` INT NOT NULL AUTO_INCREMENT,
	`overallGrade` CHAR(1),
	`teacherID` INT NOT NULL,
	`teacherID` INT NOT NULL,
	`candidateNumber` INT NOT NULL,
	`date` DATE,
  PRIMARY KEY (`unitAssessmentID`),
  FOREIGN KEY (`teacherID`) REFERENCES `myCTECv1`.`teacher`(`teacherID`),
  FOREIGN KEY (`candidateNumber`) REFERENCES `myCTECv1`.`student`(`candidateNumber`)
  );

  CREATE TABLE `myCTECv1`.`criteriaAssessment` (
	`unitAssessmentID` INT NOT NULL,
	`loCriteriaID` INT NOT NULL,
	`criteriaAchieved` BOOLEAN NOT NULL,
	`evidenceLocation` VARCHAR(500) NOT NULL,
	`teacherComment` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`unitAssessmentID`, `loCriteriaID`),
  FOREIGN KEY (`unitAssessmentID`) REFERENCES `myCTECv1`.`unitAssessment`(`unitAssessmentID`),
  FOREIGN KEY (`loCriteriaID`) REFERENCES `myCTECv1`.`unit`(`loCriteriaID`)
  );





