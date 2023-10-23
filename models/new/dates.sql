{{ config(materialized='incremental', unique_key = 'D_DATE') }}

SELECT *
FROM SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.DATE_DIM
WHERE D_DATE <= CURRENT_DATE


{% if is_incremental() %}
    AND D_DATE > (SELECT MAX(D_DATE) FROM {{ this }})
{% endif %}
