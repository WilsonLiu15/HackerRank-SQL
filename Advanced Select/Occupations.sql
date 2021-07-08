-- Pre: This solution makes use of SQL variables 

-- r stands for row and the second letter stands for the profession 
-- Variables are used to keep track of where each occupation name occurs 
-- amongst the numerous rows 
/* EX: for professor
      d | p  |  s  |  a
    -------------------
1    NULL name NULL NULL
2    NULL name NULL NULL
     name NULL NULL NULL 
3    NULL name NULL NULL
*/
SET @rd = 0, @rp = 0, @rs = 0, @ra = 0;

--  When we a reading data it will either be a name or the NULL value 
-- In order to obtain the name values we can use the functions MIN or MAX 
-- MAX will read the names from the bottom of the table to the top, while 
-- MIN reads from the top to the bottom
SELECT MIN(doctor), MIN(professor), MIN(singer), MIN(actor)
-- When we obtain data we want to get which row of output the data belongs to (purpose of first case)
-- Then we want to pair it up with a name for each occupation in that row (purpose of last 4 cases)
FROM (
    SELECT 
           -- assigns the correct output row value for each row in the table
           CASE 
               WHEN occupation = 'Doctor' THEN @rd := @rd+1
               WHEN occupation = 'Professor' THEN @rp := @rp+1
               WHEN occupation = 'Singer' THEN @rs := @rs+1
               WHEN occupation = 'Actor' THEN @ra := @ra+1
           END AS rowNumber, 
           -- The next four cases allow for the persons name to be 
           -- inserted into the list based on occupation, but if the 
           -- statment isn't true then it automatically creates 
           -- a default NULL place holder
           CASE WHEN occupation = 'Doctor' THEN name END AS doctor, 
           CASE WHEN occupation = 'Professor' THEN name END AS professor, 
           CASE WHEN occupation = 'Singer' THEN name END AS singer, 
           CASE WHEN occupation = 'Actor' THEN name END AS actor
    FROM occupations
    ORDER BY name
) AS temp   -- alias is needed to adhear to SQL syntax, otherwise I woudln't include 
-- When we output data we will output the first row, then second, etc
GROUP BY rowNumber