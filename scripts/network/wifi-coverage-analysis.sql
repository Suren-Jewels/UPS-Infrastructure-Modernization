-- Wi‑Fi Coverage Analysis (Sanitized)
-- Part of the UPS Modernization Wi‑Fi Expansion Program
-- Full implementation omitted due to UPS confidentiality policies.

-- This query identifies logistics zones with low Wi‑Fi coverage scores.
-- Used for RF planning, AP placement, and coverage remediation.

SELECT 
    zone_id,
    coverage_score,
    last_survey_timestamp
FROM wifi_metrics
WHERE coverage_score < 70
ORDER BY coverage_score ASC;
