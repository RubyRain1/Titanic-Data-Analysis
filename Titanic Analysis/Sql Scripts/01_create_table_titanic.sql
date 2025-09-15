-- this is the schema that I will be using for my information
-- it creates a table that will house all the required information for analysis 
CREATE TABLE survival_rates ( 
	passenger_id INT PRIMARY KEY,
	survived INT,
	pclass INT,
	pname TEXT,
	sex VARCHAR, 
	age INT, 
	sibsp INT, 
	parch INT, 
	port CHAR(1),
	fare DECIMAL(10,2)



)