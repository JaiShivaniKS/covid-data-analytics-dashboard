--Validation Metrics
SELECT
    country,
    date_reported,
    cumulative_cases,
    cumulative_cases
      - LAG(cumulative_cases) OVER (
          PARTITION BY country
          ORDER BY date_reported
        ) AS derived_new_cases
FROM covid_cases_final;

--Growth rate metric
CREATE VIEW covid_growth_metrics AS
SELECT
    country,
    date_reported,
    new_cases_final,

    LAG(new_cases_final) OVER (
        PARTITION BY country
        ORDER BY date_reported
    ) AS prev_day_cases,

    CASE
        WHEN LAG(new_cases_final) OVER (
            PARTITION BY country
            ORDER BY date_reported
        ) = 0 THEN NULL
        ELSE
            new_cases_final::numeric /
            NULLIF(
                LAG(new_cases_final) OVER (
                    PARTITION BY country
                    ORDER BY date_reported
                ), 0)
    END AS growth_ratio

FROM covid_cases_final;

--Percent Growth
CREATE VIEW covid_growth_percent AS
SELECT *,
       ROUND((growth_ratio - 1) * 100, 2) AS growth_percent
FROM covid_growth_metrics;

--7day moving average
CREATE VIEW covid_moving_avg AS
SELECT
    country,
    date_reported,
    new_cases_final,

    AVG(new_cases_final) OVER (
        PARTITION BY country
        ORDER BY date_reported
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS cases_7day_avg

FROM covid_cases_final;

--Validation query
SELECT *
FROM covid_moving_avg
WHERE country = 'India'
ORDER BY date_reported
LIMIT 20;

SELECT COUNT(*) FROM covid_cases_final;
