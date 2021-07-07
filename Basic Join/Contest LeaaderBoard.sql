SELECT h.hacker_id, h.name, SUM(m.score) AS total_score
FROM hackers h 
-- we don't want to join all the submissions, just the greatest values
JOIN (
        SELECT s.hacker_id, MAX(score) AS score
        FROM submissions s 
        GROUP BY s.challenge_id, s.hacker_id
    ) m 
    USING (hacker_id)
GROUP BY h.hacker_id, h.name
    HAVING total_score > 0 
ORDER BY total_score DESC, h.hacker_id ASC