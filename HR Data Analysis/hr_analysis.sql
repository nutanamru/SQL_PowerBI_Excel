create database HR_ANALYSIS;
USE HR_ANALYSIS;
-- Check data types and missing values
SELECT *
FROM hr_analysis.`employee attrition`
LIMIT 99;

-- Statistical summaries
SELECT 
    AVG(satisfaction_level) AS avg_satisfaction_level,
    AVG(last_evaluation) AS avg_last_evaluation,
    AVG(number_project) AS avg_number_project,
    AVG(average_montly_hours) AS avg_monthly_hours,
    AVG(time_spend_company) AS avg_time_spend_company,
    AVG(Work_accident) AS avg_work_accident,
    AVG(promotion_last_5years) AS avg_promotion_last_5years
FROM hr_analysis.`employee attrition`;

#--1. Determine factors affecting salary differences
SELECT 
    dept,
    AVG(satisfaction_level) AS avg_satisfaction_level,
    AVG(last_evaluation) AS avg_last_evaluation,
    AVG(number_project) AS avg_number_project,
    AVG(average_montly_hours) AS avg_monthly_hours,
    AVG(time_spend_company) AS avg_time_spend_company,
    AVG(Work_accident) AS avg_work_accident,
    AVG(promotion_last_5years) AS avg_promotion_last_5years
FROM hr_ANALYSIS.`employee attrition`
GROUP BY dept;
# -- 1. Which three departments had the highest satisfaction scores, and which three had the lowest satisfaction scores?

SELECT
	dept,
round(avg(satisfaction_level),2) as avg_satisfaction
FROM hr_ANALYSIS.`employee attrition`
Group by 1
Order by 2 desc;

#--2. Plot a necessary graph that you think it will aid in understanding the data
-- For example, let's plot a bar chart for average satisfaction level by department
SELECT 
    dept,
    AVG(satisfaction_level) AS avg_satisfaction_level
FROM hr_analysis.`employee attrition`
GROUP BY dept;

#-- 2. What is the relationship between salary and satisfaction score?
Select
	distinct salary
FROM hr_analysis.`employee attrition`;

# -- 'low'
# -- 'medium'
# -- 'high'
#---3.gives proper numerical value for high,low and medium salary counts
Select
	salary,
    round(avg(satisfaction_level),5) as avg_satisfaction
FROM hr_analysis.`employee attrition`
group by 1
order by 2;

# -- 3. How did the top two and bottom two depts perform in the following arears
# -- 'support'
# -- 'management' top_dept

# -- 'hr'
# -- 'accounting' lower_dept
# -- a. last_evaluation

# -- b. number_project

# -- c. average_montly_hours

# -- d. time_spend_company
Select
    Case
     when dept in ('support', 'management') then 'top_dept'
     when dept in ('hr', 'accounting') then 'lower_dept'
	end as top_bot,
    round(avg(last_evaluation),2) as avg_last_evaluation,
    round(avg(number_project),1) as avg_projects,
    avg(average_montly_hours) as hours_worked,
    avg(time_spend_company) as time_at_company
FROM hr_analysis.`employee attrition`
where dept in ('support', 'management','hr', 'accounting')
group by 1
;

-- Use a boxplot to detect outliers
-- Depending on your SQL database, you may need to use a different method or tool to generate a boxplot
-- Here's a query to identify potential outliers in average monthly hours
SELECT 
    dept,
    average_montly_hours
FROM hr_analysis.`employee attrition`;

