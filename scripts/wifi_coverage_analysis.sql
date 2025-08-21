-- SQL snippet to analyze Wi-Fi coverage across logistics zones
-- Sanitized for confidentiality

SELECT zone_id, coverage_score
FROM wifi_metrics
WHERE coverage_score < 70
ORDER BY coverage_score ASC;
