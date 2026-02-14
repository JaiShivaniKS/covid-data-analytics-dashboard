SELECT COUNT(*) AS missing_country
FROM covid_cases
WHERE country IS NULL OR country = '';

SELECT COUNT(*) AS missing_dates
FROM covid_cases
WHERE date_reported IS NULL;

SELECT COUNT(*) AS negative_cases
FROM covid_cases
WHERE new_cases < 0;

SELECT COUNT(*) AS negative_deaths
FROM covid_cases
WHERE new_deaths < 0;

SELECT COUNT(DISTINCT country)
FROM covid_cases;