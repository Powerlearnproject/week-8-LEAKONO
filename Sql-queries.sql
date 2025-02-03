-- Query to find total water usage per region
SELECT r.name, SUM(w.amount_used) AS total_usage
FROM Regions r
JOIN Water_Usage w ON r.id = w.region_id
GROUP BY r.name;

-- Query to compare available vs used water in each region
SELECT r.name, wr.amount_available, SUM(w.amount_used) AS total_usage
FROM Regions r
JOIN Water_Usage w ON r.id = w.region_id
JOIN Water_Resources wr ON r.id = wr.region_id
GROUP BY r.name, wr.amount_available;

-- Query to find regions with poor water access
SELECT r.name
FROM Regions r
JOIN Water_Access wa ON r.id = wa.region_id
WHERE wa.access_type = 'Poor';
