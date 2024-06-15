-- Inserting data into Employee table
INSERT INTO dbo.Employee (EmpID, EmpEmail, LastName, FirstName, Job_title)
VALUES
    (001, 'john@example.com', 'Doe', 'John', 'Manager'),
    (002, 'jane@example.com', 'Smith', 'Jane', 'Developer'),
    (003, 'mark@example.com', 'Johnson', 'Mark', 'Analyst'),
    (004, 'sara@example.com', 'Williams', 'Sara', 'Designer'),
    (005, 'chris@example.com', 'Brown', 'Chris', 'Engineer'),
    (006, 'emily@example.com', 'Jones', 'Emily', 'Administrator'),
    (007, 'matt@example.com', 'Anderson', 'Matt', 'Consultant'),
    (008, 'laura@example.com', 'Taylor', 'Laura', 'Supervisor'),
    (009, 'sam@example.com', 'Clark', 'Sam', 'Coordinator'),
    (010, 'anna@example.com', 'Martinez', 'Anna', 'Assistant');



-- Inserting data into Assets table
INSERT INTO dbo.Assets (AssetID, AssetName, AssetType, EmpID, Location, Value)
VALUES
    (101, 'Laptop', 'Computer', 1, 'Office Room 101', 1200.00),
    (102, 'Printer', 'Peripheral', 2, 'IT Department', 1800.50),
    (103, 'Scanner', 'Peripheral', 3, 'Printing Room', 500.00),
    (104, 'Projector', 'Presentation', 4, 'Conference Room', 1500.75),
    (105, 'Tablet', 'Computer', 5, 'Field Operations', 800.00),
    (106, 'Server', 'Computer', 6, 'Data Center', 2500.00),
    (107, 'Smartphone', 'Communication', 7, 'Mobile Division', 1000.25),
    (108, 'Monitor', 'Peripheral', 8, 'Office Room 102', 600.50),
    (109, 'Desktop', 'Computer', 9, 'Archives', 300.00),
    (110, 'Camera', 'Photography', 10, 'Photography Studio', 700.00);


-- Inserting data into Incident table
INSERT INTO dbo.Incident (IncidentID, IncidentType, IncidentPriority, DateCreated, IncidentDescription, ReportedBy, Status)
VALUES
    (201, 'Bug', 'High', '2023-01-01', 'Application crashed unexpectedly.', 1, 'Open'),
    (202, 'Security Breach', 'High', '2023-02-05', 'Data breach detected.', 2, 'Open'),
    (203, 'Hardware Failure', 'Medium', '2023-03-10', 'Server failure in the data center.', 3, 'Closed'),
    (204, 'Data Loss', 'High', '2023-04-15', 'Critical data loss due to system error.', 4, 'Open'),
    (205, 'Network Outage', 'Low', '2023-05-20', 'Loss of connectivity in the main office.', 5, 'Open'),
    (206, 'Performance Issue', 'Medium', '2023-06-25', 'Application running slow.', 6, 'Open'),
    (207, 'User Error', 'Low', '2023-07-30', 'Accidental data deletion by user.', 7, 'Closed'),
    (208, 'System Maintenance', 'Low', '2023-08-31', 'Scheduled system downtime for maintenance.', 8, 'Closed'),
    (209, 'Power Outage', 'Medium', '2023-09-02', 'Office power outage.', 9, 'Open'),
    (210, 'Software Upgrade', 'Low', '2023-10-05', 'Upgrading operating systems.', 10, 'Open'),
    (211, 'Bug', 'Medium', '2023-11-08', 'Application bug reported.', 1, 'Closed'),
    (212, 'Security Breach', 'Low', '2023-12-12', 'Minor security issue detected.', 2, 'Open'),
    (213, 'Hardware Failure', 'High', '2024-01-15', 'Critical hardware failure.', 3, 'Open'),
    (214, 'Data Loss', 'Medium', '2024-02-18', 'Partial data loss detected.', 4, 'Closed'),
    (215, 'Network Outage', 'Low', '2024-03-22', 'Temporary network disruption.', 5, 'Open'),
    (216, 'Performance Issue', 'High', '2024-04-25', 'Critical performance degradation.', 6, 'Open'),
    (217, 'User Error', 'Medium', '2024-05-28', 'Mistaken data deletion.', 7, 'Open'),
    (218, 'System Maintenance', 'Low', '2024-06-30', 'Routine system maintenance.', 8, 'Closed'),
    (219, 'Power Outage', 'High', '2024-07-31', 'Prolonged office power outage.', 9, 'Open'),
    (220, 'Software Upgrade', 'Medium', '2024-08-05', 'Minor software update.', 10, 'Open');


