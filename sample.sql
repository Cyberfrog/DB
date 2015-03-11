CREATE USER SMS IDENTIFIED BY SMS1234 QUOTA UNLIMITED ON USERS;
GRANT CREATE SESSION TO SMS;
GRANT RESOURCE TO SMS;
CONNECT SMS/SMS1234;
CREATE TABLE STUDENT (ID NUMBER,NAME VARCHAR(30));
CREATE TABLE ATTENDANCE (ID NUMBER,NAME VARCHAR(30),DAYS_PRESENT NUMBER);
SELECT * FROM TAB;
SHOW USER;
CREATE USER REPORTER IDENTIFIED BY REP1234 QUOTA UNLIMITED ON USERS;
GRANT CREATE SESSION TO REPORTER;
GRANT RESOURCE TO REPORTER;
CONNECT REPORTER/REP1234;
SELECT * FROM TAB;
SHOW USER;
SELECT * FROM SMS;-- WON'T ALLOW BECAUSE NO PRIVILEGE FOR FOREING USER
-- IN SMS
GRANT SELECT ON STUDENT TO REPORTER;
SELECT * FROM SMS.STUDENT;
-- DDL
-- DML
-- DCL
-- TCL
DESC V$DATAFILE;
SELECT NAME, "TS#" FROM V$DATAFILE;
DESC V$TABLESPACE;
SELECT NAME, "TS#" FROM V$TABLESPACE;
SELECT NAME, "TS#" FROM V$DATAFILE WHERE "TS#"=4;
DROP TABLE STUDENT;
-- ALPHANUMERIC -VARCHAR(SIZE);
-- NUMERIC -NUMBER(SIZE);
-- DATE -DATE;
-- TO_CHAR;
CREATE TABLE STUDENT
	(ID NUMBER(4) PRIMARY KEY,NAME VARCHAR(200),DOB DATE,
	ADDRESS1 VARCHAR(200),ADDRESS2 VARCHAR(200),CITY VARCHAR(100),PINCODE VARCHAR(50),
	CONTACT_NUMBER NUMBER(10),EMAIL_ID VARCHAR(100),GENDER CHAR(1)
	);
INSERT INTO STUDENT VALUES
	(902,'ADAM',TO_DATE('01,11,1993','DD,MM,YYYY'),'5/44,2ND STREET,','9TH MAIN,KORAMANGALA 3RD BLOCK','BENGALURU','560038',9876543210,'ADAM@GMAIL.COM','M');
INSERT INTO STUDENT VALUES
	(200,'BADAM',TO_DATE('01,11,1994','DD,MM,YYYY'),'54/1,3RD STREET,','4TH MAIN,MANGALA 3RD BLOCK','KOLKATA','600385',9876543211,'BADAM@GMAIL.COM','M');
INSERT INTO STUDENT VALUES
	(300,'PISTHA',TO_DATE('01,11,1995','DD,MM,YYYY'),'15/4,4TH STREET,','2ND MAIN,KORA 4TH BLOCK','VARDHA','356008',9876543212,'PISTHA@GMAIL.COM','M');
INSERT INTO STUDENT VALUES
	(400,'SUSMITHA',TO_DATE('01,01,1992','DD,MM,YYYY'),'51,5TH STREET,','4TH MAIN,AMANGALA 5TH BLOCK','SATHARA','856003',9876543213,'SUSMITHA@GMAIL.COM','F');
INSERT INTO STUDENT VALUES
	(500,'SEN',TO_DATE('11,02,1995','DD,MM,YYYY'),'51/4,6TH STREET,','1ST MAIN,KORAM 6TH BLOCK','PATIALA','305608',9876543214,'SEN@GMAIL.COM','F');
INSERT INTO STUDENT VALUES
	(600,'ALTO',TO_DATE('30,10,1993','DD,MM,YYYY'),'5/14,7TH STREET,','4TH MAIN,MANGALAM K 7TH BLOCK','MUMBAI','605038',9876543215,'ALTO@GMAIL.COM','M');
INSERT INTO STUDENT VALUES
	(700,'ALTHRI',TO_DATE('01,11,1994','DD,MM,YYYY'),'154,7TH STREET,','3RD MAIN,LUCIA 8TH BLOCK','TRIVANDRAM','653008',9876543216,'ALTHRI@GMAIL.COM','F');
INSERT INTO STUDENT VALUES
	(800,'PALTHRI',TO_DATE('12,12,1995','DD,MM,YYYY'),'541,9TH STREET,','4TH MAIN,INCEPTION_COLLENY 9TH BLOCK','MADURAI','803560',9876543217,'PALTHRI@GMAIL.COM','F');
INSERT INTO STUDENT VALUES
	(900,'PAL',TO_DATE('31,3,1997','DD,MM,YYYY'),'514,1ST STREET,','5TH MAIN,5TH MAIN BLOCK','NEWYORK','538600',9876543218,'PAL@GMAIL.COM','M');
INSERT INTO STUDENT VALUES
	(901,'MAL',TO_DATE('01,7,1992','DD,MM,YYYY'),'4,2ND STREET,','4TH MAIN,3RD MAIN BLOCK','DELHI','865308',9876543219,'MAL@GMAIL.COM','F');
CREATE TABLESPACE MyTableSpace
	DATAFILE 'C:\ORACLEXE\APP\ORACLE\ORADATA\XE\MyTableSpace_01.DBF'
	SIZE 100M AUTOEXTEND ON;
