-- count salary more than 60000 
-- count salary more than 20000 and male
select count(name) from employee where salary>=60000;

select count(name) from employee where salary>=20000 and gender='M';
select id,rownum from employee;
select id,rownum from employee order by ID ;
select id,rownum from employee order by ID DESC;
select id,rownum from employee where gender ='F';
