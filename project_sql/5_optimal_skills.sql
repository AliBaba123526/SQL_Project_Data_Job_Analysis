/*
-Answer: what are the Optimal skills for a Data Analyst to Learn(its in high demand and its top paying)
- Concentrate on United kingdom data analyst jobs , and salaries specified
*/



WITH skills_demand AS ( 
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count

    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst' AND job_location = 'United Kingdom' AND salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id
    
), average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        
        ROUND(AVG(salary_year_avg), 0) AS average_salary

    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL AND job_location = 'United Kingdom'
    GROUP BY skills_job_dim.skill_id

)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    average_salary
FROM
    skills_demand
    INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id

ORDER BY
    demand_count DESC,
    average_salary DESC


/*
Here is the Breajdown of the optimal skills for a Data Analyst in the United Kingdom based on demand and average salary:

[
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "11",
    "average_salary": "82494"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "8",
    "average_salary": "83968"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "8",
    "average_salary": "65818"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "5",
    "average_salary": "78428"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "3",
    "average_salary": "74563"
  },
  {
    "skill_id": 198,
    "skills": "outlook",
    "demand_count": "3",
    "average_salary": "46171"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": "3",
    "average_salary": "46171"
  },
  {
    "skill_id": 141,
    "skills": "express",
    "demand_count": "2",
    "average_salary": "104757"
  },
  {
    "skill_id": 102,
    "skills": "jupyter",
    "demand_count": "2",
    "average_salary": "103620"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "2",
    "average_salary": "81709"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "2",
    "average_salary": "77635"
  },
  {
    "skill_id": 6,
    "skills": "shell",
    "demand_count": "1",
    "average_salary": "156500"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "demand_count": "1",
    "average_salary": "156500"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "1",
    "average_salary": "118140"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "1",
    "average_salary": "109000"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "1",
    "average_salary": "109000"
  },
  {
    "skill_id": 252,
    "skills": "unify",
    "demand_count": "1",
    "average_salary": "89100"
  },
  {
    "skill_id": 210,
    "skills": "git",
    "demand_count": "1",
    "average_salary": "89100"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "1",
    "average_salary": "86400"
  },
  {
    "skill_id": 189,
    "skills": "sap",
    "demand_count": "1",
    "average_salary": "86400"
  },
  {
    "skill_id": 75,
    "skills": "databricks",
    "demand_count": "1",
    "average_salary": "86400"
  },
  {
    "skill_id": 238,
    "skills": "notion",
    "demand_count": "1",
    "average_salary": "75550"
  },
  {
    "skill_id": 22,
    "skills": "vba",
    "demand_count": "1",
    "average_salary": "75550"
  },
  {
    "skill_id": 17,
    "skills": "typescript",
    "demand_count": "1",
    "average_salary": "75550"
  },
  {
    "skill_id": 192,
    "skills": "sheets",
    "demand_count": "1",
    "average_salary": "72900"
  },
  {
    "skill_id": 169,
    "skills": "linux",
    "demand_count": "1",
    "average_salary": "53014"
  },
  {
    "skill_id": 226,
    "skills": "terminal",
    "demand_count": "1",
    "average_salary": "53014"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "1",
    "average_salary": "53014"
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "demand_count": "1",
    "average_salary": "53014"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "1",
    "average_salary": "30000"
  }
]

Insights:
1. The most in-demand skills for Data Analysts in the United Kingdom are Excel, Python, and SQL, with Excel having the highest demand count of 11 job postings.
2. Python has the highest average salary of £83,968 among the top demanded skills, indicating that proficiency in Python can lead to better-paying opportunities.
3. Other valuable skills include Tableau and Power BI, which are also in demand and offer competitive salaries.

What i did: To identify the optimal skills for Data Analyst roles in the United Kingdom, I queried the job_postings_fact table to filter for job titles containing 'Data Analyst' and locations within the United Kingdom. I ensured that only listings with specified salary ranges were included by excluding NULL values in the salary_year_avg column. The results were then ordered by average yearly salary in descending order, and I limited the output to the top 25 highest paying skills. Additionally, I joined with the skills_job_dim and skills_dim tables to include skill names for context on the technical requirements of these positions.
-- This query highlights the high-paying technical skills in demand for Data Analyst roles within the United Kingdom.