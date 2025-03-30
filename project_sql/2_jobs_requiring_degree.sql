/*
QUESTION: What are the positions that require a degree most often? 
*/

-- Only jobs in Poland 
SELECT 
    job_title_short AS position,
    ROUND(AVG(CASE WHEN job_no_degree_mention = TRUE THEN 0
            WHEN job_no_degree_mention = FALSE THEN 1
            END), 2) AS degree_required_pct 
FROM 
    job_postings_fact
WHERE job_country = 'Poland'
GROUP BY position
ORDER BY degree_required_pct DESC;

-- Jobs all over the world
SELECT 
    job_title_short AS position,
    ROUND(AVG(CASE WHEN job_no_degree_mention = TRUE THEN 0
            WHEN job_no_degree_mention = FALSE THEN 1
            END), 2) AS degree_required_pct 
FROM 
    job_postings_fact
GROUP BY position
ORDER BY degree_required_pct DESC