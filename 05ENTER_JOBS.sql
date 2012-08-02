BEGIN
FOR i IN 1..19 LOOP
INSERT INTO jobs (jobs.j_id, jobs.job_id, jobs.job_title) values (i,
(select jobname.j_id from jobname where (jobname.ids=i)),
(select jobname.j_title from jobname where (jobname.ids=i))
);
END LOOP;
update jobs set min_salary = DBMS_RANDOM.value(30000,50000), max_salary = DBMS_RANDOM.value(50000,70000);

update jobs set min_salary=DBMS_RANDOM.value(50000,70000), max_salary = DBMS_RANDOM.value(70000,90000) where jobs.j_id=1;

END;