{{ config(materialized='incremental', unique_key='T_TIME')}}

SELECT *
FROM SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.TIME_DIM
WHERE TO_TIME(CONCAT(T_HOUR::VARCHAR, ':', T_MINUTE, ':', T_SECOND)) <= CURRENT_TIME


{% if is_incremental() %}
    AND T_TIME > (SELECT MAX(T_TIME) FROM {{ this }})
{% endif %}