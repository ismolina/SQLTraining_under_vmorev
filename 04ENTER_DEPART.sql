BEGIN
    FOR i IN 1..243 LOOP
     FOR j IN 1..3 LOOP  
    INSERT INTO departments (department_id, department_name, country_id, manager_id) VALUES ((i*3+(j-1)-2) ,j,i, (TRUNC(DBMS_RANDOM.value(1,10000))));
     END LOOP;
    END LOOP;
update departments set (department_name) = (select depname.dep_name from depname 
where departments.department_name=depname.dep_id);

update departments set (country_id) = (select countries.country_id from countries 
where departments.country_id=countries.c_id);

END;