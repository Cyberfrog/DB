select id,name,dept_id from employee;
select e.id,e.name,d.dept_name from employee e, department d where e.dept_id=d.id;
select e.id,e.name,d.dept_name from employee e join department d on (e.dept_id=d.id);

select * from employee e, department d where e.dept_id=d.id;

select e.id ,e.name ,d.id,d.DEPt_name from employee e, department d ;
-- male salry avg from salse

select SUM(e.salary) from employee e join department d on(e.dept_id =d.id) where d.dept_name ='SALES' AND e.gender ='F';
--female salry sum from MARKETING;

select AVG(e.salary) from employee e join department d on(e.dept_id =d.id) where d.dept_name ='MARKETING' AND e.gender ='M';
--department with no employement

select AVG(e.salary) from employee e join department d on(e.dept_id =d.id) where d.dept_name ='MARKETING' OR d.dept_name ='SALES';


