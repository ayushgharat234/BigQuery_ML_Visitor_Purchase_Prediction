-- Select relevant columns from the Google Analytics sample dataset
-- This query extracts the following fields:
-- 1. `label`: Whether a transaction occurred (1 if it did, 0 otherwise).
-- 2. `os`: The operating system of the visitor's device.
-- 3. `is_mobile`: A boolean indicating if the device is mobile.
-- 4. `country`: The country/region of the visitor.
-- 5. `pageviews`: The number of pageviews during the session.

SELECT
  -- Label for transaction: 1 if a transaction occurred, otherwise 0
  IF(totals.transactions IS NULL, 0, 1) AS label,
  
  -- Visitor's device operating system
  IFNULL(device.operatingSystem, "") AS os,
  
  -- Whether the device is mobile (TRUE or FALSE)
  device.isMobile AS is_mobile,
  
  -- Visitor's country or region
  IFNULL(geoNetwork.country, "") AS country,
  
  -- Number of page views in the session, default to 0 if missing
  IFNULL(totals.pageviews, 0) AS pageviews
FROM
  -- Access the Google Analytics sample dataset available publicly
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  -- Limit data to sessions between 1 August 2016 and 31 June 2017
  _TABLE_SUFFIX BETWEEN '20160801' AND '20170631'
LIMIT 10000; -- Restrict to 10,000 rows for efficiency