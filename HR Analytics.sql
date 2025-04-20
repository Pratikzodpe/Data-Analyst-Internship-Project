CREATE DATABASE HR_Analytics;
USE HR_Analytics;

# Q1) Average Attrition rate for all Departments

SELECT Department, AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Avg_Attrition_Rate
FROM hr_1
GROUP BY Department;

/*----------------------------------------------------------------------------------------------------------------------------------*/

# Q2) Average Hourly rate of Male Research Scientist

SELECT AVG(HourlyRate) AS Average_Hourly_Rate
FROM hr_1
WHERE Gender = 'Male' AND JobRole = 'Research Scientist';

/*--------------------------------------------------------------------------------------------------------------------------------*/

# Q3) Attrition rate Vs Monthly income stats

SELECT
  CASE
    WHEN MonthlyIncome <= 10000 THEN '0-10000'
    WHEN MonthlyIncome <= 20000 THEN '10001-20000'
    WHEN MonthlyIncome <= 30000 THEN '20001-30000'
    ELSE '30000+'
  END AS IncomeGroup,
  AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionRate
FROM
  hr_1
JOIN
  hr_2 ON hr_1.EmployeeNumber = hr_2.EmployeeID
GROUP BY
  IncomeGroup;
  
/*---------------------------------------------------------------------------------------------------------------------------------*/

# Q4) Average working years for each Department

SELECT Department,
AVG(TotalWorkingYears) AS AverageWorkingYears
FROM hr_1
JOIN hr_2 ON hr_1.EmployeeNumber = hr_2.EmployeeID
GROUP BY Department;

/*---------------------------------------------------------------------------------------------------------------------------------*/

# Q5) Job Role Vs Work life balance

SELECT JobRole, AVG(hr_2.WorkLifeBalance) AS Avg_WorkLifeBalance
FROM hr_1
JOIN hr_2 
ON hr_1.EmployeeNumber = hr_2.EmployeeID
GROUP BY JobRole;
  
/*---------------------------------------------------------------------------------------------------------------------------------*/

# Q6) Attrition rate Vs Year since last promotion relation

SELECT YearsSinceLastPromotion, 
AVG(CASE WHEN hr_1.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 AS AttritionRate
FROM hr_1 
JOIN hr_2 
ON hr_1.EmployeeNumber = hr_2.EmployeeID
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;