--Two-Stage Fill
CREATE VIEW covid_cases_final AS
SELECT
    country,
    date_reported,
    COALESCE(new_cases_filled, 0) AS new_cases_final,
    COALESCE(new_deaths_filled, 0) AS new_deaths_final,
    cumulative_cases,
    cumulative_deaths,
    who_region
FROM covid_cases_filled;

--Verify
SELECT *
FROM covid_cases_final
WHERE new_cases_final IS NULL;