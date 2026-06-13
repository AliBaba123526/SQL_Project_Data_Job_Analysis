/*
Question: What are the top paying Datan Analyst jobs ?
- identify the top 10 highest paying Data Analyst roles that are availavble in the United Kingdom 
- Focus on roles that have a salary range specified in the job listing.(REMOVE NULL VALUES)
-Include Company names for each job listing to provide context on the employers offering these positions.
*/

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
LIMIT 10;

/*
Here is the Breakdown of the top paying Data Analyst jobs in the United Kingdom and the companies offering these positions. The results are ordered by the average yearly salary, with the highest paying roles listed first. This information can help aspiring Data Analysts identify which companies are offering competitive salaries and what job titles to look for in their job search.
- [
  {
    "job_id": 1401033,
    "job_title": "Market Data Lead Analyst",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "180000.0",
    "job_posted_date": "2023-11-10 08:32:22",
    "company_name": "Deutsche Bank"
  },
  {
    "job_id": 1813715,
    "job_title": "Data Architect - Trading and Supply",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "156500.0",
    "job_posted_date": "2023-11-08 19:33:50",
    "company_name": "Shell"
  },
  {
    "job_id": 694461,
    "job_title": "Sr Data Analyst",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-22 08:12:30",
    "company_name": "Hasbro"
  },
  {
    "job_id": 377642,
    "job_title": "Fraud Data Analyst",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time and Part-time",
    "salary_year_avg": "109000.0",
    "job_posted_date": "2023-11-11 23:13:05",
    "company_name": "esure Group"
  },
  {
    "job_id": 1315562,
    "job_title": "Project Data Analyst - Operational Excellence",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "105000.0",
    "job_posted_date": "2023-07-04 12:16:00",
    "company_name": "Syngenta Group"
  },
  {
    "job_id": 150907,
    "job_title": "Senior Scientist, Computational Biology",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89100.0",
    "job_posted_date": "2023-02-06 19:17:32",
    "company_name": "Flagship Pioneering, Inc."
  },
  {
    "job_id": 985232,
    "job_title": "Global IT Data Analytics Solutions Expert",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "86400.0",
    "job_posted_date": "2023-12-15 22:13:28",
    "company_name": "Campari Group"
  },
  {
    "job_id": 227038,
    "job_title": "Data Analyst",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time and Temp work",
    "salary_year_avg": "77017.5",
    "job_posted_date": "2023-12-11 07:47:42",
    "company_name": "Nominet"
  },
  {
    "job_id": 1059513,
    "job_title": "Data Analyst - Customer Services",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "75550.0",
    "job_posted_date": "2023-12-05 15:13:29",
    "company_name": "Informa Group Plc."
  },
  {
    "job_id": 453109,
    "job_title": "Global Mobility Data Analyst",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-20 12:12:25",
    "company_name": "CHANEL"
  }
]

QUICK INSIGHTS: 
- The highest paying Data Analyst role is the Market Data Lead Analyst at Deutsche Bank, with an average yearly salary of £180,000.
- Shell offers a Data Architect position with an average salary of £156,500, which is also a high-paying role in the data analysis field.
- The salaries for Data Analyst roles in the United Kingdom vary significantly, with the lowest in the top 10 being around £75,067.5 for a Global Mobility Data Analyst at CHANEL. 
*/
