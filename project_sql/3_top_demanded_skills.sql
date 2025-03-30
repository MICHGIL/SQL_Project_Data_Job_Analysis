/*
QUESTION: What are the most in-demand skills for Data Analysts vs Data Scientsits vs Data Engineers?
- Identify the top 5 in-demand skills for Data Analysts/Scientists/Engineers.
- Focus on all job postings in Poland.
*/

-- Data Analyst
SELECT 
    skills AS skill,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim USING(job_id)
INNER JOIN skills_dim USING(skill_id)
WHERE 
    job_country = 'Poland' AND
    job_title_short = 'Data Analyst'
GROUP BY 
    skills
ORDER BY 
    demand_count DESC
LIMIT 5; 

-- Data Scientist
SELECT 
    skills AS skill,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim USING(job_id)
INNER JOIN skills_dim USING(skill_id)
WHERE 
    job_country = 'Poland' AND
    job_title_short = 'Data Scientist'
GROUP BY 
    skills
ORDER BY 
    demand_count DESC
LIMIT 5; 

-- Data Engineer
SELECT 
    skills AS skill,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim USING(job_id)
INNER JOIN skills_dim USING(skill_id)
WHERE 
    job_country = 'Poland' AND
    job_title_short = 'Data Engineer'
GROUP BY 
    skills
ORDER BY 
    demand_count DESC
LIMIT 5; 


-- We could also combine it into one result  
SELECT * FROM (
    SELECT 
        'Data Analyst' AS job_title,
        skills AS skill,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim USING(job_id)
    INNER JOIN skills_dim USING(skill_id)
    WHERE 
        job_country = 'Poland' AND
        job_title_short = 'Data Analyst'
    GROUP BY 
        skills
    ORDER BY 
        demand_count DESC
    LIMIT 5
) AS data_analyst
UNION ALL
SELECT * FROM (
    SELECT 
        'Data Scientist' AS job_title,
        skills AS skill,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim USING(job_id)
    INNER JOIN skills_dim USING(skill_id)
    WHERE 
        job_country = 'Poland' AND
        job_title_short = 'Data Scientist'
    GROUP BY 
        skills
    ORDER BY 
        demand_count DESC
    LIMIT 5
) AS data_scientist
UNION ALL
SELECT * FROM (
    SELECT 
        'Data Engineer' AS job_title,
        skills AS skill,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim USING(job_id)
    INNER JOIN skills_dim USING(skill_id)
    WHERE 
        job_country = 'Poland' AND
        job_title_short = 'Data Engineer'
    GROUP BY 
        skills
    ORDER BY 
        demand_count DESC
    LIMIT 5
) AS data_engineer
