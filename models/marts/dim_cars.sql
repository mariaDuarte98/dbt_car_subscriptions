SELECT
    car_id,
    brand,
    model,
    engine_type,
    infleet_date,
    defleet_date,
    ---COUNT(subscription_id) AS total_subscriptions,
    ---COUNT(DISTINCT customer_id) AS total_unique_customers,
    ---SUM(term_month) AS total_rental_months,
    SUM(term_month * monthly_rate) AS total_revenue_expected
    
FROM {{ ref('int_customer_subscriptions') }}
GROUP BY 1, 2, 3, 4, 5, 6


