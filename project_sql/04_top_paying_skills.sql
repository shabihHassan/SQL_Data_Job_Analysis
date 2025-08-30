SELECT 
    skills,
    Round(AVG(salary_year_avg), 0) as avg_salary

FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where
job_title_short = 'Data Analyst'
AND salary_year_avg is not NULL
AND job_work_from_home = 'True'
GROUP BY skills
ORDER BY 
avg_salary DESC
LIMIT 25;

/*
Big Data + ML drive the highest salaries – Tools like PySpark, Databricks, Airflow, and Scikit-learn show that handling large-scale data and applying ML skills is most rewarded.

Programming + Cloud/DevOps crossover is essential – Python libraries (Pandas, NumPy, Jupyter), Golang, plus cloud/infra tools (Kubernetes, Linux, GCP) push analysts into hybrid analyst–engineer roles with higher pay.

Collaboration & niche tools boost value – Skills in GitLab, Bitbucket, Watson, DataRobot, and even workflow tools (Atlassian, Notion) show companies pay extra for analysts who integrate seamlessly into modern, software-driven teams.
*/

