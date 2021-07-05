SELECT DISTINCT city 
FROM station 
-- .* is used in the REGEXp because not .* means or
WHERE city NOT REGEXP ('^[aeiou].*[aeiou]$')