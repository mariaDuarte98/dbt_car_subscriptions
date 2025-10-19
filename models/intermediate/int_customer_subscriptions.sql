SELECT
    s.subscription_id,
    s.customer_id,
    s.car_id,
    s.subscription_creation_date,
    s.subscription_start_date,
    strftime(s.subscription_start_date, '%Y-W%W') as subscription_start_week_id,
    s.subscription_start_date + s.term_month * INTERVAL '1 MONTH' AS subscription_end_date,
    s.term_month,
    s.monthly_rate,
    c.customer_type,
    c.address_city,  
    car.brand,     
    car.model,
    car.engine_type,
    car.infleet_date,
    car.defleet_date,
    (s.monthly_rate * s.term_month) AS expected_total_subscription_value
    
FROM {{ ref('stg_subscriptions') }} AS s
LEFT JOIN {{ ref('stg_customers') }} AS c
    ON s.customer_id = c.customer_id
LEFT JOIN {{ ref('stg_cars') }} AS car
    ON s.car_id = car.car_id