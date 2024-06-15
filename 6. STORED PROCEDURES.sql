
---------------------------------------------------------------------------------------------------------------------------------
-- Stored procedure named 'HighPriorityIncidents' to find those incidents which have high proiority and are open
---------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'HighPriorityIncidents' AND ROUTINE_TYPE = 'PROCEDURE')
BEGIN
    DROP PROCEDURE HighPriorityIncidents;
END
GO

CREATE PROCEDURE HighPriorityIncidents
    @incidentPriority VARCHAR(50),
    @status VARCHAR(50)
AS
BEGIN
    SELECT
        I.IncidentID,
        I.IncidentType,
        I.DateCreated,
        I.IncidentDescription,
        R.EmpID AS ReportedByID,
        E.FirstName,
        E.LastName
    FROM
        dbo.Incident AS I
    INNER JOIN
        dbo.Reporting AS R ON I.IncidentID = R.IncidentID
    INNER JOIN
        dbo.Employee AS E ON R.EmpID = E.EmpID
    WHERE
        I.IncidentPriority = @incidentPriority AND I.Status = @status;
END;

EXEC HighPriorityIncidents @incidentPriority = 'HIGH', @status = 'Open';

EXEC HighPriorityIncidents @incidentPriority = 'LOW', @status = 'Open';

EXEC HighPriorityIncidents @incidentPriority = 'MEDIUM', @status = 'Open';

---------------------------------------------------------------------------------------------------------------------------------
-- UpdateIncidentStatus: This procedure could update the status of an incident based on its IncidentID. 
-- It would take the IncidentID and the new status as input parameters, allowing for the modification of an incident's status.
---------------------------------------------------------------------------------------------------------------------------------

-- Drop the procedure if it exists
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'UpdateIncidentStatus' AND ROUTINE_TYPE = 'PROCEDURE')
BEGIN
    DROP PROCEDURE UpdateIncidentStatus;
END
GO

-- Create a procedure to update incident status based on IncidentID
CREATE PROCEDURE UpdateIncidentStatus
    @incidentID INT,
    @newStatus VARCHAR(20)
AS
BEGIN
    UPDATE dbo.Incident
    SET Status = @newStatus
    WHERE IncidentID = @incidentID;
END;


EXEC UpdateIncidentStatus @incidentID = 201, @newStatus = 'Closed';

-- Display the updated Incident table
SELECT * FROM Incident;