SELECT 
    customer_id,
    UPPER(TRIM(country)) AS country_clean,
    CASE 
        WHEN UPPER(TRIM(country)) IN ('USA', 'UNITED STATES', 'U.S.A.', 'US') 
            THEN 'USA'
        WHEN UPPER(TRIM(country)) IN ('UK', 'UNITED KINGDOM', 'GREAT BRITAIN') 
            THEN 'UK'
        WHEN UPPER(TRIM(country)) IN ('UAE', 'UNITED ARAB EMIRATES') 
            THEN 'UAE'
        ELSE UPPER(TRIM(country))
    END AS country_standardized
FROM customers;

