/*
Question: What skills are required for the top paying Data Analyst jobs in the United Kingdom?
-use the top 10 highest paying Data Analyst roles identified
- Add the specific skills required for each of these top paying Data Analyst jobs to provide insights into the qualifications and expertise needed for these roles.
*/


WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        job_location,
        job_schedule_type,
        salary_year_avg,
        job_posted_date,
        name AS company_name
    FROM
        job_postings_fact 
    LEFT JOIN
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location LIKE '%United Kingdom%' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
limit 10;

/*
Here is breakdown of What skills are required for the top paying Data Analyst jobs in the United Kingdom

[
  {
    "job_id": 1401033,
    "job_title": "Market Data Lead Analyst",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "180000.0",
    "job_posted_date": "2023-11-10 08:32:22",
    "company_name": "Deutsche Bank",
    "skills": "excel"
  },
  {
    "job_id": 1813715,
    "job_title": "Data Architect - Trading and Supply",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "156500.0",
    "job_posted_date": "2023-11-08 19:33:50",
    "company_name": "Shell",
    "skills": "shell"
  },
  {
    "job_id": 1813715,
    "job_title": "Data Architect - Trading and Supply",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "156500.0",
    "job_posted_date": "2023-11-08 19:33:50",
    "company_name": "Shell",
    "skills": "express"
  },
  {
    "job_id": 1813715,
    "job_title": "Data Architect - Trading and Supply",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "156500.0",
    "job_posted_date": "2023-11-08 19:33:50",
    "company_name": "Shell",
    "skills": "excel"
  },
  {
    "job_id": 1813715,
    "job_title": "Data Architect - Trading and Supply",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "156500.0",
    "job_posted_date": "2023-11-08 19:33:50",
    "company_name": "Shell",
    "skills": "flow"
  },
  {
    "job_id": 694461,
    "job_title": "Sr Data Analyst",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-22 08:12:30",
    "company_name": "Hasbro",
    "skills": "sql"
  },
  {
    "job_id": 694461,
    "job_title": "Sr Data Analyst",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-22 08:12:30",
    "company_name": "Hasbro",
    "skills": "python"
  },
  {
    "job_id": 694461,
    "job_title": "Sr Data Analyst",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-22 08:12:30",
    "company_name": "Hasbro",
    "skills": "jupyter"
  },
  {
    "job_id": 694461,
    "job_title": "Sr Data Analyst",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-22 08:12:30",
    "company_name": "Hasbro",
    "skills": "tableau"
  },
  {
    "job_id": 694461,
    "job_title": "Sr Data Analyst",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-22 08:12:30",
    "company_name": "Hasbro",
    "skills": "power bi"
  }
]

INSIGHTS:
1. The top paying Data Analyst jobs in the United Kingdom require a combination of technical skills, with Excel, Shell, Express, Flow, SQL, Python, Jupyter, Tableau, and Power BI being among the most frequently mentioned skills in these high-paying roles.
2. Excel is a common skill across multiple top-paying jobs, indicating its importance for data analysis tasks, such as data manipulation and visualization.
3. Shell and Express are also notable skills for high-paying Data Analyst roles, particularly in the context of data architecture and trading/supply chain analysis, suggesting that knowledge of these tools can be advantageous for certain specialized positions.
4. SQL and Python are essential skills for Data Analysts, as they are widely used for data querying, analysis, and automation. Proficiency in these languages can significantly enhance a Data Analyst's ability to work with large datasets and perform complex analyses.
5. Jupyter, Tableau, and Power BI are important for data visualization and reporting, which are critical components of a Data Analyst's role in communicating insights effectively to stakeholders. Mastery of these tools can help Data Analysts create compelling visualizations and dashboards that drive informed decision-making.