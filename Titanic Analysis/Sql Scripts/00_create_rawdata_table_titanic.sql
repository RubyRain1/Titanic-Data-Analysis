-- creates raw data for easier transfer
CREATE TABLE titanic_raw (
    passengerid INT,
    survived INT,
    pclass INT,
    name TEXT,
    sex VARCHAR(6),
    age TEXT,          
    sibsp INT,
    parch INT,
    ticket TEXT,
    fare DECIMAL(10,2),
    cabin TEXT,
    embarked CHAR(1)
);