-- Inserting data into Reporting table

INSERT INTO dbo.Reporting (ReportID, IncidentID, EmpID, ReportContent)
VALUES
    (301, 201, 004, 'Reported security breach in the system.'),
    (302, 202, 007, 'Investigated and resolved data loss issue.'),
    (303, 203, 002, 'Investigating hardware failure in the data center.'),
    (304, 204, 008, 'Critical data loss resolution ongoing.'),
    (305, 205, 005, 'Troubleshooting network outage in main office.'),
    (306, 206, 010, 'Addressing application performance issue.'),
    (307, 207, 003, 'Assisting with user error, data deletion.'),
    (308, 208, 009, 'Scheduled system maintenance in progress.'),
    (309, 209, 006, 'Handling office power outage issue.'),
    (310, 210, 001, 'Software upgrade in progress.'),
    (311, 211, 004, 'Bug investigation and resolution.'),
    (312, 212, 007, 'Addressing minor security issue.'),
    (313, 213, 002, 'Critical hardware failure resolution.'),
    (314, 214, 008, 'Dealing with partial data loss.'),
    (315, 215, 005, 'Resolving temporary network disruption.'),
    (316, 216, 010, 'Critical performance issue resolution.'),
    (317, 217, 003, 'Mitigating mistaken data deletion.'),
    (318, 218, 009, 'Routine system maintenance ongoing.'),
    (319, 219, 006, 'Prolonged office power outage resolution.'),
    (320, 220, 001, 'Handling minor software update.');


-- Inserting data into Alerts table
INSERT INTO dbo.Alerts (AlertID, AssetID, IncidentID, AlertType, DateCreated, Description)
VALUES
    (401, 101, 201, 'Critical', '2023-01-05', 'Laptop encountered critical bug.'),
    (402, 102, 202, 'Urgent', '2023-02-07', 'Printer security breach detected.'),
    (403, 103, 203, 'Warning', '2023-03-12', 'Scanner hardware failure detected.'),
    (404, 104, 204, 'Critical', '2023-04-17', 'Critical data loss in Projector system.'),
    (405, 105, 205, 'Notice', '2023-05-22', 'Tablet facing network outage issues.'),
    (406, 106, 206, 'Warning', '2023-06-27', 'Server experiencing performance issues.'),
    (407, 107, 207, 'Notice', '2023-07-31', 'Smartphone user error reported.'),
    (408, 108, 208, 'Notice', '2023-08-03', 'Monitor under system maintenance.'),
    (409, 109, 209, 'Critical', '2023-09-05', 'Desktop affected by office power outage.'),
    (410, 110, 210, 'Urgent', '2023-10-08', 'Camera software upgrade required.'),
    (411, 101, 211, 'Critical', '2023-11-10', 'Laptop encountered another critical bug.'),
    (412, 102, 212, 'Warning', '2023-12-15', 'Printer minor security issue detected.'),
    (413, 103, 213, 'Critical', '2024-01-18', 'Scanner critical hardware failure.'),
    (414, 104, 214, 'Notice', '2024-02-21', 'Partial data loss in Projector system.'),
    (415, 105, 215, 'Notice', '2024-03-25', 'Tablet facing temporary network disruption.'),
    (416, 106, 216, 'Critical', '2024-04-28', 'Critical server performance degradation.'),
    (417, 107, 217, 'Warning', '2024-05-31', 'User error reported on Smartphone.'),
    (418, 108, 218, 'Notice', '2024-07-02', 'Monitor under routine system maintenance.'),
    (419, 109, 219, 'Critical', '2024-08-03', 'Desktop affected by prolonged power outage.'),
    (420, 110, 220, 'Urgent', '2024-09-08', 'Camera minor software update required.');



