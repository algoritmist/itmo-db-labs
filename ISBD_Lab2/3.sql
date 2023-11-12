SELECT COUNT(Н_ЛЮДИ.ИНН IS NULL)
FROM (SELECT Н_УЧЕНИКИ.ЧЛВК_ИД
      from Н_ПЛАНЫ
               INNER JOIN Н_УЧЕНИКИ ON Н_ПЛАНЫ.ИД = Н_УЧЕНИКИ.ПЛАН_ИД
               INNER JOIN Н_ОТДЕЛЫ ON Н_ПЛАНЫ.ОТД_ИД = Н_ОТДЕЛЫ.ИД WHERE Н_ОТДЕЛЫ.КОРОТКОЕ_ИМЯ='КТиУ') AS sub
         INNER JOIN Н_ЛЮДИ ON sub.ЧЛВК_ИД = Н_ЛЮДИ.ИД;