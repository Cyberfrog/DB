
conn / as sysdba

PROMPT 'Creating Tablespaces'

-- Create tablespaces
CREATE TABLESPACE ts_step_system DATAFILE 'C:\ORACLEXE\APP\ORACLE\ORADATA\XE\step_system_01.dbf' SIZE 200M AUTOEXTEND ON;
PROMPT '.... Tablespace creation completed.'


DROP USER step_admin CASCADE;

-- Creating users
PROMPT 'Creating user'
CREATE USER step_admin IDENTIFIED BY password DEFAULT TABLESPACE ts_step_system QUOTA UNLIMITED ON ts_step_system;
GRANT CREATE SESSION TO step_admin;
GRANT RESOURCE TO step_admin;
PROMPT '.... User created with required privileges'

-- Connect as the schema user
PROMPT 'Connecting as step_admin'
conn step_admin/password
-- DROP TABLE Apti_test CASCADE CONSTRAINTS;
-- DROP TABLE Educational_Details CASCADE CONSTRAINTS;
-- DROP TABLE Teliphonic_Interview CASCADE CONSTRAINTS;
-- DROP TABLE Technical_Interview CASCADE CONSTRAINTS;
-- DROP TABLE Centers CASCADE CONSTRAINTS;
-- DROP TABLE Aplicant CASCADE CONSTRAINTS;

CREATE TABLE Aplicant (
id			NUMBER(10),
name		VARCHAR(50) NOT NULL,
dob			DATE NOT NULL,
gender		CHAR(1),
cell_phone	VARCHAR(15),
email		VARCHAR(30),
adderess1 	VARCHAR(100),
adderess2	VARCHAR(100),
city		VARCHAR(30),
State 		VARCHAR(30),
pin_code	VARCHAR(10),
Status 		VARCHAR(20),	  
CONSTRAINT aplicant_pk PRIMARY KEY(id),
CONSTRAINT aplicant_gender_chk CHECK(gender IN ('M', 'F') ),
CONSTRAINT aplicant_Status_chk CHECK(Status IN ('NEW', 'PassedTest','interviwed','selected','failedTest','Rejected') )
);

PROMPT 'Applicant created'

CREATE TABLE Centers (
code  VARCHAR(10),
Name 	VARCHAR(10),
adderess	VARCHAR(100),
city 		VARCHAR(100),
CONSTRAINT centers_pk PRIMARY KEY(code)
) TABLESPACE ts_step_system; 

PROMPT 'centers created'

CREATE TABLE Apti_test (
id 		 	 Number(10),
Applicant_id NUMBER(10),
center_code	VARCHAR(50),
Exam_date	DATE,
CONSTRAINT apti_test_pk PRIMARY KEY(id),
CONSTRAINT Applicant_id_Apti_fk FOREIGN KEY (Applicant_id) REFERENCES Aplicant(id),
CONSTRAINT center_code_fk FOREIGN KEY (center_code) REFERENCES centers(code)
) TABLESPACE ts_step_system; 
PROMPT 'Apti_test created'

CREATE TABLE Educational_Details(
Enrollment_number Number(10),
Applicant_id NUMBER(10),
Univercity	VARCHAR(50)NOT NULL,
Tenth_Marks	NUMBER(3)NOT NULL,
Twelth_Marks  NUMBER(3),
Diploma_Marks NUMBER(3)NOT NULL,	
CONSTRAINT e_details_pk PRIMARY KEY(Enrollment_number),
CONSTRAINT Applicant_id_ed_fk FOREIGN KEY (Applicant_id) REFERENCES Aplicant(id)
) TABLESPACE ts_step_system; 
PROMPT 'Educational_Details created'

CREATE TABLE Technical_Interview(
id Number(10),
Applicant_id NUMBER(10),
interviwe_date	DATE NOT NULL,
interviwer_name	VARCHAR(20),
feedback_note varchar(500),
CONSTRAINT	interview_pk PRIMARY KEY(id),
CONSTRAINT Applicant_id_interview_fk FOREIGN KEY (Applicant_id) REFERENCES Aplicant(id)
) TABLESPACE ts_step_system;
PROMPT 'Technical_Interview created'

CREATE TABLE Teliphonic_Interview(
id Number(10),
Applicant_id NUMBER(10),
interviwe_date	DATE NOT NULL,
interviwer_name	VARCHAR(20),
feedback_note varchar(500),
CONSTRAINT	teliphonic_interview_pk PRIMARY KEY(id),
CONSTRAINT Applicant_id_ti_fk FOREIGN KEY (Applicant_id) REFERENCES Aplicant(id)
) TABLESPACE ts_step_system;
 
PROMPT 'Teliphonic_Interview created'
