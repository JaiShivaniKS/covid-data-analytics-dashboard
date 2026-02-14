
CREATE VIEW covid_cases_filled AS
SELECT
    country,
    date_reported,

    -- forward fill cases
    COALESCE(
        new_cases,
        LAG(new_cases) OVER (
            PARTITION BY country
            ORDER BY date_reported
        )
    ) AS new_cases_filled,

    -- forward fill deaths
    COALESCE(
        new_deaths,
        LAG(new_deaths) OVER (
            PARTITION BY country
            ORDER BY date_reported
        )
    ) AS new_deaths_filled,

    cumulative_cases,
    cumulative_deaths,
    who_region

FROM covid_cases;

--Verify
SELECT *
FROM covid_cases_filled
WHERE new_cases_filled IS NULL
LIMIT 10;


