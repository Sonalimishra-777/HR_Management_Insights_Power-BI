--Department wise attrition
SELECT 
    Department,
    COUNT(*) AS AttritionCount,ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) 
            FROM HR_EmployeeAttrition 
            WHERE Attrition = 1), 2) AS AttritionPercent
FROM HR_EmployeeAttrition
WHERE Attrition = 1
GROUP BY Department
ORDER BY AttritionPercent ASC;


--Education field wise attrition
SELECT 
    EducationField,
   
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionCount
FROM HR_EmployeeAttrition
GROUP BY EducationField
ORDER BY AttritionCount DESC;

--number of employee by age group
SELECT 
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+' 
    END AS AgeGroup,
    COUNT(*) AS EmployeeCount
FROM HR_EmployeeAttrition
GROUP BY 
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'     END
ORDER BY AgeGroup;

--Attrition rate by gender for different age
SELECT 
    Gender,
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+' 
    END AS AgeGroup,
    
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionCount
    
FROM HR_EmployeeAttrition
GROUP BY 
    Gender,
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+' 
    END
ORDER BY AgeGroup, Gender;

--relationship between employee age and job statisfiction
SELECT 
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS AgeGroup,
    SUM(JobSatisfaction) AS TotalJobSatisfaction,
    COUNT(*) AS EmployeeCount
FROM HR_EmployeeAttrition
GROUP BY 
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END
ORDER BY AgeGroup;

--The Job Satisfaction Rating
SELECT 
    JobRole,
    SUM(CASE WHEN JobSatisfaction = 1 THEN 1 ELSE 0 END) AS Rating_1,
    SUM(CASE WHEN JobSatisfaction = 2 THEN 1 ELSE 0 END) AS Rating_2,
    SUM(CASE WHEN JobSatisfaction = 3 THEN 1 ELSE 0 END) AS Rating_3,
    SUM(CASE WHEN JobSatisfaction = 4 THEN 1 ELSE 0 END) AS Rating_4,
    COUNT(*) AS TotalEmployees
FROM HR_EmployeeAttrition
GROUP BY JobRole
ORDER BY TotalEmployees ASC;
