--- QUESTIONS 
-- 1. What are the total amount of customers
select count(*)
from telco_customer_churn;
--- 7032

-- 2. What is the churn rate
select Churn,
count(*) as Customers
from telco_customer_churn
group by Churn;
--- 5163(No), 1869(yes)

-- 3. What is the average monthly charge
select 
round(avg(MonthlyCharges), 2) as Average_Monthly_Charge
from telco_customer_churn;
--- 64.80 

-- 4. What is the average tenure
select
round(avg(Tenure), 2) as Average_Tenure
from telco_customer_churn;
--- 32.42

-- 5. Which genders churn and which did not?
select 
Churn,
Gender,
count(*) as Customer
from telco_customer_churn
group by Churn, Gender;
 --- NO (Female 2544,Male 2619), YES (Female 939, Male 930)
 
--- Checking the contracts that churn
select
Contract,
count(*) churn,
SUM(CASE WHEN Churn = 'yes' THEN 1 ELSE 0 END) AS Churned
from telco_customer_churn
group by Contract;

---- Customers with different contract for internet service that are not and still using the service
select 
Contract,
InternetService,
count(*) churn,
SUM(CASE WHEN churn = 'yes' THEN 1 ELSE 0 END) AS Churned
from telco_customer_churn
group by Contract, Internetservice;

--- What Service pay the highest monthly charges
select
InternetService,
MAX(MonthlyCharges) AS Maximum_Charge
from telco_customer_churn
group by InternetService;


--- What are the unique contract types
select
Contract
from telco_customer_churn
group by Contract; 

--- Calculate the average monthly charge grouped by each contract type
select
Contract,
AVG(MonthlyCharges) AS Payment_Plan
from telco_customer_churn
group by Contract;

--- Find the total revenue for each internet service
select
InternetService,
SUM(MonthlyCharges) AS Total_Revenue
from telco_customer_churn
group by InternetService;

--- Customers who did not pay for internet service what did they pay for
select
PhoneService,
MultipleLines,
MonthlyCharges,
TotalCharges
from telco_customer_churn
where InternetService = 'No';

--- What is the contract for customers who use the phone service?
select
Contract,
Count(*) AS Phone_Service_Users
from telco_customer_churn
where PhoneService= 'Yes'
group by Contract;

--- What is the contract for customers who use both phone service and have multiple lines, and if the  churned?
select 
	Contract,
    Churn,
Count(*) Multiple_Line_Users
from telco_customer_churn
where MultipleLines = 'Yes'
and PhoneService ='Yes'
group by Contract, Churn; 

--- What is the average monthly charge for phone service
select 
PhoneService,
ROUND(AVG(MonthlyCharges), 2) as Avg_MonthlyCharge
from telco_customer_churn
where PhoneService = 'Yes'
group by PhoneService;


--- 
