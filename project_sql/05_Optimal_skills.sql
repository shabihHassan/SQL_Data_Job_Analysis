SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.job_id) as demand_count,
    Round(AVG(salary_year_avg), 0) as average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where
job_title_short = 'Data Analyst' 
AND salary_year_avg is not NULL
AND job_work_from_home = 'True'
GROUP BY 
    skills_dim.skill_id
HAVING 
      count(skills_job_dim.job_id) > 10

order by 
    demand_count DESC,
    average_salary DESC

    LIMIT 25;