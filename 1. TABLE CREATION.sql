IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Employee') AND type = N'U')
    DROP TABLE dbo.Employee;

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Assets') AND type = N'U')
    DROP TABLE dbo.Assets;

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Incident') AND type = N'U')
    DROP TABLE dbo.Incident;

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Reporting') AND type = N'U')
    DROP TABLE dbo.Reporting;

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Alerts') AND type = N'U')
    DROP TABLE dbo.Alerts;

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Investigations') AND type = N'U')
    DROP TABLE dbo.Investigations;

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Resolutions') AND type = N'U')
    DROP TABLE dbo.Resolutions;

-- Dimension Tables
CREATE TABLE dbo.Employee (
    EmpID INT CONSTRAINT PK_Employee PRIMARY KEY,
    EmpEmail VARCHAR(100) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    Job_title VARCHAR(50) NOT NULL
);

CREATE TABLE dbo.Assets (
    AssetID INT CONSTRAINT PK_Assets PRIMARY KEY,
    AssetName VARCHAR(100) NOT NULL,
    AssetType VARCHAR(50) NOT NULL,
    EmpID INT,
    Location VARCHAR(100) NOT NULL,
    Value DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_Assets_Employee FOREIGN KEY (EmpID) REFERENCES dbo.Employee(EmpID)
);

-- Transactional tables
CREATE TABLE dbo.Incident (
    IncidentID INT CONSTRAINT PK_Incident PRIMARY KEY,
    IncidentType VARCHAR(50) NOT NULL,
	IncidentPriority VARCHAR(20) NOT NULL,
    DateCreated DATE NOT NULL,
    IncidentDescription TEXT,
    ReportedBy INT NOT NULL,
    Status VARCHAR(20) NOT NULL,
    CONSTRAINT FK_Incident_Employee FOREIGN KEY (ReportedBy) REFERENCES dbo.Employee(EmpID)
);

CREATE TABLE dbo.Reporting (
    ReportID INT CONSTRAINT PK_Reporting PRIMARY KEY,
    IncidentID INT NOT NULL,
    EmpID INT NOT NULL,
    ReportTimestamp TIMESTAMP NOT NULL,
    ReportContent TEXT,
    CONSTRAINT FK_Reporting_Incident FOREIGN KEY (IncidentID) REFERENCES dbo.Incident(IncidentID),
    CONSTRAINT FK_Reporting_Employee FOREIGN KEY (EmpID) REFERENCES dbo.Employee(EmpID)
);

CREATE TABLE dbo.Alerts (
    AlertID INT CONSTRAINT PK_Alerts PRIMARY KEY,
    AssetID INT NOT NULL,
    IncidentID INT NOT NULL,
    AlertType VARCHAR(50) NOT NULL,
    DateCreated DATE NOT NULL,
    Description TEXT,
    CONSTRAINT FK_Alerts_Assets FOREIGN KEY (AssetID) REFERENCES dbo.Assets(AssetID),
    CONSTRAINT FK_Alerts_Incident FOREIGN KEY (IncidentID) REFERENCES dbo.Incident(IncidentID)
);

CREATE TABLE dbo.Investigations (
    InvestigationID INT IDENTITY(1,1) CONSTRAINT PK_Investigations PRIMARY KEY,
    IncidentID INT NOT NULL,
    POC INT NOT NULL,
    Investigator VARCHAR(100) NOT NULL,
    StartTimestamp TIMESTAMP NOT NULL,
    Finding TEXT,
    CONSTRAINT FK_Investigations_Incident FOREIGN KEY (IncidentID) REFERENCES dbo.Incident(IncidentID),
    CONSTRAINT FK_Investigations_Employee FOREIGN KEY (POC) REFERENCES dbo.Employee(EmpID)
);

CREATE TABLE dbo.Resolutions (
    ResolutionID INT CONSTRAINT PK_Resolutions PRIMARY KEY,
    IncidentID INT NOT NULL,
    ResolvedBy INT NOT NULL,
    ResolutionTimestamp TIMESTAMP NOT NULL,
    ResolutionDetails TEXT,
    CONSTRAINT FK_Resolutions_Incident FOREIGN KEY (IncidentID) REFERENCES dbo.Incident(IncidentID),
    CONSTRAINT FK_Resolutions_Employee FOREIGN KEY (ResolvedBy) REFERENCES dbo.Employee(EmpID)
);




