SELECT h.hacker_id, h.name, COUNT(c.challenge_id) AS total
FROM hackers h JOIN challenges c    
    USING (hacker_id) 
-- Need to include h.name in order to not throw an error 
-- MYSQL can't tell that hacker_id values are unqiue
-- Adding in name makes if assume a unique value
GROUP BY h.hacker_id, h.name
    -- Split into 2 cases 
    HAVING total = (
        -- Case 1: the student who completed the most challenges is the only 
        --         student that compelted any challenges
        SELECT COUNT(c1.challenge_id) AS tot1
        FROM hackers h1 JOIN challenges c1
        USING (hacker_id) 
        GROUP BY c1.hacker_id 
        ORDER BY tot1 DESC
        LIMIT 1 
    )
    OR 
    total NOT IN (
        -- CASE 2: Check to see if there is a second student with the same number 
        --         of challenges completed 
        SELECT COUNT(c2.challenge_id) AS tot2
        FROM hackers h2 JOIN challenges c2
        USING (hacker_id)
        GROUP BY c2.hacker_id
            -- Exclude the hacker that is on top, otherwise it will always be false
            HAVING (    
                c2.hacker_id  != h.hacker_id
            )
    )
ORDER BY total DESC, h.hacker_id 