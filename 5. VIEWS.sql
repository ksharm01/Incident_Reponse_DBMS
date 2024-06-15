
------------------------------------------------------------------------------------------------
-- View 1 : IncidentAlertReport
-- The IncidentAlertReport view combines data from the Incident, Alerts, and Employee tables, 
-- displaying incident details such as ID, type, description, and date alongside related alert information.
------------------------------------------------------------------------------------------------

-- Drop the existing Incident Alert Report view if it exists
IF OBJECT_ID('dbo.IncidentAlertReport', 'V') IS NOT NULL
    DROP VIEW dbo.IncidentAlertReport;
GO

CREATE VIEW dbo.IncidentAlertReport AS
SELECT 
    I.IncidentID,
    I.IncidentType,
    I.DateCreated AS IncidentDate,
    I.IncidentDescription,
    A.AlertID,
    A.AlertType,
    A.DateCreated AS AlertDate,
    E.FirstName AS ReporterFirstName,
    E.LastName AS ReporterLastName,
    E.Job_title AS ReporterJobTitle
FROM 
    dbo.Incident I
INNER JOIN 
    dbo.Alerts A ON I.IncidentID = A.IncidentID
INNER JOIN 
    dbo.Employee E ON I.ReportedBy = E.EmpID;

SELECT *
FROM dbo.IncidentAlertReport
WHERE IncidentType = 'Security Breach';


--------------------------------------------------------------------------------------
-- View 2: ClosedInvestigations
-- The ClosedInvestigations view compiles a summary of closed investigations, 
-- displaying incident and investigation IDs, incident creation date, resolution details, 
-- the job title and name of the resolver, incident status, findings, and the duration taken 
-- to resolve each incident in days, providing comprehensive insight into resolved incidents.
---------------------------------------------------------------------------------------

IF OBJECT_ID('dbo.ClosedInvestigations', 'V') IS NOT NULL
    DROP VIEW dbo.ClosedInvestigations;
GO

CREATE VIEW dbo.ClosedInvestigations AS
SELECT 
    I.IncidentID,
    Inv.InvestigationID,
    I.DateCreated AS IncidentDate,
    R.ResolutionDetails,
    ER.Job_title AS ResolvedByJobTitle,
    EResolved.FirstName + ' ' + EResolved.LastName AS ResolvedByName,
    I.Status AS IncidentStatus,
    Inv.Finding
FROM dbo.Investigations Inv
JOIN dbo.Incident I ON Inv.IncidentID = I.IncidentID AND I.Status = 'Closed'
LEFT JOIN dbo.Resolutions R ON Inv.IncidentID = R.IncidentID
LEFT JOIN dbo.Employee EResolved ON R.ResolvedBy = EResolved.EmpID
LEFT JOIN dbo.Employee ER ON R.ResolvedBy = ER.EmpID 

-- Get all Closed investigations
SELECT * FROM dbo.ClosedInvestigations;

----------------------------------------------------------------------------------------------------
-- View 3 : IncidentReportingSummary
-- The IncidentReportingSummary view compiles a summary of incident reporting activities by employees, 
-- presenting employee details alongside the count of reports they generated 
-- providing insights into reporting trends and volumes over time.
----------------------------------------------------------------------------------------------------

IF OBJECT_ID('dbo.IncidentReportingSummary', 'V') IS NOT NULL
    DROP VIEW dbo.IncidentReportingSummary;
GO

CREATE VIEW IncidentReportingSummary AS
SELECT
    E.EmpID,
    E.FirstName,
    E.LastName,
    E.Job_title AS EmployeeTitle,
    COUNT(*) AS NumberOfReports
FROM
    dbo.Incident I
INNER JOIN
    dbo.Employee E ON I.ReportedBy = E.EmpID
GROUP BY
    E.EmpID,
    E.FirstName,
    E.LastName,
    E.Job_title;

SELECT * FROM IncidentReportingSummary;
