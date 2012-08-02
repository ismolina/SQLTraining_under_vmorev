load data
infile 'D:\SQLTraining\Jobs_List.txt'
into table jobname
fields terminated by ";"		  
( ids, J_ID, J_TITLE)