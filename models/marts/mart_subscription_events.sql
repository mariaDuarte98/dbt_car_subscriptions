SELECT
    subscription_id,
    customer_id,
    car_id,
    customer_type,
    brand,
    term_month,
    address_city,
    subscription_start_date,
    subscription_start_week_id,
    subscription_end_date,
    expected_total_subscription_value
    
FROM {{ ref('int_customer_subscriptions') }}



