CREATE TABLE check_constraint_example (
    user_id bigserial,
    user_role varchar(50),
    salary integer,
    CONSTRAINT user_id_key PRIMARY KEY (user_id),
    CONSTRAINT check_role_in_list CHECK (user_role IN('Admin', 'Staff')),
    CONSTRAINT check_salary_not_zero CHECK (salary > 0) );


    CONSTRAINT grad_check CHECK (credits >= 120 AND tuition = 'Paid')
    CONSTRAINT sale_check CHECK (sale_price < retail_price)


CREATE TABLE new_york_addresses (
    longitude numeric(9,6),
    latitude numeric(9,6),
    street_number varchar(10),
    street varchar(32),
    unit varchar(7),
    postcode varchar(5),
    id integer CONSTRAINT new_york_key PRIMARY KEY
);
COPY new_york_addresses
FROM 'C:\YourDirectory\city_of_new_york.csv' WITH (FORMAT CSV, HEADER);



EXPLAIN ANALYZE SELECT * FROM new_york_addresses
WHERE street = '52 STREET';


EXPLAIN ANALYZE SELECT * FROM new_york_addresses
WHERE street = 'ZWICKY AVENUE';

EXPLAIN ANALYZE SELECT id FROM new_york_addresses
WHERE id = 250;

CREATE INDEX street_idx ON new_york_addresses (street);