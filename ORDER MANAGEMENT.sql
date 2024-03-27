CREATE TABLE Victims (
    VictimID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactInfo VARCHAR(255)
);

CREATE TABLE Suspects (
    SuspectID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactInfo VARCHAR(255)
);

CREATE TABLE LawEnforcementAgencies (
    AgencyID INT PRIMARY KEY,
    AgencyName VARCHAR(100),
    Jurisdiction VARCHAR(100),
    ContactInfo VARCHAR(255)
);

CREATE TABLE Officers (
    OfficerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BadgeNumber VARCHAR(20),
    Rank VARCHAR(50),
    ContactInfo VARCHAR(255),
    AgencyID INT,
    FOREIGN KEY (AgencyID) REFERENCES LawEnforcementAgencies(AgencyID)
);

CREATE TABLE Incidents (
    IncidentID INT PRIMARY KEY,
    IncidentType VARCHAR(100),
    IncidentDate DATE,
    Location GEOMETRY,
    Description TEXT,
    Status VARCHAR(50),
    VictimID INT,
    SuspectID INT,
    AgencyID INT,
    FOREIGN KEY (VictimID) REFERENCES Victims(VictimID),
    FOREIGN KEY (SuspectID) REFERENCES Suspects(SuspectID),
    FOREIGN KEY (AgencyID) REFERENCES LawEnforcementAgencies(AgencyID)
);

CREATE TABLE Evidence (
    EvidenceID INT PRIMARY KEY,
    Description TEXT,
    LocationFound VARCHAR(255),
    IncidentID INT,
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID)
);

CREATE TABLE Reports (
    ReportID INT PRIMARY KEY,
    IncidentID INT,
    ReportingOfficer INT,
    ReportDate DATE,
    ReportDetails TEXT,
    Status VARCHAR(50),
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID),
    FOREIGN KEY (ReportingOfficer) REFERENCES Officers(OfficerID)
);
