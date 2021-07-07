SELECT w.id, wp.age, w.coins_needed, w.power
FROM wands w
    JOIN wands_property wp USING (code)
WHERE wp.is_evil = 0 AND w.coins_needed = (
                                        -- Used to determine the cheapest wand 
                                        -- EX: if there is 10 different wands all with  
                                        -- an age of 10 and power of 10 there
                                        -- will still only be 1 wand that is the cheapest
                                        SELECT MIN(w1.coins_needed)
                                        FROM wands w1
                                            JOIN wands_property w2 USING (code)
                                        WHERE w.power = w1.power AND wp.age = w2.age) 
ORDER BY w.power DESC, wp.age DESC