load data
infile 'D:\SQLTraining\Country_List.txt'
into table COUNTRIES
fields terminated by ";"		  
( C_ID, COUNTRY_ID, COUNTRY_NAME)