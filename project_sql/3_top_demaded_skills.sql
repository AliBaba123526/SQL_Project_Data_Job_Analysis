--Question: What are the most in-demand skills for Data Analyst jobs ?
--Identify the top 5 in demand skills for a data analyst in UK 

--Focus on all job postings 


SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count

FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND job_location = 'United Kingdom'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;

/*

Here is the Breakdown of the top demanded skills for Data Analyst roles in the United Kingdom, based on the number of job postings that require each skill. The skills listed below are associated with a higher demand in the job market, indicating their importance for aspiring Data Analysts.

[
  {
    "skills": "sql",
    "demand_count": "867"
  },
  {
    "skills": "excel",
    "demand_count": "776"
  },
  {
    "skills": "power bi",
    "demand_count": "557"
  },
  {
    "skills": "python",
    "demand_count": "455"
  },
  {
    "skills": "tableau",
    "demand_count": "361"
  }
]

INSIGHTS:
1. SQL is the most in-demand skill for Data Analysts in the UK, with 867 job postings requiring it. This highlights the importance of SQL for data manipulation and querying in the field.
2. Excel is also highly sought after, with 776 job postings mentioning it. This indicates that proficiency in Excel is essential for data analysis tasks, such as data cleaning and visualization.
3. Power BI, Python, and Tableau are also in high demand, with 557, 455, and 361 job postings respectively. These skills are crucial for data visualization, analysis, and reporting, making them valuable for Data Analysts to learn.
4. Aspiring Data Analysts should consider focusing on these top skills to enhance their employability and meet the demands of the job market in the United Kingdom.