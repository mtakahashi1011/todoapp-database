load data local infile 
"/docker-entrypoint-initdb.d/initial-data/data.csv"
into table `tasks` fields terminated by ',' optionally enclosed by ""
ignore 1 lines;
