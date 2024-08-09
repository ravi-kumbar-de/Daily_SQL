-- SQL QUESTIONS ---


##find duplicate emails in a table

SELECT EMAIL, COUNT(*) FROM TABLE_NAME
GROUP BY EMAIL
HAVING COUNT(*) > 1