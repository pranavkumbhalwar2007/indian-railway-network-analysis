# Indian Railways Network Analysis

## 📊 Overview
An end-to-end data analysis project examining India's railway network — covering 5,208 trains and 8,990 stations across 18 railway zones. The analysis benchmarks zone-wise speed performance and AC coach availability to identify infrastructure investment priorities.

## 🎯 Business Problem
Railway zones currently lack a consolidated view of performance metrics like average speed and AC coach accessibility, making it difficult for decision-makers to identify which zones need infrastructure upgrades.

## 🛠️ Tech Stack
- **MySQL** — relational database design (stations, trains, schedules)
- **Power Query** — data cleaning and transformation
- **DAX** — custom measures for zone-wise calculations
- **Power BI** — interactive dashboard and visualization

## 🔍 Approach
1. Designed a relational schema in MySQL linking stations, trains, and schedules tables
2. Cleaned inconsistent zone data (handled blanks and placeholder values)
3. Built DAX measures for average speed and AC-class availability, cross-verified every measure against raw SQL queries to ensure accuracy
4. Created an interactive Power BI dashboard with zone-level filtering

## 💡 Key Insights
- **KR zone** has the highest average train speed (53 km/h), while **SECR and ECR** lag behind (35 km/h)
- **ECoR** leads in Third AC availability (56%), while **NFR** has the lowest First AC coverage (just 3%)
- These gaps highlight specific zones that could benefit from targeted speed and AC-coach infrastructure investment

## 📌 Dashboard Preview


![Dashboard Screenshot](dashboard-screenshot.png)



- `queries.sql` — table structure and verification queries
- `measures.txt` — all DAX measures used in the dashboard
