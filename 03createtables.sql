set feedback off
set define off

drop table COUNTRIES cascade constraints;
create table COUNTRIES (
  C_ID NUMBER(4) not null,
  COUNTRY_ID   CHAR(6),
  COUNTRY_NAME VARCHAR2(60),
   constraint COUNTRY_C_ID_PK primary key (C_ID)
);
host (sqlldr TRAINING/123 control=D:\SQLTraining\countries.ctl);


drop table JOBS cascade constraints;
create table JOBS (
j_id NUMBER(4)  not null,
  JOB_ID     VARCHAR2(10),
  JOB_TITLE  VARCHAR2(35),
  MIN_SALARY NUMBER(6),
  MAX_SALARY NUMBER(6)
);

drop table JOBNAME cascade constraints;
create table JOBNAME (
ids NUMBER(4)  not null,
  J_ID     VARCHAR2(10),
  J_TITLE  VARCHAR2(35)
);
host (sqlldr TRAINING/123 control=D:\SQLTraining\jobs.ctl);


drop table depname cascade constraints;
create table depname(
  dep_id   NUMBER(4) not null,
  dep_name varchar2(30)
);
insert into DEPNAME (DEP_ID, DEP_NAME) values (1, 'Administration');
insert into DEPNAME (DEP_ID, DEP_NAME) values (2, 'Trade');
insert into DEPNAME (DEP_ID, DEP_NAME) values (3, 'Securits');
commit;

drop table DEPARTMENTS cascade constraints;
create table DEPARTMENTS (
  DEPARTMENT_ID   NUMBER(4) not null,
  DEPARTMENT_NAME VARCHAR2(30),
  MANAGER_ID      NUMBER(6),
  COUNTRY_ID   CHAR(10)
);


drop table EMP_FIRSTNAMES cascade constraints;
create table EMP_FIRSTNAMES (
  F_ID    NUMBER(6) not null,
  F_NAME     VARCHAR2(40)
);
host (sqlldr TRAINING/123 control=D:\SQLTraining\firstnames.ctl);
commit;

drop table EMP_SECONDNAMES cascade constraints;
create table EMP_SECONDNAMES (
  S_ID    NUMBER(6) not null,
  S_NAME     VARCHAR2(40)
);
host (sqlldr TRAINING/123 control=D:\SQLTraining\secondnames.ctl);
commit;

drop table ids cascade constraints;
create table ids (
  EMPLOYEE_ID    NUMBER(6) not null,
  FIRST_NAME_ID     NUMBER(6),
  LAST_NAME_ID      NUMBER(6),
  J_ID         VARCHAR2(10),
  D_id NUMBER(4)
);
commit;

drop table EMPLOYEES cascade constraints;
create table EMPLOYEES (
  EMPLOYEE_ID    NUMBER(6) not null,
  FIRST_NAME     VARCHAR2(30),
  LAST_NAME      VARCHAR2(35),
  EMAIL          VARCHAR2(50),
  PHONE_NUMBER   VARCHAR2(30),
  HIRE_DATE      DATE,
  JOB_ID         VARCHAR2(10),
  SALARY         NUMBER(10,2),
  COMMISSION_PCT NUMBER(2,2),
  MANAGER_ID     NUMBER(8),
  DEPARTMENT_ID  NUMBER(8)
);
