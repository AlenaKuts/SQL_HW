 --1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
 --1. Select all employees who have a salary in DB and their salary. 
select employee_name, monthly_salary from employees e 
join employee_salary es on e.id = es.employee_id
join salary s on es.salary_id = s.id; 
 
--2. Вывести всех работников у которых ЗП меньше 2000.
--2. Select all employees having a salary less than 2000.
select employee_name, monthly_salary from employees e 
join employee_salary es on e.id = es.employee_id
join salary s on es.salary_id = s.id
where monthly_salary < 2000; 

--3. Вывести все зарплатные позиции, но работник по ним не назначен. ЗП есть, но не понятно кто её получает.
--3. Select salary values that nobody earns.
select s.id, monthly_salary from salary s 
left join employee_salary es on es.salary_id = s.id
where es.id is null
order by s.id;

select id, monthly_salary from salary
where id not in (select salary_id from employee_salary)
order by salary.id;

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. ЗП есть, но не понятно кто её получает.
--4. Select salary values that nobody earns less than 2000.
select id, monthly_salary from salary
where id not in (select salary_id from employee_salary)
AND monthly_salary < 2000; 

--5. Найти всех работников кому не начислена ЗП.
--5. Select all employees who don't have salary
select e.id, employee_name from employees e
left join employee_salary es on e.id = es.employee_id
where es.id is null
order by e.id; 

select id, employee_name from employees
where id not in (select employee_id from employee_salary)
order by employees.id; 

--6. Вывести всех работников с названиями их должности.
--6. Select all employees and their roles
select employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id;

--7. Вывести имена и должность только Java разработчиков.
--7. Select names and roles of Java developers.
select e.id, employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
where role_name like '% Java %';

--8. Вывести имена и должность только Python разработчиков.
--8. Select names and roles of Python developers.
select employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
where role_name like '%Python%';

--9. Вывести имена и должность всех QA инженеров.
--9. Select names and roles of QA engineers.
select employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
where role_name like '%QA%';

--10. Вывести имена и должность ручных QA инженеров.
--10. Select names and roles of manual QA engineers.
select employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
where role_name like '%Manual QA%'
order by role_name;

--11. Вывести имена и должность автоматизаторов QA
--11. Select names and roles of automation QA engineers.
select employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
where role_name like '%Automation QA%'
order by role_name;

--12. Вывести имена и зарплаты Junior специалистов
--12. Select names and salary of Junior specialists.
select employee_name, monthly_salary from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where role_name like '%Junior%';

--13. Вывести имена и зарплаты Middle специалистов
--13. Select names and salary of Middle specialists.
select employee_name, monthly_salary from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where role_name like '%Middle%';

--14. Вывести имена и зарплаты Senior специалистов
--14. Select names and salary of Senior specialists.
select employee_name, monthly_salary from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where role_name like '%Senior%';

--15. Вывести зарплаты Java разработчиков
--15. Select salary of Java developers.
select monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where role_name like '% Java %'

--16. Вывести зарплаты Python разработчиков
--16. Select salary of Python developers.
select monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where role_name like '%Python%';

--17. Вывести имена и зарплаты Junior Python разработчиков
--17. Select name and salary of Junior Python developers.
select e.employee_name, monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where role_name like 'Junior Python developer';

--18. Вывести имена и зарплаты Middle JS разработчиков
--18. Select name and salary of Middle JS developers.
select e.employee_name, monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where role_name like 'Middle JavaScript developer';

--19. Вывести имена и зарплаты Senior Java разработчиков
--19. Select name and salary of Senior Java developers.
select e.employee_name, monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where role_name like 'Senior Java developer';

--20. Вывести зарплаты Junior QA инженеров
--20. Select salary of Junior QA engineer.
select monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where role_name like '%Junior % QA%';

--21. Вывести среднюю зарплату всех Junior специалистов
--21. Select the average salary of all Junior specialists.
select round(AVG(monthly_salary), 2) from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where role_name like '%Junior%';

--22. Вывести сумму зарплат JS разработчиков.
--22. Select the sum of the salary of all JS developers.
select sum(monthly_salary) from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where role_name like '%JavaScript%';

--23. Вывести минимальную ЗП QA инженеров
--23. Select min salary of QA engineers.
select min(monthly_salary) from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where role_name like '%QA%';

--24. Вывести максимальную ЗП QA инженеров
--24. Select max salary of QA engineers.
select max(monthly_salary) from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where role_name like '%QA%';

--25. Вывести количество QA инженеров
--25. Select the number of QA engineers.
select count(*) from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where role_name like '%QA%';

--26. Вывести количество Middle специалистов.
--26. Select the number of Middle specialists.
select count(*) from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where role_name like 'Middle%';

--27. Вывести количество разработчиков
--27. Select the number of developers.
select count(*) from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where role_name like '%developer%';

--28. Вывести фонд (сумму) зарплаты разработчиков.
--28. Select sum of the salary of all developers.
select sum(monthly_salary) from salary s
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where role_name like '%developer%';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
--29. Select names, roles and salaries of all specialists sorted in ascending 
select employee_name, role_name, monthly_salary from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id
order by monthly_salary;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
--30. Select names, roles and salaries of all specialists sorted in ascending if the salary has a value from 1700 to 2300. 
select employee_name, role_name, monthly_salary from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id
where monthly_salary between 1700 and 2300
order by monthly_salary;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
--31. Select names, roles and salaries of all specialists sorted in ascending if the salary has a value less than 2300
select employee_name, role_name, monthly_salary from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id
where monthly_salary < 2300
order by monthly_salary;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
--32. Select names, roles and salaries of all specialists sorted in ascending if the salary has a value 1100, 1500, 2000 
select employee_name, role_name, monthly_salary from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary;