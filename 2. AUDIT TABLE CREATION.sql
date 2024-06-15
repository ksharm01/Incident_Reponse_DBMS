IF OBJECT_ID('Employee_Audit', 'U') IS NOT NULL
    DROP TABLE Employee_Audit;

CREATE TABLE Employee_Audit (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    EmpID INT NOT NULL,
    EmpEmail VARCHAR(100) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    Job_title VARCHAR(50) NOT NULL,
    Action VARCHAR(10) NOT NULL,
    ChangeDateTime DATETIME NOT NULL
);



