-- populate the raw data table *insert your own desired paths*

COPY titanic_raw
FROM 'C:/your_path_here/train_titanic.csv'
DELIMITER ','
CSV HEADER;
