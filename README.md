# 👋 Introduction
Curious about the data job market in Poland? Dive into my analysis, inspired by Luke Barousse's [SQL for Data Analytics](https://youtu.be/7mz73uXD9DA?si=npJ2uC45uqxOFUii) course. 

The dataset used for the analysis comes from the course and includes job titles, salaries, locations, and essential skills – offering a real-world snapshot of the data job landscape as of 2023.

Check out my SQL queries here: [project_sql folder](/project_sql/)


# 🛠 Tools I Used
- **SQL** | the main tool that I used for quering and analyzing data
- **PostgreSQL** | the chosen database management system 
- **Visual Studio Code** | my go-to code editor/IDE (choose your fighter 😉) for writing and running SQL queries    
  
  
# 🔍 Insights

### 1. What are the most in-demand data jobs in Poland?

```sql
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
```

### 2. What are the positions that require a degree most often? 

```sql
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
```

### 3. What are the most in-demand skills for Data Analysts vs Data Scientists vs Data Engineers?

```sql
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

```


# 📚 What I Learned

This project allowed me to practice and implement some of the core SQL concepts, including:
- Creating tables and defining schema
- Importing data from a CSV file into a PostgreSQL database
- Filtering and sorting data using `WHERE`, `ORDER BY`, and `LIMIT`
- Aggregating data using `GROUP BY`, `COUNT`, `AVG`, etc. 
- Joining tables with different types of `JOIN` operations
- Using `CASE` expressions to implement conditional logic in queries

