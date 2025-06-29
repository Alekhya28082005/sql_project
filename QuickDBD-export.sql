CREATE TABLE `Patient` (
    `AadharID` varchar(20)  NOT NULL ,
    `Name` varchar(30)  NOT NULL ,
    `Age` int  NOT NULL ,
    `Address` varchar(50)  NOT NULL ,
    `PrimaryPhysicianID` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `AadharID`
    )
);
 CREATE TABLE `Doctor` (
    `AadharID` varchar(20)  NOT NULL ,
    `Name` varchar(30)  NOT NULL ,
    `Speciality` varchar(20)  NOT NULL ,
    `YearsOfExperience` int  NOT NULL ,
    PRIMARY KEY (
        `AadharID`
    )
);

CREATE TABLE `Prescription` (
    `Date` date  NOT NULL ,
    `PatientID` varchar(20)  NOT NULL ,
    `DoctorID` varchar(20)  NOT NULL ,
    `DrugName` varchar(30) NOT NULL ,
    `Quantity` int  NOT NULL 
);

CREATE TABLE `Drug` (
    `TradeName` varchar(30)  NOT NULL ,
    `Formula` varchar(30)  NOT NULL ,
    `CompanyName` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `TradeName`
    )
);

CREATE TABLE `Pharmacy_Drug` (
    `PharmacyName` varchar(20)  NOT NULL ,
    `DrugName` varchar(30)  NOT NULL ,
    `DrugPrice` float  NOT NULL 
);

CREATE TABLE `Pharmacy` (
    `PharmacyName` varchar(20)  NOT NULL ,
    `Address` varchar(50)  NOT NULL ,
    `Phone` varchar(10)  NOT NULL ,
    PRIMARY KEY (
        `PharmacyName`
    )
);

CREATE TABLE `Contract` (
    `PharmacyName` varchar(20)  NOT NULL ,
    `CompanyName` varchar(20)  NOT NULL ,
    `StartDate` date  NOT NULL ,
    `EndDate` date  NOT NULL ,
    `Content` varchar(100)  NOT NULL ,
    `Supervisor` varchar(20)  NOT NULL 
);

CREATE TABLE `Pharmaceutical_Company` (
    `CompanyName` varchar(20)  NOT NULL ,
    `Phone` varchar(10)  NOT NULL ,
    PRIMARY KEY (
        `CompanyName`
    )
);

ALTER TABLE `Prescription` ADD CONSTRAINT `fk_Prescription_PatientID` FOREIGN KEY(`PatientID`)
REFERENCES `Patient` (`AadharID`);

ALTER TABLE `Prescription` ADD CONSTRAINT `fk_Prescription_DoctorID` FOREIGN KEY(`DoctorID`)
REFERENCES `Doctor` (`AadharID`);

ALTER TABLE `Prescription` ADD CONSTRAINT `fk_Prescription_DrugName` FOREIGN KEY(`DrugName`)
REFERENCES `Drug` (`TradeName`);

ALTER TABLE `Pharmacy_Drug` ADD CONSTRAINT `fk_Pharmacy_Drug_PharmacyName` FOREIGN KEY(`PharmacyName`)
REFERENCES `Pharmacy` (`PharmacyName`);

ALTER TABLE `Pharmacy_Drug` ADD CONSTRAINT `fk_Pharmacy_Drug_DrugName` FOREIGN KEY(`DrugName`)
REFERENCES `Drug` (`TradeName`);

ALTER TABLE `Contract` ADD CONSTRAINT `fk_Contract_PharmacyName` FOREIGN KEY(`PharmacyName`)
REFERENCES `Pharmacy` (`PharmacyName`);

ALTER TABLE `Contract` ADD CONSTRAINT `fk_Contract_CompanyName` FOREIGN KEY(`CompanyName`)
REFERENCES `Pharmaceutical_Company` (`CompanyName`);

