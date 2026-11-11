USE master
GO
DROP DATABASE BadgeAccess;
GO
CREATE DATABASE BadgeAccess;
GO
USE BadgeAccess;
GO
CREATE TABLE TypePieces (
    Id int PRIMARY KEY,
    [Name] varchar(255) NOT NULL
);
GO
INSERT INTO TypePieces (Id, [Name]) VALUES (1, 'Passport'), (2, 'Permis de conduire'),
(3, 'Carte d''electeur'), (4, 'Carte d''identité nationale'), (5, 'Carte de service');
GO


GO
CREATE TABLE Departments (
    Id int PRIMARY KEY,
    Name varchar(255) NOT NULL
);
GO
CREATE TABLE Agents(
    Id int PRIMARY KEY IDENTITY(1,1),
    FullName varchar(255) NOT NULL,
    [Role] varchar(255), 
    IsActive BIT DEFAULT(1),
    DepartmentId int FOREIGN KEY REFERENCES Departments(Id)
);
GO
CREATE TABLE BadgeCategories(
    Id int PRIMARY KEY,
    Name varchar(255) NOT NULL,
    [Type]  varchar(20) NOT NULL
);
GO
INSERT INTO BadgeCategories (Id, Name, [Type]) 
VALUES (1, 'Cabinet du Gouverneur', 'generic'), 
(2, 'Cabinet Ministeriel', 'generic'), 
(3, 'Administration', 'generic'), 
(4, 'Stagiaire ', 'generic'), 
(5, 'Prestataire', 'generic'), 
(6, 'Participant', 'special'), 
(7, 'Service', 'special'), 
(8, 'Expert', 'special'),
(9, 'Delegate', 'special'),
(10, 'VIP', 'special'),
(11, 'VVIP', 'special');
GO
CREATE TABLE Events (
    Id int not null PRIMARY KEY IDENTITY(1,1),
    [Name] VARCHAR(255) NOT NULL,
    [Description] VARCHAR(2500) ,
    CreatedAtDate DATETIME2 NOT NULL,
    StartDate DATETIME2 NOT NULL,
    EndDate DATETIME2 NOT NULL,
    Place VARCHAR(255) NOT NULL,
    IsActive BIT DEFAULT(1)
)
GO
CREATE TABLE EventBadgeCategories(
    EventId int FOREIGN KEY REFERENCES BadgeCategories(Id),
    CategoryId int NOT NULL FOREIGN KEY REFERENCES BadgeCategories(Id),
)
GO
CREATE TABLE PartnerLists(
  Id int PRIMARY KEY,
  [Name] varchar(255) NOT NULL,
  EventId int FOREIGN KEY REFERENCES BadgeCategories(Id),
)
GO
CREATE TABLE Persons (
    Id int PRIMARY KEY IDENTITY(1,1),
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    ForeName VARCHAR(255),
    Gender CHAR(1),
    PhoneNmber varchar(50),
    Provenance varchar(255),
    [Role] varchar(255),
    TypePieceId int FOREIGN KEY REFERENCES TypePieces(Id),
    PartnerListId int FOREIGN KEY REFERENCES PartnerLists(Id),
);
GO
CREATE TABLE Badges(
    Id int PRIMARY KEY IDENTITY(1,1),
    BadgeNumber varchar(20) NOT NULL, 
    CategoryId int NOT NULL FOREIGN KEY REFERENCES BadgeCategories(Id),
    PersonId int FOREIGN KEY REFERENCES Persons(Id),
    IssueDate DATETIME2 NOT NULL,
    ExpiryDate DATETIME2 NOT NULL,
    IsActive BIT DEFAULT(1)
);
GO

CREATE TABLE Visitors(
    Id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    PersonId int FOREIGN KEY REFERENCES Persons(Id),
    BadgeId int FOREIGN KEY REFERENCES Badges(Id),
    CreatedAtDate DATETIME2 NOT NULL,
    StartDate DATETIME2 NOT NULL,
    EndDate DATETIME2 NOT NULL,
    VisitedPerson VARCHAR(255),
    VisitedPersonRole VARCHAR(255) 
)
