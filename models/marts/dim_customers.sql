SELECT
    customer_id,
    customer_type,
    CAST(COUNT(subscription_id) AS INTEGER) AS total_subscriptions_count,
    CAST(COUNT(DISTINCT car_id) AS INTEGER) AS total_unique_cars_subscribed,
    SUM(expected_total_subscription_value) AS estimated_customer_lifetime_value, 
    MIN(subscription_start_date) AS first_subscription_date
FROM {{ ref('int_customer_subscriptions') }}
GROUP BY 1, 2