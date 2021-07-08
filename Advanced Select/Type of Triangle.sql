SELECT 
    CASE
        WHEN A+B >= C AND A+C >= B AND C+B >= A THEN
            CASE 
                WHEN A = B AND B = C THEN 'Equilateral'
                WHEN A = B OR A = C or C = B THEN 'Isosceles'
                ELSE 'Scalene'
            END 
        ELSE 'Not A Triangle' 
    END 
FROM triangles