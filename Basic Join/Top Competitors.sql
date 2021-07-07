SELECT hackers.hacker_id, hackers.name
FROM hackers 
    JOIN submissions 
        ON hackers.hacker_id = submissions.hacker_id
    JOIN challenges 
        ON submissions.challenge_id = challenges.challenge_id
    JOIN difficulty
        ON challenges.difficulty_level = difficulty.difficulty_level
WHERE difficulty.score = submissions.score
GROUP BY hackers.hacker_id, hackers.name 
HAVING COUNT(hackers.hacker_id) > 1 
ORDER BY COUNT(hackers.hacker_id) DESC, hackers.hacker_id ASC 

