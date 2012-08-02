load data
infile 'D:\SQLTraining\SecondNames_List.txt'
into table EMP_SECONDNAMES
fields terminated by ";"		  
( S_ID, S_NAME )