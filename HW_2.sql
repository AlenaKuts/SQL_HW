 --1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary from employees e 
join employee_salary es on e.id = es.employee_id
join salary s on es.salary_id = s.id; 
 
 --2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary from employees e 
join employee_salary es on e.id = es.employee_id
join salary s on es.salary_id = s.id
where monthly_salary < 2000; 

 --3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select s.id, monthly_salary from salary s 
left join employee_salary es on es.salary_id = s.id
where es.id is null
order by s.id;

select id, monthly_salary from salary
where id not in (select salary_id from employee_salary)
order by salary.id;

 --4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select id, monthly_salary from salary
where id not in (select salary_id from employee_salary)
AND monthly_salary < 2000; 

 --5. Найти всех работников кому не начислена ЗП.
select e.id, employee_name from employees e
left join employee_salary es on e.id = es.employee_id
where es.id is null
order by e.id; 

select id, employee_name from employees
where id not in (select employee_id from employee_salary)
order by employees.id; 

 --6. Вывести всех работников с названиями их должности.
select employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id;

 --7. Вывести имена и должность только Java разработчиков.
select e.id, employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
where role_name like '% Java %'
order by role_name;

 --8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
where role_name like '%Python%'
order by role_name;

 --9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
where role_name like '%QA%'
order by role_name;

 --10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
where role_name like '%Manual QA%'
order by role_name;

 --11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
where role_name like '%Automation QA%'
order by role_name;

 --12. Вывести имена и зарплаты Junior специалистов
select employee_name, monthly_salary from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where role_name like '%Junior%';

 --13. Вывести имена и зарплаты Middle специалистов
select employee_name, monthly_salary from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where role_name like '%Middle%';

 --14. Вывести имена и зарплаты Senior специалистов
select employee_name, monthly_salary from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where role_name like '%Senior%';

 --15. Вывести зарплаты Java разработчиков
select monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where role_name like '% Java %'

 --16. Вывести зарплаты Python разработчиков
select monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where role_name like '%Python%';

 --17. Вывести имена и зарплаты Junior Python разработчиков
select e.employee_name, monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where role_name like 'Junior Python developer';

 --18. Вывести имена и зарплаты Middle JS разработчиков
select e.employee_name, monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where role_name like 'Middle JavaScript developer';

 --19. Вывести имена и зарплаты Senior Java разработчиков
select e.employee_name, monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where role_name like 'Senior Java developer';

 --20. Вывести зарплаты Junior QA инженеров
select monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where role_name like '%Junior % QA%';

 --21. Вывести среднюю зарплату всех Junior специалистов
select round(AVG(monthly_salary), 2) from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where role_name like '%Junior%';

 --22. Вывести сумму зарплат JS разработчиков
select sum(monthly_salary) from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where role_name like '%JavaScript%';

 --23. Вывести минимальную ЗП QA инженеров
select min(monthly_salary) from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where role_name like '%QA%';

 --24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary) from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on es.employee_id = e.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where role_name like '%QA%';

 --25. Вывести количество QA инженеров
select count(*) from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where role_name like '%QA%';

 --26. Вывести количество Middle специалистов.
select count(*) from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where role_name like 'Middle%';

 --27. Вывести количество разработчиков
 --28. Вывести фонд (сумму) зарплаты разработчиков.

 --29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id
order by monthly_salary;

 --30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id
where monthly_salary between 1700 and 2300
order by monthly_salary;

 --31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id
where monthly_salary < 2300
order by monthly_salary;

 --32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary from employees e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id = r.id
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary;


select employees.id e_id, salary.id s_id, employee_name, monthly_salary, role_name from employees 
full join roles_employee on employees.id = roles_employee.employee_id
full join roles on roles_employee.role_id = roles.id
full join employee_salary on employees.id = employee_salary.employee_id 
full join salary on employee_salary.salary_id = salary.id 
order by employees.id, salary.id;