-- Вывести имена родителей по имени человека
SELECT name
FROM person
         INNER JOIN parents
                    ON person.person_id = parents.parent_id and parents.child_name = 'Sergey Petrov';

-- Вывести события, которые произошли в определенном городе
SELECT el.city_name, el.obj_name, event_id, person_id
FROM city
         INNER JOIN event_location el on city.city_name = el.city_name and city.obj_name = el.obj_name;

-- Вывести описания всех событий, которые произошли в конкретном городе
SELECT description, city_name
FROM event
         INNER JOIN event_location el on event.event_id = el.event_id and el.city_name=el.city_name;