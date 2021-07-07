SELECT IF(grade < 8, NULL, name), grade, marks
FROM students JOIN grades
WHERE marks BETWEEN min_mark AND max_mark
ORDER BY grade DESC, name ASC, marks ASC 