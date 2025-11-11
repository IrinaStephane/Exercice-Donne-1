-- 1 : Afficher l'id, first_name, last_name des employés qui n'ont pas d'équipe
SELECT id, first_name, last_name
FROM employees 
WHERE team_id IS NULL;

-- 2 : Afficher l'id, first_name, last_name des employés qui n'ont jamais pris de congé
SELECT e.id, e.first_name, e.last_name
FROM employee e
LEFT JOIN leave l ON e.id = l.employee_id
WHERE l.id IS NULL;

-- 3 : Afficher tous les congés avec détails des employés et leurs équipes
SELECT 
    l.id AS leave_id,
    l.start_date,
    l.end_date,
    e.first_name,
    e.last_name,
    t.name AS team_name
FROM leave l
INNER JOIN employee e ON l.employee_id = e.id
LEFT JOIN team t ON e.team_id = t.id;

-- 4 : Afficher le nombre d'employés par type de contrat
SELECT 
    contract_type,
    COUNT(*) AS number_of_employees
FROM employees
GROUP BY contract_type;

-- 5 : Afficher le nombre d'employés en congé aujourd'hui
SELECT 
    COUNT(*) AS number_of_employees_on_leave_today
FROM leaves
WHERE CURRENT_DATE BETWEEN start_date AND end_date;

-- 6 : Afficher les employés en congé aujourd'hui avec leur équipe
SELECT 
    e.id,
    e.first_name,
    e.last_name,
    t.name AS team_name
FROM employee e
JOIN leave l ON e.id = l.employee_id
LEFT JOIN team t ON e.team_id = t.id
WHERE CURRENT_DATE BETWEEN l.start_date AND l.end_date;