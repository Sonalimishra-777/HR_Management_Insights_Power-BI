select * from HR_EmployeeAttrition

--KPI's

SELECT 
    COUNT(*) AS EmployeesCount,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionCount,
	ROUND(CAST(SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS FLOAT)
	      * 100.0 / COUNT(*), 2) AS AttritionRate,
    SUM(CASE WHEN Attrition = 0 THEN 1 ELSE 0 END) AS ActiveEmployees,
	ROUND(AVG(CAST(Age AS FLOAT)), 0) AS AvgAge
FROM HR_EmployeeAttrition;

--Attrition by Gender
SELECT 
    Gender,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionCount
FROM HR_EmployeeAttrition
GROUP BY Gender;

--Employee Monthly Income
SELECT 
    ROUND(AVG(CAST([MonthlyIncome] AS FLOAT)), 0) AS MonthlyIncome
	
FROM HR_EmployeeAttrition;

-- 2. Overtime Employee Count
SELECT 
    COUNT(*) AS WorkOvertime
FROM HR_EmployeeAttrition
WHERE OverTime = 1
GROUP BY [OverTime];


-- 3. Average Working Years by Attrition
SELECT 
    ROUND(AVG(CAST([TotalWorkingYears] AS FLOAT)), 0) AS WorkingYear
FROM HR_EmployeeAttrition
WHERE Attrition = 1
GROUP BY Attrition;