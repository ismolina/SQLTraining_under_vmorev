BEGIN
FOR i IN 1..190000 LOOP
 
    INSERT INTO EMPLOYEES (EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.FIRST_NAME, EMPLOYEES.LAST_NAME, EMPLOYEES.EMAIL,EMPLOYEES.job_id,
    EMPLOYEES.DEPARTMENT_ID, EMPLOYEES.manager_id,
    EMPLOYEES.salary,
    EMPLOYEES.PHONE_NUMBER, EMPLOYEES.HIRE_DATE)
    
    VALUES (i, 
              (select emp_firstnames.f_name from  emp_firstnames 
              where (emp_firstnames.f_id= (SElECT ids.FIRST_NAME_ID FROM ids WHERE ids.EMPLOYEE_ID=i))),  
                                             
              (select emp_secondnames.s_name from  emp_secondnames 
              where (emp_secondnames.s_id=(SElECT ids.last_name_id 
                                             FROM ids
                                             WHERE ids.EMPLOYEE_ID=i))),
              
              ((select emp_firstnames.f_name from  emp_firstnames 
              where (emp_firstnames.f_id=(SElECT ids.FIRST_NAME_ID 
                                             FROM ids
                                             WHERE ids.EMPLOYEE_ID=i)))              
            || '' || 
             (select emp_secondnames.s_name from  emp_secondnames 
              where (emp_secondnames.s_id=(SElECT ids.last_name_id 
                                             FROM ids
                                             WHERE ids.EMPLOYEE_ID=i)))
             || '_' || 
             (select jobs.job_id from jobs where (jobs.j_id=(SElECT ids.j_id FROM ids 
   WHERE ids.EMPLOYEE_ID=i)))),
   
   (select jobs.job_id from jobs where (jobs.j_id=(SElECT ids.j_id FROM ids 
   WHERE ids.EMPLOYEE_ID=i))),
   
       (select departments.DEPARTMENT_ID from departments where (departments.DEPARTMENT_ID=(SElECT ids.d_id FROM ids 
   WHERE ids.EMPLOYEE_ID=i))),
   
       (select departments.manager_id from departments where (departments.DEPARTMENT_ID=(SElECT ids.d_id FROM ids 
   WHERE ids.EMPLOYEE_ID=i))),
   
      TRUNC(DBMS_RANDOM.value((select jobs.MIN_SALARY from jobs where (jobs.j_id=(SElECT ids.j_id FROM ids 
   WHERE ids.EMPLOYEE_ID=i))),(select jobs.MAX_SALARY from jobs where (jobs.j_id=(SElECT ids.j_id FROM ids 
   WHERE ids.EMPLOYEE_ID=i))))),
   
               (TRUNC(DBMS_RANDOM.VALUE(100, 1000))|| '.' || TRUNC(DBMS_RANDOM.VALUE(100, 1000)) || '.' || 
            TRUNC(DBMS_RANDOM.VALUE(1000, 10000))),
              
            TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_NUMBER(TO_CHAR(TO_DATE('01/01/2000', 'MM/DD/YYYY'), 'J')), 
            TO_NUMBER(TO_CHAR(SYSDATE - (365 * 30), 'J')))), 'J')
   
   
   );   
   END LOOP;    
  update EMPLOYEES set COMMISSION_PCT = .2 where EMPLOYEES.DEPARTMENT_ID<100;
  update EMPLOYEES set COMMISSION_PCT = .05 where EMPLOYEES.DEPARTMENT_ID>700;
END;