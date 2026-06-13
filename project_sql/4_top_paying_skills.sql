-- questions: what are the top skills based on salary 
-- Look at the average salary associated with each skill for data analsyt roles
-- focuses on roles with specified salaries, regardless of location. 

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary

FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL AND job_location = 'United Kingdom'
GROUP BY skills
ORDER BY average_salary DESC

LIMIT 25;

/*

- Here is the break down of the top paying skills for Data Analyst roles in the United Kingdom, based on average salary data. The skills listed below are associated with higher-paying positions, indicating their value in the job market.

[
  {
    "skills": "shell",
    "average_salary": "156500"
  },
  {
    "skills": "flow",
    "average_salary": "156500"
  },
  {
    "skills": "looker",
    "average_salary": "118140"
  },
  {
    "skills": "sas",
    "average_salary": "109000"
  },
  {
    "skills": "express",
    "average_salary": "104757"
  },
  {
    "skills": "jupyter",
    "average_salary": "103620"
  },
  {
    "skills": "unify",
    "average_salary": "89100"
  },
  {
    "skills": "git",
    "average_salary": "89100"
  },
  {
    "skills": "sap",
    "average_salary": "86400"
  },
  {
    "skills": "azure",
    "average_salary": "86400"
  },
  {
    "skills": "databricks",
    "average_salary": "86400"
  },
  {
    "skills": "python",
    "average_salary": "83968"
  },
  {
    "skills": "excel",
    "average_salary": "82494"
  },
  {
    "skills": "r",
    "average_salary": "81709"
  },
  {
    "skills": "tableau",
    "average_salary": "78428"
  },
  {
    "skills": "go",
    "average_salary": "77635"
  },
  {
    "skills": "notion",
    "average_salary": "75550"
  },
  {
    "skills": "vba",
    "average_salary": "75550"
  },
  {
    "skills": "typescript",
    "average_salary": "75550"
  },
  {
    "skills": "power bi",
    "average_salary": "74563"
  },
  {
    "skills": "sheets",
    "average_salary": "72900"
  },
  {
    "skills": "sql",
    "average_salary": "65818"
  },
  {
    "skills": "terminal",
    "average_salary": "53014"
  },
  {
    "skills": "linux",
    "average_salary": "53014"
  },
  {
    "skills": "jira",
    "average_salary": "53014"
  }
]
INSIGHTS:

-Higher-paying data analyst roles are becoming more technical, with skills like Shell, Git, Azure, Databricks, Python, Linux, and Terminal showing strong salary potential.
BI and visualisation tools remain highly valued, with Looker, Tableau, and Power BI appearing in the top-paying skills, showing demand for analysts who can turn data into clear business insights.
SQL and Excel are still important foundations, but the highest salaries appear when they are combined with programming, cloud platforms, automation, and advanced analytics tools.
*/