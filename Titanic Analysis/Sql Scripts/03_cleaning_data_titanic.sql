-- there are null values in age. we will use a simple statistic to fill those null values
UPDATE survival_rates
--not deleting because we want to use other info on these passengers, so an average will suffice
SET age = (SELECT AVG(age) FROM survival_rates WHERE age IS NOT NULL) 
WHERE age IS NULL;

-- rounding the age to eliminate tons of decimal places
UPDATE survival_rates
SET age = ROUND(age::numeric, 1);

-- we are then deleting the two null port rows as it is only 2
-- we could fill in the most common port but for this we will keep it simple

DELETE FROM survival_rates
WHERE port IS NULL;
