/*
QUESTION: What are the most in-demand data-related positions in Poland? 
*/

SELECT
    job_title_short AS position,
    COUNT(job_id) AS job_posting_count
FROM 
    job_postings_fact
WHERE 
    job_location = 'Poland'
GROUP BY
    position
ORDER BY 
    job_posting_count DESC 