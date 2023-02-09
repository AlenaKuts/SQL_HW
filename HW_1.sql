create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

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

create table salary (
	id serial primary key,
	monthly_salary int not null
);

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

create table employee_salary (
	id serial  primary key,
	employee_id int not null unique,
	salary_id int not null
);

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

create table roles (
	id serial primary key,
	role_name int not null unique
);

alter table roles
alter column role_name type varchar(50);

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

create table roles_employee (
	id serial  primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id) 
		references employees(id),
	foreign key (role_id)	
		references roles(id)
);

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
 

select employees.id, employee_name, role_name, monthly_salary  from employees
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id; 


drop table employee_salary;
drop table roles_employee;



