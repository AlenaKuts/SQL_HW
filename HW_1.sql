/* 
1. Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null

1. Create a table employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null
*/
create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

/*
2. Наполнить таблицу employee 70 строками.
2. Add 70 rows to the table employee. 
*/
insert into employees (employee_name)
values ('Reggie Batey'), 
('Clara Poore'), 
('Tammy Galindo'), 
('Rickey Jones'), 
('Jill Anspach'), 
('Lacy Racicot'), 
('David Macias'), 
('Jessica Manns'), 
('Amber Holcomb'), 
('Betty Wells'), 
('Miguel Fletcher'), 
('Joseph Hodges'), 
('Ida Bohannon'), 
('Cindy Merrifield'), 
('Mary Dowell'), 
('Marie Thomas'), 
('Donald Fierro'), 
('Anna Wick'), 
('Robert Harian'), 
('Michael Mark'), 
('Lucius Patterson'), 
('Lorna Rose'), 
('Karen Santiago'), 
('Peggy Beachler'), 
('Chester Baird'), 
('Ronda Colley'), 
('Robert Chapman'), 
('Sandra Hibbard'), 
('Steven Pagano'), 
('Ramona Russell'), 
('Ryan Morgan'), 
('Shannon Daugherty'), 
('Charlene Little'), 
('Steve Lewandowski'), 
('Donnie Shoemaker'), 
('Veronica Treto'), 
('Jonathon Belanger'), 
('William Hughes'), 
('Courtney Alston'), 
('Isaac Walters'), 
('Leon Ashcraft'), 
('Daniel Patterson'), 
('Randall Phillips'), 
('James Williams'), 
('Nancy Searles'), 
('Edward Hilliard'), 
('Joel Vandevelde'), 
('Nancy Bravo'), 
('Jesse Clark'), 
('Gregory Magelssen'), 
('Ella Cortez'), 
('Michael Diaz'), 
('Robert Walsh'), 
('Valorie Seibert'), 
('Yoshiko Miller'), 
('Timothy Johnson'), 
('Lita Webb'), 
('Lindsay Barrera'), 
('Jacqulyn Matthews'), 
('Lee Rehart'), 
('Fred Spencer'), 
('Melinda Webster'), 
('Shawn Pretti'), 
('Betty Schaefer'), 
('Barbara Teets'), 
('Patricia Tomas'), 
('Mattie Kelley'), 
('Mary Yates'), 
('Andrea Croes'), 
('Amanda Riley');

select * from employees; 

/*
3. Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null

3. Create a table salary
- id. Serial  primary key,
- monthly_salary. Int, not null
 */
create table salary (
	id serial primary key,
	monthly_salary int not null
);

/*
4.Наполнить таблицу salary 15 строками со значениями monthly_salary от 1000 до 2500 и шагом 100.
4. Add 15 rows to the table with values of monthly_salary from 1000 to 2500 and step 100. 
*/
insert into salary (monthly_salary)
values (1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);	
)

select * from salary; 

/*
5. Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null

5. Create a table employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null
 */
create table employee_salary (
	id serial  primary key,
	employee_id int not null unique,
	salary_id int not null
);

/*
6. Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id.
6. Add 40 rows to the table employee_salary:
- 10 rows from 40 should contain unexistent employee_id. 
 */
insert into employee_salary (employee_id, salary_id)
values  (1, 16), 
		(3, 2),  
		(5, 13),
		(6, 7),
		(7, 3),
		(10, 4),
		(11, 3),
		(15, 6),
		(16, 15),
		(20, 13),
		(21, 8),
		(22, 3),
		(23, 7),
		(26, 10),
		(33, 11), 
		(34, 4),
		(38, 2),
		(39, 15),
		(40, 6),
		(41, 6),
		(43, 3), 
		(44, 9),
		(46, 14), 
		(51, 7),
		(52, 10),
		(62, 15), 
		(63, 14), 
		(65, 11), 
		(66, 9),   
		(67, 4),
		(71, 4),
		(77, 11),
		(81, 7), 
		(87, 8),
		(88, 18),   
		(90, 19),
		(96, 3),
		(99, 6),
		(101, 11),  
		(125, 2); 
	
select * from employee_salary; 


/*
7. Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique

7. Create a table roles
- id. Serial  primary key,
- role_name. int, not null, unique
*/
create table roles (
	id serial primary key,
	role_name int not null unique
);

/*
8. Поменять тип столба role_name с int на varchar(30)
8. Change data type for the column role_name from int to varchar(30)
 */
alter table roles
alter column role_name type varchar(50);

/*
9. Наполнить таблицу roles 20 строками.
9. Add 20 rows to the table roles.
 */
insert into roles (role_name)
values ('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');

select * from roles;

/*
10. Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)

10. Create a table roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (foreign key for table employees, field id)
- role_id. Int, not null (foreign key for table roles, field id) 
*/
create table roles_employee (
	id serial  primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id) 
		references employees(id),
	foreign key (role_id)	
		references roles(id)
);

/*
11. Наполнить таблицу roles_employee 40 строками.
11. Add 40 rows to the table roles_employee 
 */
insert into roles_employee (employee_id, role_id)
values  (1, 16), 
		(3, 10),  
		(5, 20),
		(6, 11),
		(7, 4),
		(10, 2),
		(11, 19),
		(15, 7),
		(16, 9),
		(20, 20),
		(21, 3),
		(22, 2),
		(23, 3),
		(26, 8),
		(33, 1), 
		(34, 2),
		(38, 18),
		(39, 9),
		(40, 7),
		(41, 17),
		(43, 4), 
		(44, 14),
		(46, 6), 
		(51, 15),
		(52, 11),
		(62, 12), 
		(63, 5), 
		(65, 13), 
		(66, 8),   
		(67, 5),   
		(2, 4),
		(8, 9),
		(13, 12),
		(17, 3),
		(28, 1),
		(30, 2),
		(45, 7),
		(50, 7),
		(55, 10),
		(60, 13);


select * from roles_employee; 