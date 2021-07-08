-- Create a list of every number from one to 1000, excluding 1, recursivly
WITH RECURSIVE numberList(nums)
AS (
    SELECT 2            -- initate the first number in the table
    UNION ALL           -- connect it with the recursive statment 
    SELECT nums+1       -- select the next number, incrementing by 1 
    FROM tblnums        -- call function itself to repeat itself but replacing the SELECT n with SELECT n+1   
    WHERE nums<1000)    -- conditon of when to stop recursion
    
SELECT group_concat(nL.nums separator '&')  -- concatenate the numbers from list and seperate them by an & symbol
FROM tblnums nL1
WHERE NOT EXISTS (                          -- Not choosing the values where more than 2 divisors (1 and itself) exist 
    SELECT 1                                -- Start at 1 and iterate up creating a new table of values...
    FROM numerList nL2                     
    WHERE nL2.nums <= nL1.nums/2            -- Only iterate up to half the values
        AND MOD(nL1.nums,nL2.nums)=0)       -- ...only adding values that the current number can be divided by
                                            -- if it is prime  then there will be a list of no numbers