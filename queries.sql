-- ===================================
-- Indian Railways Network Analysis - SQL Queries
-- ===================================

-- 1. Total trains
SELECT COUNT(*) FROM trainss;

-- 2. Total stations
SELECT COUNT(*) FROM stationss;

-- 3. Distinct zones (including blanks/placeholder values)
SELECT DISTINCT Zone FROM stationss;

-- 4. Sample train data structure
SELECT `Train Number`, `Train Name`, `First AC`, `Second AC`, `Third AC`, `Chair Car` 
FROM trainss LIMIT 10;

-- 5. Check Duration Minutes data quality (why it matters for speed calc)
SELECT COUNT(*) FROM trainss WHERE `Duration Minutes` > 0;

-- 6. Zone-wise total stops (connectivity)
SELECT t.Zone, COUNT(*) AS total_stops
FROM schedules s
JOIN trainss t ON s.`Train Number` = t.`Train Number`
WHERE t.Zone != '?'
GROUP BY t.Zone
ORDER BY total_stops DESC;

-- 7. Zone-wise AC class availability (%)
SELECT Zone,
  ROUND(100 * SUM(`Third AC`) / COUNT(*), 1) AS third_ac_pct,
  ROUND(100 * SUM(`Second AC`) / COUNT(*), 1) AS second_ac_pct,
  ROUND(100 * SUM(`First AC`) / COUNT(*), 1) AS first_ac_pct
FROM trainss
WHERE Zone != '?'
GROUP BY Zone
ORDER BY third_ac_pct DESC;

-- 8. Top 10 most connected stations
SELECT `Station Name`, `Station Code`, COUNT(*) AS train_stops
FROM schedules
GROUP BY `Station Name`, `Station Code`
ORDER BY train_stops DESC
LIMIT 10;

-- 9. Zone-wise average speed (accounts for Hours + Minutes correctly)
SELECT Zone, 
  ROUND(AVG(Distance / (`Duration Hours` + `Duration Minutes`/60)), 2) AS avg_speed_kmh
FROM trainss
WHERE Zone != '?'
GROUP BY Zone
ORDER BY avg_speed_kmh DESC;