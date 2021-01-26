# Pewlett-Hackard-Analysis

## Technical Report

### Initial Problem:
The goal of this project was to address 2 major issues:
1)	Pewlett-Hackard had massive amounts of employee data stored in CSV files. There was no easy way to store, access, and reference this data. This prevented the company from efficiently extracting meaningful information about their employees.
2)	Pewlett-Hackard was aware that a large amount of their employees were nearing retirement age, but they had no way of easily determining what those exact numbers were and how much of an impact this wave of retirements would have on the company. This degree of uncertainty was a detriment to Pewlett-Hackard and could potentially cause a large scale negative impact, on the functioning of the company, if not addressed.


### Resolution Steps:
To address these issues, the following steps were taken:
1)	SQL tables were created for each one of the CSV files. This allowed all of the employee data to be easily stored in a relational database for easy reference. Below is the ERD for the database structure that was created for Pewlett-Hackard:

![EmployeeDB](https://github.com/Waking-Dreamer/Pewlett-Hackard-Analysis/blob/master/Images/EmployeeDB.png)

An example of the SQL queries used to create these tables can be seen below:

![schema](https://github.com/Waking-Dreamer/Pewlett-Hackard-Analysis/blob/master/Images/schema.png)

This was a fairly straight forward process and no issues were encountered in the creation of the tables. All of the SQL queries used to create the tables can be found in the schema.sql file located [Here](https://github.com/Waking-Dreamer/Pewlett-Hackard-Analysis/tree/master/Queries/schema.sql)


2A) Additional queries were ran that allowed us to view all employees that were of retirement age based upon the specified birth date criteria. The Emp_info_retire table was created using the below code:

![emp_info_retire](https://github.com/Waking-Dreamer/Pewlett-Hackard-Analysis/blob/master/Images/emp_info_retire.png)

One issue that arose was that the emp_info_retire table contained duplicates rows for several employees. Some employees had different job titles over the years and this table showed old titles for employees. To fix this issue, partitioning was used to clean up the data and create a new table that only displayed each employee’s current job title. The query used to complete this can be seen below:

![emp_info_retire_clean](https://github.com/Waking-Dreamer/Pewlett-Hackard-Analysis/blob/master/Images/emp_info_retire_clean.png)

The count function was then used on the new emp_info_retire_clean table to give us a total number of employees, with each title, that would be retiring in the near future. The below query was used to complete this:

![emp_info_retire_clean_group](https://github.com/Waking-Dreamer/Pewlett-Hackard-Analysis/blob/master/Images/emp_info_retire_clean_group.png)

2B) With so many employees retiring in the near future, another question that arose was, how many employees are available to train and fill these roles that will soon be empty? To answer this, another query was run to show employees who meet mentorship eligibility based upon birth date. The query looked like:

![mentorship_eligibility](https://github.com/Waking-Dreamer/Pewlett-Hackard-Analysis/blob/master/Images/mentorship_eligibility.png)

The same issue of having some employees listed more than once, because of having different titles, was also experienced with the mentorship_eligibility table. The data also needed to be cleaned using partitioning and the below query was used to complete this:

![mentorship_eligibility_clean](https://github.com/Waking-Dreamer/Pewlett-Hackard-Analysis/blob/master/Images/mentorship_eligibility_clean.png)

*All queries can be found [Here](https://github.com/Waking-Dreamer/Pewlett-Hackard-Analysis/blob/master/Queries/challenge_queries.sql)

*All CSVs of the table output can be found [Here](https://github.com/Waking-Dreamer/Pewlett-Hackard-Analysis/blob/master/Challenge_Query_Output)


### Results Analysis:

From the analysis, we are able to see all of the employees that will be retiring in the near future [Here](https://github.com/Waking-Dreamer/Pewlett-Hackard-Analysis/tree/master/Challenge_Query_Output/emp_info_retire_clean.csv). We are also able to see the total number of employees retiring based upon their title. [Here](https://github.com/Waking-Dreamer/Pewlett-Hackard-Analysis/tree/master/Challenge_Query_Output/emp_info_retire_clean_group.csv). There is a total of 90,398 employees that will retire in the near future based upon the retirement age requirements.

From the analysis, we are also able to see all of the current employees who are eligible for mentorship and who could potentially fill the roles of the employees who will be retiring. This list of employees can be found [Here](https://github.com/Waking-Dreamer/Pewlett-Hackard-Analysis/tree/master/Challenge_Query_Output/mentorship_eligibility_clean.csv). There are total of 1,941 employees who are eligible for mentorship.

The difference between employees retiring and those available for the mentorship program is massive. Pewlett Hackard will still need to fill over 88,000 open positions once all of their older employees retire. Pewlett Hackard will need to look outside the company to hire a massive amount of employees if they want to maintain operation at their current levels.

limitations:

1)	The analysis of looking at employees who are about to retire could be expanded upon by sorting based on department. Are all of the employees retiring evenly divided amongst the company’s different departments or will certain departments be hit a lot harder by losing a larger percent of their headcount?
2)	The query for mentorship eligibility only used birthdate as an eligibility requirement. More analysis is needed to divide up employees that are eligible for mentorship based upon the departments they are in. It would not make sense to train someone in the software development department into a management position in the Human Resource Department. In reality, there are more restrictions to who is eligible for mentorship based on their role / department and this is currently not accounted for in the analysis.

