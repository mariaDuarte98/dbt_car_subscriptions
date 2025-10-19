
SELECT
    id AS customer_id, 
    COALESCE(first_name, 'Unknown') as first_name,  -- bringng all in case analysit need to check specific customer data
    COALESCE(second_name, 'Unknown') as second_name,
    type AS customer_type, 
    COALESCE(company_name, 'N/A - Private Customer') as company_name,
    address_city,
    address_zip,
    address_street,
    address_street_house
FROM {{ source('car_subscriptions', 'customers') }}
