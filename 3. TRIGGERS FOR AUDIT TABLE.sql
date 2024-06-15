IF OBJECT_ID('trgEmployee_Insert', 'TR') IS NOT NULL
    DROP TRIGGER trgEmployee_Insert;
GO 

IF OBJECT_ID('trgEmployee_Update', 'TR') IS NOT NULL
    DROP TRIGGER trgEmployee_Update;
GO

IF OBJECT_ID('trgEmployee_Delete', 'TR') IS NOT NULL
    DROP TRIGGER trgEmployee_Delete;
GO

-- Create Triggers to Capture Changes

--INSERT TRIGGER
CREATE TRIGGER trgEmployee_Insert
ON Employee
AFTER INSERT
AS
BEGIN
    INSERT INTO Employee_Audit (EmpID, EmpEmail, LastName, FirstName, Job_title, Action, ChangeDateTime)
    SELECT EmpID, EmpEmail, LastName, FirstName, Job_title, 'INSERT', GETDATE()
    FROM inserted;
END;
GO

--UPDATE TRIGGER
CREATE TRIGGER trgEmployee_Update
ON Employee
AFTER UPDATE
AS
BEGIN
    INSERT INTO Employee_Audit (EmpID, EmpEmail, LastName, FirstName, Job_title, Action, ChangeDateTime)
    SELECT EmpID, EmpEmail, LastName, FirstName, Job_title, 'UPDATE', GETDATE()
    FROM inserted;
END;
GO

--DELETE TRIGGER
CREATE TRIGGER trgEmployee_Delete
ON Employee
AFTER DELETE
AS
BEGIN
    INSERT INTO Employee_Audit (EmpID, EmpEmail, LastName, FirstName, Job_title, Action, ChangeDateTime)
    SELECT EmpID, EmpEmail, LastName, FirstName, Job_title, 'DELETE', GETDATE()
    FROM deleted;
END;
GO



-- 3. Test the Triggers:

-- Insert into Employee table
INSERT INTO Employee (EmpID, EmpEmail, LastName, FirstName, Job_title)
VALUES (011, 'ram@example.com', 'patel', 'ram', 'Developer');

-- Update Employee table
UPDATE Employee
SET Job_title = 'SAP Developer'
WHERE EmpID = 011;


-- View the data in the Employee_Audit table
SELECT * FROM Employee_Audit;
