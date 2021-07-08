SELECT
    c.company_code, 
    c.founder, 
    COUNT(DISTINCT lm.lead_manager_code),
    COUNT(DISTINCT sm.senior_manager_code),
    COUNT(DISTINCT m.manager_code),
    COUNT(DISTINCT e.employee_code)
FROM 
    company c,
    lead_manager lm,
    senior_manager sm,
    manager m,
    employee e
WHERE 
    c.company_code = lm.company_code AND 
    lm.company_code = sm.company_code AND 
    sm.company_code = m.company_code AND 
    m.company_code = e.company_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code