#ADVANCED QUERIES OF HR ANLYSIS
#1---Turnover Rate by Department:
SELECT 
    dept,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN left_company = 1 THEN 1 ELSE 0 END) AS employees_left,
    ROUND((SUM(CASE WHEN left_company = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS turnover_rate
FROM hr_analysis.`employee attrition`
GROUP BY dept;

#2--Average Job Satisfaction Level by Department:
SELECT 
    dept,
    ROUND(AVG(satisfaction_level), 2) AS avg_satisfaction_level
FROM hr_analysis.`employee attrition`
GROUP BY dept;

#3--Distribution of Promotions in the Last 5 Years:
SELECT 
    promotion_last_5years,
    COUNT(*) AS num_employees
FROM hr_analysis.`employee attrition`
GROUP BY promotion_last_5years;

#4--Average Monthly Hours Worked by Department:
SELECT 
    dept,
    ROUND(AVG(average_montly_hours), 2) AS avg_monthly_hours
FROM hr_analysis.`employee attrition`
GROUP BY dept;
#5--Employee Tenure Distribution:
SELECT 
    time_spend_company,
    COUNT(*) AS num_employees
FROM hr_analysis.`employee attrition`
GROUP BY time_spend_company;

#6--Relationship Between Last Evaluation Score and Satisfaction Level:
SELECT 
    last_evaluation,
    AVG(satisfaction_level) AS avg_satisfaction_level
FROM hr_analysis.`employee attrition`
GROUP BY last_evaluation;

#7--Average Number of Projects by Department:
SELECT 
    dept,
    ROUND(AVG(number_project), 2) AS avg_num_projects
FROM hr_analysis.`employee attrition`
GROUP BY dept;

#8--Work Accident Rates by Department:
SELECT 
    dept,
    ROUND(AVG(Work_accident), 2) AS avg_work_accident_rate
FROM hr_analysis.`employee attrition`
GROUP BY dept;

#9--Average Evaluation Score by Department:
SELECT 
    dept,
    ROUND(AVG(last_evaluation), 2) AS avg_last_evaluation
FROM hr_analysis.`employee attrition`
GROUP BY dept;

#10--Comparison of Satisfaction Levels between Employees Who Left and Those Who Stayed:error
SELECT 
    CASE WHEN left_company = 1 THEN 'Left' ELSE 'Stayed' END AS employment_status,
    ROUND(AVG(satisfaction_level), 2) AS avg_satisfaction_level
FROM hr_analysis.`employee attrition`
GROUP BY CASE WHEN left_company = 1 THEN 'Left' ELSE 'Stayed' END;



#11--#Average Satisfaction Level of Employees Who Had a Work Accident:
SELECT 
    CASE WHEN Work_accident = 1 THEN 'Had Accident' ELSE 'No Accident' END AS accident_status,
    ROUND(AVG(satisfaction_level), 2) AS avg_satisfaction_level
FROM hr_analysis.`employee attrition`
GROUP BY accident_status;

#12--Average Monthly Hours Worked by Employees Who Left and Those Who Stayed:error
SELECT 
    CASE WHEN left_company = 1 THEN 'Left' ELSE 'Stayed' END AS employment_status,
    ROUND(AVG(average_montly_hours), 2) AS avg_monthly_hours
FROM hr_analysis.`employee attrition`
GROUP BY employment_status;

#13--Promotion Rate by Department:
SELECT 
    dept,
    SUM(promotion_last_5years) AS total_promotions,
    COUNT(*) AS total_employees,
    ROUND((SUM(promotion_last_5years) / COUNT(*)) * 100, 2) AS promotion_rate
FROM hr_analysis.`employee attrition`
GROUP BY dept;

#14--Average Satisfaction Level by Employee Tenure:
SELECT 
    time_spend_company,
    ROUND(AVG(satisfaction_level), 2) AS avg_satisfaction_level
FROM hr_analysis.`employee attrition`
GROUP BY time_spend_company;
#15--Comparison of Evaluation Scores between Employees Who Left and Those Who Stayed:error
SELECT 
    CASE WHEN left_company = 1 THEN 'Left' ELSE 'Stayed' END AS employment_status,
    ROUND(AVG(last_evaluation), 2) AS avg_last_evaluation
FROM hr_analysis.employee_attrition -- Removed space in table name
GROUP BY employment_status;


#16--Average Number of Projects by Tenure:
SELECT 
    time_spend_company,
    ROUND(AVG(number_project), 2) AS avg_num_projects
FROM hr_analysis.`employee attrition`
GROUP BY time_spend_company;
#17--Distribution of Employees by Salary Level:
SELECT 
    salary,
    COUNT(*) AS num_employees
FROM hr_analysis.`employee attrition`
GROUP BY salary;
#18--
SELECT 
    dept,
    ROUND(AVG(satisfaction_level), 2) AS avg_satisfaction_level
FROM hr_analysis.`employee attrition`
GROUP BY dept
ORDER BY avg_satisfaction_level DESC;
#19--Average Satisfaction Level of Employees with and without Promotions:
SELECT 
    CASE WHEN promotion_last_5years = 1 THEN 'Promoted' ELSE 'No Promotion' END AS promotion_status,
    ROUND(AVG(satisfaction_level), 2) AS avg_satisfaction_level
FROM hr_analysis.`employee attrition`
GROUP BY promotion_status;

 #20--Comparison of Satisfaction Levels between Promoted and Non-Promoted Employees by Department:
 SELECT 
    dept,
    CASE WHEN promotion_last_5years = 1 THEN 'Promoted' ELSE 'No Promotion' END AS promotion_status,
    ROUND(AVG(satisfaction_level), 2) AS avg_satisfaction_level
FROM hr_analysis.`employee attrition`
GROUP BY dept, promotion_status;


