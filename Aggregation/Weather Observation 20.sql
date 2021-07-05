-- Pre: This method only works when there is an odd number of value 

-- Description: The median of a set of data is the number that is in the 50th percentile when sorted. 
--              This means that the list of data can be slit into a top and half part. The top half is greater 
--              than the 50th percentile and the bottom half is less than the 50th percentile. However, 
--              because we have an odd number of values this means that the 50th percentile (the median) will
--              occure in both the top and bottom half. Thus if we find the value that occurs in both the top and 
--              bottom half then we will have found the median. 

-- First station is used to dsipaly the median
SELECT ROUND(lat_n,4) 
FROM station s
WHERE (
    -- splitting into an equal to obtain the value that occurs in both the top and bottom half 
    (SELECT COUNT(s.id/2)                   -- Split in two to only read half of the list 
    FROM station s1
    WHERE s1.lat_n < s.lat_n)               -- Iterating through the bottom half 
    = 
    (SELECT COUNT(s.id/2)                   -- Split in two to only read half of the list 
    FROM station s2
    WHERE s2.lat_n > s.lat_n))              -- Iterating through the top half