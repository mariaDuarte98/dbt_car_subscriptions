SELECT
    id AS car_id,
    vin AS car_vin_number, 
    brand,
    model,
    engine_type,
    license_plate,
    registration_date as infleet_date,
    COALESCE(deregistration_date, TIMESTAMP '9999-12-31') as defleet_date, -- replace null with future date
FROM {{ source('car_subscriptions', 'cars') }}
