SELECT 
    sum(CASE WHEN id IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS total_nulls
FROM {{ ref('my_first_dbt_model') }}

HAVING SUM(CASE WHEN ID IS NULL THEN 1 ELSE 0 END) / COUNT(*) > .1

