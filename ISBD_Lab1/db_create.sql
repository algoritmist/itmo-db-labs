CREATE TABLE "event"
(
    "event_id"    int primary key,
    "description" text,
    "item"        date
);


CREATE TABLE "person"
(
    "person_id" int primary key,
    "name"      varchar(20) not null,
    "birthdate"       date not null,
    "gender"    char(1) CHECK ("gender" = 'M' or "gender" = 'F')
);


CREATE TABLE "parents"
(
    "parent_id"  int references "person" ("person_id"),
    "child_id" int references "person" ("person_id"),
    PRIMARY KEY ("parent_id", "child_id")
);


CREATE TABLE "object"
(
    "obj_name" varchar(20) primary key,
    "obj_type" varchar(6) CHECK ("obj_type" = 'star' or "obj_type" = 'planet'),
    "diameter" int CHECK ("diameter" > 0)
);


CREATE TABLE "city"
(
    "obj_name"  varchar(20) references "object" ("obj_name"),
    "city_name" varchar(20),
    PRIMARY KEY ("city_name", "obj_name")
);
CREATE TABLE "event_info"
(
    "event_id"  int references "event" ("event_id"),
    "person_id" int references "person" ("person_id"),
    "obj_name"  varchar(20),
    "city_name" varchar(20),
    PRIMARY KEY ("event_id", "person_id"),
    FOREIGN KEY ("obj_name", "city_name") references "city" ("obj_name", "city_name")
);