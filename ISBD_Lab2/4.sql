SELECT sub.ГРУППА
FROM (SELECT * FROM Н_УЧЕНИКИ WHERE extract(year from НАЧАЛО) = 2011) sub
GROUP BY sub.ГРУППА
HAVING COUNT(*) < 5;