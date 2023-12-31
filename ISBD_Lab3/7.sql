/*
Вывести список студентов, имеющих одинаковые фамилии, но не совпадающие ид..
 */
SELECT ЛЮДИ.ИМЯ, ЛЮДИ.ФАМИЛИЯ
FROM Н_ЛЮДИ AS ЛЮДИ
WHERE EXISTS (SELECT 1
              FROM Н_УЧЕНИКИ
                       JOIN Н_ЛЮДИ ON Н_ЛЮДИ.ИД = Н_УЧЕНИКИ.ЧЛВК_ИД
              WHERE Н_ЛЮДИ.ФАМИЛИЯ = ЛЮДИ.ФАМИЛИЯ
                AND Н_ЛЮДИ.ИД != ЛЮДИ.ИД)
ORDER BY ЛЮДИ.ФАМИЛИЯ;
