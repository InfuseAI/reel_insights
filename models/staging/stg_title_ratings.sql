{{ config(materialized='view') }}

SELECT
    tconst as title_id,
    averageRating AS average_rating,
    numVotes AS num_votes
FROM
    raw_title_ratings
