INSERT INTO employee(id,name,pan_number,gender,cell_phone,salary) VALUES (seq_emp_id.nextval,'AAAJ','ABCXX10000','M',9999900045,20000);
commit;
select e.id,e.name,d.dept_name from employee e  join department d on(e.dept_id=d.id) order by e.id;

select e.id,e.name,d.dept_name from employee e  left outer join department d on(e.dept_id=d.id) order by e.id;
select e.id,e.name,d.dept_name from employee e  right outer join department d on(e.dept_id=d.id) order by e.id;
select e.id,e.name,d.dept_name from employee e  full outer join department d on(e.dept_id=d.id) order by e.id;

select e.id,e.name,d.dept_name from employee e  join department d on(e.dept_id=d.id) where d.dept_name ='SALES' OR d.dept_name ='PRODUCTION' order by e.id;
select e.id,e.name,d.dept_name from employee e  join department d on(e.dept_id=d.id) where d.dept_name NOT IN('SALES','PRODUCTION') order by e.id;
select e.* from employee e  join department d on(e.dept_id=d.id) where d.dept_name IN('PRODUCTION') order by e.id;


-- DROP USER Reporter CASCADE;
conn / as sysdba;
Grant create view to emp_user;
conn emp_user/password;

create view Production_Employee AS select e.* from employee e  join department d on(e.dept_id=d.id) where d.dept_name IN('PRODUCTION') order by e.id;

CREATE USER Reporter IDENTIFIED BY password DEFAULT TABLESPACE ts_emp_system QUOTA UNLIMITED ON ts_emp_system;
GRANT CREATE SESSION TO Reporter;
GRANT RESOURCE TO Reporter;

conn emp_user/password; 
GRANT select on Production_Employee TO Reporter;
conn Reporter/password;
select * from emp_user.production_employee;
Grant create SYNONYM to Reporter;
CREATE SYNONYM productionEmployee FOR emp_user.production_employee;

select id,name from employee where dept_id = 2001 or dept_id =2002;
select id,name from employee where dept_id = 2001 UNION select id,name from employee where dept_id = 2002;
create view salse_Employee AS select e.* from employee e  join department d on(e.dept_id=d.id) where d.dept_name IN('SALES') order by e.id;
select * from salse_Employee UNION select * from Production_Employee;
create table emp_backup as select * from employee where 1=2;
desc emp_backup;

Alter table employee drop column mgr_id;
create table manager as select id,name from employee;

select e.id,e.name , m.name from employee e join manager m on(e.mgr_id = m.id);
select e.id,e.name , m.name from employee e join employee m on(e.mgr_id = m.id);
select e.id,e.name ,d.dept_name, m.name from employee e join employee m  on(e.mgr_id = m.id) join department d on(e.dept_id=d.id) ;
select e.id,e.name ,d.dept_name, m.name from employee e, employee m,department d  where e.mgr_id = m.id AND e.dept_id=d.id ;
select e.id,e.name ,d.dept_name, m.name from employee e left join employee m  on(e.mgr_id = m.id) left join department d on(e.dept_id=d.id) ;
select e.id,e.name ,d.dept_name, m.name from employee e join employee m  on(e.mgr_id = m.id) join department d on(e.dept_id=d.id) ;

select distinct dept_id from employee;
select d.id from department d minus select distinct e.dept_id from employee e;
select distinct gender from employee;
select Unique (gender) from employee;
select Max(e.salary) from employee e join department d on(e.dept_id =d.id) where d.dept_name ='PRODUCTION';
select d.dept_name ,Max(e.salary) AS HIGHEST_SALARY from employee e join department d on(e.dept_id =d.id) group by(d.dept_name) ;  
select e.gender ,count(e.id)from employee e group by (e.gender) ; 
select d.dept_name ,e.gender, Max(e.salary) AS HIGHEST_SALARY from employee e join department d on(e.dept_id =d.id) group by(d.dept_name,e.gender);	  
select d.dept_name ,e.gender, Max(e.salary) AS HIGHEST_SALARY from employee e join department d on(e.dept_id =d.id) group by(e.gender,d.dept_name);	  


select id,LOWER(name) from employee;
select e.id,LOWER(e.name) from employee where salary <10000;
-- select d.dept_name e.name from employee e join department d on (e.dept_id = d.id) group by (d.dept_name) having(e.salary < avg(e.salary));
-- select d.dept_name e.name from employee e join department d on (e.dept_id = d.id) group by (d.dept_name,e.name) having (avg(e.salary)>e.salary);
select d.dept_name ,avg(e.salary) from employee e join department d on(e.dept_id =d.id)group by d.dept_name having (count(e.id)>2);
select d.dept_name ,avg(e.salary) from employee e join department d on(e.dept_id =d.id)group by d.dept_name ;
select * from(select id from employee); --inline view
select d.dept_name from department d where id NOT in(select distinct nvl(TO_CHAR(dept_id),'0') from employee);
--e.name cpas for fmale l male
SELECT e.gender ,DECODE (e.gender, 'F', upper(e.name), 'M', LOWER(e.name)) FROM employee e;
