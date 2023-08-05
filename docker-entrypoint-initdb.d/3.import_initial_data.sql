LOAD DATA LOCAL INFILE 
"/docker-entrypoint-initdb.d/initial-data/data.csv"
INTO TABLE `tasks` FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
IGNORE 1 LINES;
