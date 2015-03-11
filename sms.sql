--create user 
--garan permision --resource-create session
--create tables
 create user SMS identified by smspass quota unlimited on users;
 GRANT create session to SMS ;
 GRANT resource to SMS ;
 create table student (id int);
 create table attendance (id int,name varchar(30));
 select * from tab;-- shows all created table 
 create user Reporter identified by repoopass quota unlimited on users;
 GRANT create session to reporter;
 GRANT resource to reporter ;
--as sms
 GRANT select on student to reporter;
 describe v$datafile
 select name,ts# from v$datafile;
 describe v$tablespace;
 select name,ts# from v$tablespace;


 create table student(rollno number(4) PRIMARY KEY,name varchar(200),dob date,Address_1 varchar(500),Address_2 varchar(500),
 	city varchar(20),state varchar(30),pincode number(10),contact_no number(10),email varchar(30),gender char(1),isPhysicallyChallenged char(1));
 SELECT sysdate FROM dual;

SELECT TO_CHAR(sysdate, 'DD-MON-YYYY HH:MI:SS') FROM dual;

SELECT TO_CHAR(sysdate, 'DD-MON-YYYY HH:MI:SS') AS Today_date FROM dual;
INSERT ALL
into  student VALUES(1010,'SIRFIRI',to_date('20-09-1996','dd-mm-yyyy'),'2 bhootkahana','4 smashyan ke piche','bhutiyapur','manipuran',663344,8833884455,'sirfiri@gmail.com','F','N')
into  student
	VALUES(1009,'SIRFLILA',to_date('10-10-1996','dd-mm-yyyy'),'9-2-11 phute kisamt','drabare sahensha','ajubapur','tamilnadu',334234,4203240420,'lila@gmail.com','F','N')
	into  student
	VALUES(1008,'RAMLILA',to_date('30-09-1996','dd-mm-yyyy'),'520 katle kahana','khuni nagar','choolepur','rajastan',663354,8833883338,'rammu@gmail.com','F','N')
	into  student VALUES(1007,'PREMILA',to_date('20-09-1996','dd-mm-yyyy'),'320 emlika ped','khufiya nagar','bhutiyapur','manipuran',663344,8833882228,'pammu@gmail.com','F','N')
	into  student VALUES(1006,'SHARMILA',to_date('10-09-1996','dd-mm-yyyy'),'123 mafiya gali','sufiya nagar','paglapur','Lakshadweep',997779,9090909090,'shmmu@gmail.com','F','N')
	into  student VALUES(1005,'PREMPRASAD',to_date('19-11-1995','dd-mm-yyyy'),'420 salman khan road','mashoor cafe','paglapur','Lakshadweep',997779,1010101010,'papu@gmail.com','M','N')
	into  student VALUES(1004,'DEVPRASAD',to_date('09-10-1995','dd-mm-yyyy'),'265 neharu road','kali patti','guna','MadhyaPradesh',330012,1999999999,'debu@gmail.com','M','N')
	into  student VALUES(1003,'GYANPRASAD',to_date('29-09-1995','dd-mm-yyyy'),'25 bharat housing socity','civil line','wardha','Maharashtra',442001,2288888888,'ganu@gmail.com','M','N')
	into  student VALUES(1002,'SHYAMPRASAD',to_date('19-09-1995','dd-mm-yyyy'),'125 gandhi road','vilasNagar','gondia','Maharashtra',442115,3337777777,'shamu@gmail.com','M','N')
	into  student VALUES(1001,'RAMPRASAD',to_date('09-09-1995','dd-mm-yyyy'),'125 gandhi road','tar-faila','washignton-DC','United State',420420,4444666666,'ramu@gmail.com','M','N')
SELECT * FROM dual;	
drop user sms cascade

create tablespace schoolSpace DATAFILE 'C:\ORACLEXE\APP\ORACLE\ORADATA\XE\school_space.dbf' size 100M autoextend ON;
create user SMS identified by smspass default tablespace schoolSpace quota unlimited on schoolSpace;

-- check constrain On gender

Alter table student add constraint validateGender check(gender in('M','F'));
-- create table employee(id number(4) PRIMARY KEY,name varchar(200),email varchar(30),acc_no number(20),department_id number(5),gender char(1));