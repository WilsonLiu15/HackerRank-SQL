SELECT n, 
    CASE 
        WHEN p IS NULL THEN 'Root'
        WHEN N IN (SELECT P FROM bst) THEN 'Inner'
        ELSE 'Leaf'
    END 
FROM bst 
ORDER BY n