CREATE USER SMS IDENTIFIED BY SMS1234 QUOTA UNLIMITED ON MyTableSpace DEFAULT TABLESPACE MyTableSpace;
GRANT CREATE SESSION TO SMS;
GRANT RESOURCE TO SMS;
CONNECT SMS/SMS1234;
-- ALTER THE TABLE ADD THE CHECK CONSTRAINT TO THE GENDER COLUMN;
-- look up for social security number in U.S.
-- normalaization forms 1st 2nd 3rd
-- DATABASE OBJECTS	
-- CREATE SEQUENCE START WITH (LIMITATION)
CREATE SEQUENCE emp_id_seq
	START WITH 1000
	INCREMENT BY 1;
CREATE TABLE EMPLOYEE(
EMP_ID NUMBER(4) PRIMARY KEY,NAME VARCHAR(200),AC_NO CHAR(16),HOME_OFFICE_CODE VARCHAR(5));
INSERT INTO EMPLOYEE VALUES
	(emp_id_seq.nextval,'BABU','1234509876111111','BLR01');
INSERT INTO EMPLOYEE VALUES
	(emp_id_seq.nextval,'CABU','1234509876131111','BLR02');
INSERT INTO EMPLOYEE VALUES
	(emp_id_seq.nextval,'DABU','1234509876151111','HYD01');
INSERT INTO EMPLOYEE VALUES
	(emp_id_seq.nextval,'EABU','1234509876117111','DEL01');
INSERT INTO EMPLOYEE VALUES
	(emp_id_seq.nextval,'FABU','1234509876118111','DEL01');
INSERT INTO EMPLOYEE VALUES
	(emp_id_seq.nextval,'EABU','1234509876119111','BLR01');
INSERT INTO EMPLOYEE VALUES
	(emp_id_seq.nextval,'DABU','1234509876111110','PUN01');
INSERT INTO EMPLOYEE VALUES
	(emp_id_seq.nextval,'GABU','1234509876111112','PUN02');
INSERT INTO EMPLOYEE VALUES
	(emp_id_seq.nextval,'TABU','1234509876111113','CNI01');
ALTER TABLE STUDENT ADD
	(MARK1 NUMBER(3),MARK2 NUMBER(3),MARK3 NUMBER(3));

UPDATE STUDENT SET MARK1=88, MARK2=60, MARK3=76 WHERE rollno=1001;
UPDATE STUDENT SET MARK1=80, MARK2=78, MARK3=65 WHERE rollno=1002;
UPDATE STUDENT SET MARK1=50, MARK2=38, MARK3=36 WHERE rollno=1003;
UPDATE STUDENT SET MARK1=40, MARK2=28, MARK3=67 WHERE rollno=1004;
UPDATE STUDENT SET MARK1=30, MARK2=98, MARK3=83 WHERE rollno=1005;
UPDATE STUDENT SET MARK1=40, MARK2=48, MARK3=100 WHERE rollno=1006;
UPDATE STUDENT SET MARK1=100, MARK2=83, MARK3=100 WHERE rollno=1007;
UPDATE STUDENT SET MARK1=49, MARK2=38, MARK3=50 WHERE rollno=1008;
UPDATE STUDENT SET MARK1=89, MARK2=73, MARK3=73 WHERE rollno=1009;
UPDATE STUDENT SET MARK1=93, MARK2=85, MARK3=99 WHERE rollno=1010;
ALTER TABLE STUDENT ADD
	(TOTAL NUMBER(3));
UPDATE STUDENT SET TOTAL=MARK1+MARK2+MARK3;
-- ALL PASSED
SELECT rollno,NAME,MARK1,MARK2,MARK3 FROM STUDENT WHERE MARK1>=60 AND MARK2>=60 AND MARK3>=60;
-- ALL FAILED
SELECT rollno,NAME,MARK1,MARK2,MARK3 FROM STUDENT WHERE MARK1<60 AND MARK2<60 AND MARK3<60;
-- ATLEAST ONE FAILED
SELECT rollno,NAME,MARK1,MARK2,MARK3 FROM STUDENT WHERE MARK1<60 OR MARK2<60 OR MARK3<60;
-- ATLEAST ONE PASSED
SELECT rollno,NAME,MARK1,MARK2,MARK3 FROM STUDENT WHERE MARK1>=60 OR MARK2>=60 OR MARK3>=60;
-- AVG OF MARK1
SELECT AVG(MARK1) AS AVG1,AVG(MARK2) AS AVG2,AVG(MARK3) AS AVG3 FROM STUDENT;
-- TESTING INBUILT AVG
SELECT
	AVG(MARK1)+AVG(MARK2)+AVG(MARK3) AS AVG_OF_TOTAL_VIA_AVGS_OF_MARKS,
	AVG(TOTAL) AS AVG_OF_TOTAL
	FROM STUDENT;
-- TESTING INBUILT SUM
SELECT
	SUM(MARK1)+SUM(MARK2)+SUM(MARK3) AS SUM_OF_TOTAL_VIA_SUMS_OF_MARKS,
	SUM(TOTAL) AS SUM_OF_TOTAL
	FROM STUDENT;
-- MAX OF EACH MARK
SELECT MAX(MARK1),MAX(MARK2),MAX(MARK3) FROM STUDENT;
-- MIN OF EACH MARK
SELECT MIN(MARK1),MIN(MARK2),MIN(MARK3) FROM STUDENT;
-- automating
-- @ "D:\git\SQL\test_sql\script_01.sql"