-- importing desired data from kaggle titanic csv --
INSERT INTO survival_rates (
  passenger_id, survived, pclass, pname, sex, age, sibsp, parch, fare, port
)
SELECT
  passengerid,
  survived,
  pclass,
  name AS pname,
  sex,
  NULLIF(age,'')::FLOAT,      --showing null to clean and populate later to show the skill  
  sibsp,
  parch,
  fare,
  embarked AS port
FROM titanic_raw;
