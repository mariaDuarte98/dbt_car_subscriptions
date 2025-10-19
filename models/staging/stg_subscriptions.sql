SELECT
    id AS subscription_id,
    customer_id,
    car_id,
    created_at as subscription_creation_date, 
    start_date as subscription_start_date,
    COALESCE(m.term_int, try_cast(term_month as integer)) as term_month,
    COALESCE(monthly_rate, 0) AS monthly_rate 

FROM {{ source('car_subscriptions', 'subscriptions') }}
left join {{ ref('term_month_mapping') }} m
    on term_month = m.term_text
