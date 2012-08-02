load data
infile 'D:\SQLTraining\FirstNames_List.txt'
into table EMP_FIRSTNAMES
fields terminated by ";"		  
( F_ID, F_NAME )