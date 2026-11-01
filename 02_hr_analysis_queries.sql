HR Analytics Case Study: Advanced Analytical Queries


-- 1. DEPARTAMENT ÜZRƏ İŞÇİ SAYI VƏ ORTA ƏMƏKHAQQI
SELECT 
    d.Department_Name,
    COUNT(e.Employee_ID) AS Total_Employees,
    ROUND(AVG(e.Salary), 2) AS Avg_Salary,
    MIN(e.Salary) AS Min_Salary,
    MAX(e.Salary) AS Max_Salary
FROM Departments d
LEFT JOIN Employees e ON d.Department_ID = e.Department_ID
WHERE e.Termination_Date IS NULL OR e.Termination_Date > CURRENT_DATE
GROUP BY d.Department_Name
ORDER BY Avg_Salary DESC;

-- 2. ƏMƏKHAQQI ARTIM DİNAMİKASI VƏ FAİZİ (WINDOW FUNCTION)
SELECT 
    sh.Employee_ID,
    e.Full_Name,
    sh.Salary,
    sh.Effective_Date,
    LAG(sh.Salary) OVER (PARTITION BY sh.Employee_ID ORDER BY sh.Effective_Date) AS Previous_Salary,
    ROUND(
        ((sh.Salary - LAG(sh.Salary) OVER (PARTITION BY sh.Employee_ID ORDER BY sh.Effective_Date)) 
        / LAG(sh.Salary) OVER (PARTITION BY sh.Employee_ID ORDER BY sh.Effective_Date)) * 100, 2
    ) AS Increase_Percentage
FROM Salary_History sh
JOIN Employees e ON sh.Employee_ID = e.Employee_ID
ORDER BY sh.Employee_ID, sh.Effective_Date;

-- 3. DAVAMIYYƏT VƏ GECİKMƏ TƏHLİLİ
SELECT 
    e.Employee_ID,
    e.Full_Name,
    COUNT(CASE WHEN a.Status = 'Late' THEN 1 END) AS Late_Count,
    COUNT(CASE WHEN a.Status = 'Absent' THEN 1 END) AS Absent_Count,
    COUNT(a.Attendance_ID) AS Total_Records
FROM Employees e
LEFT JOIN Attendance a ON e.Employee_ID = a.Employee_ID
GROUP BY e.Employee_ID, e.Full_Name;

-- 4. MƏLUMAT KEYFİYYƏTİ VƏ ANOMALİYALARIN AŞKARLANMASI (AUDIT QUERIES)
-- 4.1 Təkrarlanan Qeydlər (Duplicate Employee ID)
SELECT 
    Employee_ID, 
    COUNT(*) AS Duplicate_Count
FROM Employees
GROUP BY Employee_ID
HAVING COUNT(*) > 1;

-- 4.2 Mövcud Olmayan Departament ID (Orphan Records)
SELECT *
FROM Employees
WHERE Department_ID NOT IN (SELECT Department_ID FROM Departments);

-- 4.3 Mənfi və ya Sıfır Maaş Yoxlanışı
SELECT *
FROM Employees
WHERE Salary <= 0;

-- 4.4 Məntiqsiz Tarix Ardıcıllığı (İşə qəbuldan əvvəl çıxış tarixi)
SELECT *
FROM Employees
WHERE Termination_Date IS NOT NULL AND Termination_Date < Hire_Date;
