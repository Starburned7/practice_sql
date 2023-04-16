CREATE TABLE check_constraint_example (
    user_id bigserial,
    user_role varchar(50),
    salary integer,
    CONSTRAINT user_id_key PRIMARY KEY (user_id),
    CONSTRAINT check_role_in_list CHECK (user_role IN('Admin', 'Staff')),
    CONSTRAINT check_salary_not_zero CHECK (salary > 0) );


    CONSTRAINT grad_check CHECK (credits >= 120 AND tuition = 'Paid')
    CONSTRAINT sale_check CHECK (sale_price < retail_price)