-- Вывести имена родителей по имени человека
SELECT n1 as parent_name, name as child_name
FROM person inner join (SELECT child_id, name as n1
                        FROM parents
                                 INNER JOIN person p on p.person_id = parents.parent_id) as t1 ON t1.child_id = person.person_id;

-- Вывести события, которые произошли в определенном городе
SELECT el.city_name, el.obj_name, event_id, person_id
FROM city
         INNER JOIN event_location el on city.city_name = el.city_name and city.obj_name = el.obj_name;

-- Вывести описания всех событий, которые произошли в конкретном городе
SELECT description, city_name
FROM event
         INNER JOIN event_location el on event.event_id = el.event_id and el.city_name=el.city_name;