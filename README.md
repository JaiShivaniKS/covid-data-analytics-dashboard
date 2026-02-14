🦠 **COVID-19 Global Data Cleaning & Analytics Dashboard**


📌 Project Overview

This project focuses on cleaning, transforming, and analyzing global COVID-19 case data using PostgreSQL and Power BI.
The objective was to:
- Handle inconsistencies in international datasets
- Perform time-series feature engineering
- Build an interactive analytical dashboard

Dataset contains over 500,000+ records of global COVID-19 cases.

📂 Dataset Source

World Health Organization (WHO) COVID-19 Global Data  
Direct CSV download: https://covid19.who.int/WHO-COVID-19-global-data.csv

Note: Due to GitHub file size limitations, the raw dataset is not included in this repository.


🛠 Tools & Technologies

- PostgreSQL (Data cleaning & transformation)
- SQL (Window functions, aggregation, feature engineering)
- Power BI (Interactive dashboard & visualization)
- GitHub (Version control & project documentation)


🧹 Data Cleaning Process

Performed using PostgreSQL:

- Standardized country names
- Converted date formats
- Handled missing values
- Identified and corrected anomalies
- Removed negative case entries
- Created cleaned dataset for analysis


📊 Feature Engineering

Implemented advanced time-series metrics:

- 7-Day Moving Average (using SQL window functions)
- Daily Growth Percentage
- Regional Aggregations
- Country-level cumulative trends


📈 Dashboard Features

- Global daily case trend
- 7-day moving average visualization
- Top 10 countries by total cases
- WHO region comparison
- Growth rate analysis
- Interactive slicers (Country, Region, Date)


🖼 Dashboard Preview

Full Dashboard (screenshots/dashboard_full.png)


📂 Project Structure

P1-CovidDataCleaning/
│
├── data/
├── sql/
├── powerbi/
├── screenshots/
└── README.md


📥 Download Dashboard

You can download the Power BI dashboard file here:

[Download Power BI Dashboard](powerbi/covid_analytics_dashboard.pbix)
Open using Power BI Desktop.

🔍 How to Use

1. Download the Power BI file from the `powerbi/` folder.
2. Open using Microsoft Power BI Desktop.
3. Use slicers (Country, Region, Date) to interact with the dashboard.

🚀 Key Learning Outcomes

- Handling large international datasets
- Writing efficient SQL for time-series analytics
- Building interactive BI dashboards
- End-to-end data analytics workflow


