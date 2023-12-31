/*
 Выведите таблицу со средними оценками студентов группы 4100 (Номер, ФИО, Ср_оценка),
 у которых средняя оценка не больше максимальной оценк(е|и) в группе 1101.
 */

SELECT "ЧЛВК_ИД", "ФАМИЛИЯ", "ИМЯ", "ОТЧЕСТВО", AVG("ОЦЕНКА"::int) as "Ср_оценка"
FROM "Н_ВЕДОМОСТИ"
    JOIN "Н_УЧЕНИКИ" USING ("ЧЛВК_ИД")
    JOIN "Н_ЛЮДИ" ON "Н_ЛЮДИ"."ИД" = "Н_ВЕДОМОСТИ"."ЧЛВК_ИД"
WHERE "ГРУППА" = '4100' AND "ОЦЕНКА" ~ '^[0-9]$'
GROUP BY "ЧЛВК_ИД", "ФАМИЛИЯ", "ИМЯ", "ОТЧЕСТВО"
HAVING AVG("ОЦЕНКА"::int) < (
    SELECT MAX("ОЦЕНКА"::int) FROM "Н_ВЕДОМОСТИ"
    JOIN "Н_УЧЕНИКИ" USING ("ЧЛВК_ИД")
    WHERE "ГРУППА" = '1100' AND "ОЦЕНКА" ~ '^[0-9]$'
);