-- Inserting data into Investigations table
INSERT INTO dbo.Investigations (IncidentID, POC, Investigator, Finding)
VALUES
    (201, 004, 'Security Team', 'Investigating security breach in the system.'),
    (202, 007, 'IT Team', 'Resolving data loss issue.'),
    (203, 002, 'Hardware Team', 'Investigating hardware failure in the data center.'),
    (204, 008, 'Data Management Team', 'Ongoing critical data loss resolution.'),
    (205, 005, 'Network Team', 'Troubleshooting network outage in the main office.'),
    (206, 010, 'App Support Team', 'Addressing application performance issue.'),
    (207, 003, 'User Support Team', 'Assisting with user error, data deletion.'),
    (208, 009, 'Maintenance Team', 'Handling scheduled system maintenance.'),
    (209, 006, 'Facilities Team', 'Managing office power outage issue.'),
    (210, 001, 'Software Team', 'Overseeing software upgrade.'),
    (211, 004, 'Security Team', 'Bug investigation and resolution.'),
    (212, 007, 'IT Team', 'Addressing minor security issue.'),
    (213, 002, 'Hardware Team', 'Critical hardware failure resolution.'),
    (214, 008, 'Data Management Team', 'Dealing with partial data loss.'),
    (215, 005, 'Network Team', 'Resolving temporary network disruption.'),
    (216, 010, 'App Support Team', 'Critical performance issue resolution.'),
    (217, 003, 'User Support Team', 'Mitigating mistaken data deletion.'),
    (218, 009, 'Maintenance Team', 'Handling routine system maintenance.'),
    (219, 006, 'Facilities Team', 'Resolving prolonged office power outage.'),
    (220, 001, 'Software Team', 'Handling minor software update.');



-- Inserting data into Resolutions table
-- Please note, in this small organization, there's only one administrator with employee ID 006. 
-- Therefore, only the employee with admin rights has the authority to resolve issues with the assistance of other teams. 
-- Consequently, the 'Resolved By' field will always remain as 006 in this database. 
-- As the company expands, there might be a possibility of having more than one administrator.

INSERT INTO dbo.Resolutions (ResolutionID, IncidentID, ResolvedBy, ResolutionDetails)
VALUES
    (601, 201, 006, 'Implemented security patches.'),
    (602, 202, 006, 'Restored data from backup.'),
    (603, 203, 006, 'Replaced faulty hardware component.'),
    (604, 204, 006, 'Recovered partial data loss.'),
    (605, 205, 006, 'Configured network settings to resolve outage.'),
    (606, 206, 006, 'Optimized application performance settings.'),
    (607, 207, 006, 'Provided data recovery assistance.'),
    (608, 208, 006, 'Completed scheduled system maintenance.'),
    (609, 209, 006, 'Implemented power backup solutions.'),
    (610, 210, 006, 'Completed software upgrade successfully.'),
    (611, 211, 006, 'Fixed and deployed bug patch.'),
    (612, 212, 006, 'Addressed security vulnerability.'),
    (613, 213, 006, 'Installed new hardware components.'),
    (614, 214, 006, 'Reconstructed missing data.'),
    (615, 215, 006, 'Resolved network issues.'),
    (616, 216, 006, 'Improved application performance.'),
    (617, 217, 006, 'Recovered deleted data.'),
    (618, 218, 006, 'Completed routine maintenance tasks.'),
    (619, 219, 006, 'Resolved office power issues.'),
    (620, 220, 006, 'Verified successful software update.');


-- Display data from the Employee table
SELECT * FROM Employee;

-- Display data from the Assets table
SELECT * FROM Assets;

-- Display data from the Incident table
SELECT * FROM Incident;

-- Display data from the Reporting table
SELECT * FROM Reporting;

-- Display data from the Alerts table
SELECT * FROM Alerts;

-- Display data from the Investigations table
SELECT * FROM Investigations;

-- Display data from the Resolutions table
SELECT * FROM Resolutions;

