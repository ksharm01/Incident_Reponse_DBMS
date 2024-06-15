----------------------------------------------------------------------------------------
-- Cursor 1: validation_cursor
-- to ensure data integrity between the Incident and Investigations tables by checking if each incident has a corresponding investigation.
-- if an investigation doesn't exist for an IncidentID in Investigations table, it adds a default investigation record for it.
-----------------------------------------------------------------------------------------

INSERT INTO dbo.Incident (IncidentID, IncidentType, IncidentPriority, DateCreated, IncidentDescription, ReportedBy, Status)
VALUES
		(221, 'Network Maintenance', 'Low', '2024-09-15', 'Scheduled network maintenance.', 7, 'Closed'),
		(222, 'Server Downtime', 'High', '2024-10-20', 'Unplanned server downtime.', 9, 'Open'),
		(223, 'Database Optimization', 'Medium', '2024-11-05', 'Optimizing database performance.', 11, 'Open');

DECLARE @IncidentID INT

DECLARE validation_cursor CURSOR FOR
SELECT IncidentID
FROM dbo.Incident

OPEN validation_cursor
FETCH NEXT FROM validation_cursor INTO @IncidentID

WHILE @@FETCH_STATUS = 0
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Investigations WHERE IncidentID = @IncidentID)
    BEGIN
        PRINT 'Incident ' + CAST(@IncidentID AS VARCHAR(10)) + ' lacks an investigation.'
        
        -- Perform corrective action or logging
        INSERT INTO dbo.Investigations (IncidentID, POC, Investigator, Finding)
        VALUES (@IncidentID, 3, 'Default Investigator', 'No investigation conducted')
        
        -- Log the action or perform any necessary updates
        
        PRINT 'Default investigation record added for Incident ' + CAST(@IncidentID AS VARCHAR(10))
    END

    FETCH NEXT FROM validation_cursor INTO @IncidentID
END

CLOSE validation_cursor 
DEALLOCATE validation_cursor

-- Display newly updated data from the Investigations table 
SELECT TOP 5 * 
FROM Investigations
ORDER BY InvestigationID DESC;

-- Display data from the Investigations table
SELECT * FROM Investigations;

----------------------------------------------------------------------------------------
-- Cursor 2: asset_cursor
--  to calculate the total value of assets for each employee from the Assets table.
-----------------------------------------------------------------------------------------

DECLARE @EmpID INT
DECLARE @TotalAssetValue DECIMAL(10, 2)

DECLARE asset_cursor CURSOR FOR
SELECT EmpID
FROM dbo.Employee

OPEN asset_cursor
FETCH NEXT FROM asset_cursor INTO @EmpID

WHILE @@FETCH_STATUS = 0
BEGIN
    SELECT @TotalAssetValue = SUM(Value)
    FROM dbo.Assets
    WHERE EmpID = @EmpID

    PRINT 'Employee ID: ' + CAST(@EmpID AS VARCHAR(10)) + ', Total Asset Value: ' + ISNULL(CAST(@TotalAssetValue AS VARCHAR(20)), '0')

    FETCH NEXT FROM asset_cursor INTO @EmpID
END

CLOSE asset_cursor
DEALLOCATE asset_cursor



