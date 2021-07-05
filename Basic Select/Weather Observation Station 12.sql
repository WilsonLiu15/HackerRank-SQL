SELECT DISTINCT city 
FROM station 
-- or symbol used because not or means and
WHERE city NOT REGEXP ('^[aeiou]|[aeiou]$')