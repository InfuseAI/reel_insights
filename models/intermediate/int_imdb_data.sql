{{ config(materialized='table') }}

SELECT
    basics.title_id as title_id,
    primary_title,
    original_title,
    start_year,
    runtime_minutes,
    genres,
    average_rating,
    num_votes
FROM
    {{ ref('stg_title_ratings') }} AS ratings
JOIN
    {{ ref('stg_title_basics') }} AS basics
ON
    ratings.title_id = basics.title_id
