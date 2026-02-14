
--Country Total Summary 
--Totat impact per country

SELECT
    country,
    MAX(cumulative_cases) AS total_cases,
    MAX(cumulative_deaths) AS total_deaths
FROM covid_cases_final
GROUP BY country
ORDER BY total_cases DESC
LIMIT 20;


--Region Summary 
SELECT
    who_region,
    MAX(cumulative_cases) AS region_total_cases,
    MAX(cumulative_deaths) AS region_total_deaths
FROM covid_cases_final
GROUP BY who_region
ORDER BY region_total_cases DESC;


--Peak Day per Country 
SELECT DISTINCT ON (country)
    country,
    date_reported,
    new_cases_final
FROM covid_cases_final
ORDER BY country, new_cases_final DESC;

--Highest Growth Rate 
SELECT
    country,
    date_reported,
    growth_percent
FROM covid_growth_percent
WHERE growth_percent IS NOT NULL
ORDER BY growth_percent DESC
LIMIT 20;

--Monthly Aggregation 
SELECT
    country,
    DATE_TRUNC('month', date_reported) AS month,
    SUM(new_cases_final) AS monthly_cases
FROM covid_cases_final
GROUP BY country, month
ORDER BY month;


--7-Day Trend vs Daily
SELECT
    f.country,
    f.date_reported,
    f.new_cases_final,
    m.cases_7day_avg
FROM covid_cases_final f
JOIN covid_moving_avg m
  ON f.country = m.country
 AND f.date_reported = m.date_reported;

-- Dashboard dataset
CREATE VIEW covid_dashboard_dataset AS
SELECT
    f.country,
    f.who_region,
    f.date_reported,
    f.new_cases_final,
    f.new_deaths_final,
    f.cumulative_cases,
    f.cumulative_deaths,
    m.cases_7day_avg,
    g.growth_percent
FROM covid_cases_final f
LEFT JOIN covid_moving_avg m
  ON f.country = m.country
 AND f.date_reported = m.date_reported
LEFT JOIN covid_growth_percent g
  ON f.country = g.country
 AND f.date_reported = g.date_reported;


--Validate Final Dataset
SELECT COUNT(*) FROM covid_dashboard_dataset;
SELECT *
FROM covid_dashboard_dataset
LIMIT 10;
