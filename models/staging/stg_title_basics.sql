{{ config(materialized='view') }}

SELECT
    tconst as title_id,
    titleType AS title_type,
    primaryTitle AS primary_title,
    originalTitle AS original_title,
    isAdult AS is_adult,
    startYear AS start_year,
    endYear AS end_year,
    runtimeMinutes AS runtime_minutes,
    genres
FROM
    raw_title_basics
