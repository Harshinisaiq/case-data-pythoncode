-- Create tables
CREATE TABLE EmployeeData (
    Name VARCHAR(100),
    Role VARCHAR(100),
    Location VARCHAR(100),
    Years_of_Experience VARCHAR(10),
    Active CHAR(1),
    Current_Comp_INR DECIMAL(15,2),
    Last_Working_Day DATE
);

CREATE TABLE IndustryCompensation (
    Location VARCHAR(100),
    Role VARCHAR(100),
    Average_Industry_Compensation DECIMAL(15,2)
);

CREATE TABLE EmployeeRating (
    Name VARCHAR(100),
    Role VARCHAR(100),
    Location VARCHAR(100),
    Years_of_Experience VARCHAR(10),
    Self_Rating INT,
    Manager_Rating INT
);

-- Example aggregation: average compensation by Role and Location
SELECT Role, Location, AVG(Current_Comp_INR) AS Avg_Compensation
FROM EmployeeData
GROUP BY Role, Location
ORDER BY Avg_Compensation DESC;

-- Join EmployeeData with IndustryCompensation
SELECT e.Name, e.Role, e.Location, e.Current_Comp_INR, i.Average_Industry_Compensation
FROM EmployeeData e
LEFT JOIN IndustryCompensation i
ON e.Role = i.Role AND e.Location = i.Location;

-- Filter active employees
SELECT *
FROM EmployeeData
WHERE UPPER(Active) = 'Y';
