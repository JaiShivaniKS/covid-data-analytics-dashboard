CREATE TABLE covid_cases (
    date_reported DATE,
    country_code VARCHAR(5),
    country VARCHAR(100),
    who_region VARCHAR(20),
    new_cases INT,
    cumulative_cases INT,
    new_deaths INT,
    cumulative_deaths INT
);
