SELECT * FROM GAMES_DETAILS;
SELECT distinct
    PLAYER_NAME, PTS
FROM
    GAMES_DETAILS
ORDER BY PTS DESC
LIMIT 10;
