-- 🧮 Total number of trips per bike type
SELECT rideable_type, COUNT(*) AS total_trips
FROM fact_trip
GROUP BY rideable_type;

-- 🚲 Number of unique riders per bike type
SELECT rideable_type, COUNT(DISTINCT rider_id) AS unique_riders
FROM fact_trip
GROUP BY rideable_type;

-- 📍 Top 5 start stations by trip count
SELECT start_station_id, COUNT(*) AS trip_count
FROM fact_trip
GROUP BY start_station_id
ORDER BY trip_count DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

-- 📅 Monthly trip count trend
SELECT FORMAT(TRY_CAST(start_at AS datetime), 'yyyy-MM') AS trip_month, COUNT(*) AS total_trips
FROM dbo.fact_trip
GROUP BY FORMAT(TRY_CAST(start_at AS datetime), 'yyyy-MM')
ORDER BY trip_month;
