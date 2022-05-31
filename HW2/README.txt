HW2 FOR CSCI 585

This assignment consists of five SQL Queries

Question1:

Setup the tables
Covid-19 tracing application consists 9 tables below:

Employee [contains info about employees]
Meeting [contains meeting info, on every meeting between employees]
EmployeeMeeting [connect tables Employee and Meeting]
Notification [based on contact tracing, to alert employees who might have been exposed]
Symptom [self-reported by employees, any of 5 symptoms]
Scan [random scans of employees' body temperatures]
Test [to record test details]
Cases [to record employees who test positive]
HealthStatus [self-reporting by employees]

In order to connect those tables together, here is how I did:

For tables with M to N relationship like Employee and Meeting, I created a bridge table called EmployeeMeeting with only employee_id (pk in Employee table) and meeting_id (pk in Meeting table) as UNIQUE (meeting_id, employee_id). With this design I can achieve M:N relationship.

For all of rest of 1:M and 1:1 relationship, I created Foreign key for the connected table in order to connect the table.

For all these tables, I add ON DELETE CASCADE in order to deal with situation as: if a record in the parent table is deleted, then the corresponding records in the child table will automatically be deleted.

For the data, I inserted 14 employees with different name and unique employee_id
3 meetings
8 Notifications
6 Scans
12 symptoms
6 test with 5 positive and 1 negative
5 cases
5 healthStatus

Question2:
Simply select the number of symptom_id from symptom and count them group by symptom_id
What we get is 7 the number of symptom counter
And 4 which is the symptom_id which means that the most common symptom is id_4 with 7 people reported


Question3:
We will join employee table and test table on their employee_id
Then Set the condition as only positive add to the output
Then group by floor_number
Here we assume that the sickest floor is the number of people who got positive test
We will get 3 | 4  
3 means that the number of people who got positive result
4 means 4th floor.

Question4:
Multiple queries to output :number of scans, number of tests, number of employees who self-reported symptoms, number of positive cases.
In order to get the time period, I add a check sentence in my where clause which only check date from
BETWEEN '2021-10-01' AND '2021-10-11'.
Expected result
12	[number of employees who self-reported symptoms]
5	[number of positive cases]
6	[number of tests]
6	[number of scans]

Question5:
Question: find all employees who attend all meetings existing.
Division operation in sql with subquery:
The sentence will do find all employees who attend all the meetings.
The logic behind it:
All the employees / desired meeting session = the employee with all desired meeting
Expected result:
employee_id 101 (employee Jason attends all the 3 meetings). 