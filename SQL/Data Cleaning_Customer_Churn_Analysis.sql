---- check dataset available
select*
from telco_customer_churn;

---- already changed the data type of monthlycharges and total charges from double to decimal
DESCRIBE telco_customer_churn;

---- checking for blanks
select * from telco_customer_churn 
where TotalCharges = '';

select * from telco_customer_churn
where MonthlyCharges = '';

---- checking for inconsistencies
select distinct InternetService
From telco_customer_churn;

select distinct Contract
from telco_customer_churn;

select distinct PaymentMethod
from telco_customer_churn;

---- Checking for duplicates
select customerID,
count(*) 
from telco_customer_churn
group by customerID 
having count(*) > 1;

---- Verify Numeric Columns
select
round(min(MonthlyCharges), 2) AS Minimum_Monthly_Charge,
round(max(MonthlyCharges), 2) AS Maximum_Monthly_Charge,
round(avg(MonthlyCharges), 2) AS Average_Monthly_Charge
from telco_customer_churn;
--- 18.25, 118.75, 64.80 respectively

select 
round(min(TotalCharges),2) AS Minimum_Total_Charges,
round(max(TotalCharges),2) AS Maximum_Total_Charges,
round(avg(TotalCharges),2) AS Average_Total_Charges
from telco_customer_churn;
---- 18.80, 8684.80, 2283.30 respectively

select
min(Tenure),
max(Tenure)
from telco_customer_churn;


