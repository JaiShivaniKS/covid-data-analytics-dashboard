-- check distinct country samples
SELECT DISTINCT country
FROM covid_cases
ORDER BY country
LIMIT 20;

UPDATE covid_cases
SET country = TRIM(country),
    who_region = TRIM(who_region);

UPDATE covid_cases
SET country = INITCAP(country),
    who_region = INITCAP(who_region);

SELECT country, COUNT(*)
FROM covid_cases
GROUP BY country
ORDER BY country;

SELECT COUNT(*) 
FROM covid_cases
WHERE new_cases < 0;

SELECT COUNT(*) 
FROM covid_cases
WHERE new_deaths < 0;

SELECT country, COUNT(*)
FROM covid_cases
GROUP BY country
ORDER BY LOWER(country);

--Convert negative cases to NULL
UPDATE covid_cases
SET new_cases = NULL
WHERE new_cases < 0;

--Convert negative deaths to NULL
UPDATE covid_cases
SET new_deaths = NULL
WHERE new_deaths < 0;

--Verify
SELECT COUNT(*) FROM covid_cases WHERE new_cases < 0;
SELECT COUNT(*) FROM covid_cases WHERE new_deaths < 0;