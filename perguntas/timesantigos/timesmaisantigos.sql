SELECT * FROM TEAMS;
SELECT 
    NICKNAME, YEARFOUNDED
FROM
    TEAMS
GROUP BY YEARFOUNDED
ORDER BY YEARFOUNDED ASC
LIMIT 10;