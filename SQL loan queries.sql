##KPI 1
select  Year(issue_d) As loan_Year , Sum(loan_amnt) As total_sum
from finance_1
group by Year(issue_d)
order by issue_d;


##KPI 2
SELECT finance_1.grade, finance_1.sub_grade, SUM(finance_2.revol_bal) as revol_bal
FROM finance_1
INNER JOIN finance_2 ON finance_1.id=finance_2.id
group by grade , sub_grade
order by grade;


##KPI 3
SELECT finance_1.verification_status, sum(finance_2.total_pymnt) as sum_of_total_pymnt 
FROM finance_1
INNER JOIN finance_2 ON finance_1.id=finance_2.id
WHERE verification_status = "Verified" OR verification_status = "Not Verified"
group by verification_status;

##KPI 4
SELECT year(finance_2.last_credit_pull_d) as year, finance_1.addr_state, count(finance_1.loan_status) as count_of_loan_status 
FROM finance_1
INNER JOIN finance_2 ON finance_1.id=finance_2.id
group by year,addr_state;

##KPI 5
SELECT year(finance_2.last_pymnt_d) as year, finance_1.home_ownership, count(finance_2.last_pymnt_amnt) as count_of_last_pymnt_amnt
FROM finance_1
INNER JOIN finance_2 ON finance_1.id=finance_2.id
group by home_ownership;