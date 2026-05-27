use rap;
select * from crd;


-- age vs deafult (1)
select 
case
  when person_age>=18 and person_age<60 then 'working-age adults'
  when person_age>=60 then 'Senior citizen'
  else 'child'
end as age_group,
count(*) as total_loans,
sum(loan_status) as total_defaults,
round(sum(loan_status)*100.0/count(*),2) as defaults_rate_percent
from crd 
group by age_group;



-- income vs default (2)
select 
case 
    when person_income <30000 then 'Low'
    when person_income>=30000 and person_income<60000 then 'Medium'
    else 'High'
end as income_group,
count(*) as total_loans,
sum(loan_status) as total_defaults,
round(sum(loan_status)*100/count(*),2) as default_rate_percent
from crd 
group by income_group
order by default_rate_percent asc;

-- past deafult vs current default (3)
select 
cb_person_default_on_file,
count(*) as total_loans,
sum(loan_status) as total_defaults,
round(sum(loan_status)*100/count(*),2) as default_rate_percent
from crd 
group by cb_person_default_on_file;


-- home ownership vs default (4)

select 
person_home_ownership,
count(*) as total_loans,
sum(loan_status) as total_defaults,
round(sum(loan_status)*100/count(*),2) as default_rate_percent
from crd 
group by person_home_ownership;




-- loan intent vs default (5)

select 
loan_intent,
count(*) as total_loans,
sum(loan_status) as total_defaults,
round(sum(loan_status)*100/count(*),2) as default_rate_percent
from crd
group by loan_intent;



-- loan grade vs default (6)

select loan_grade,
count(*) as total_loans,
sum(loan_status) as total_defaults,
round(sum(loan_status)*100/count(*),2) as default_rate_percent
from crd
group by loan_grade
order by loan_grade asc;


-- past default + loan percent income vs deafult [combined risk] (7)

select 
cb_person_default_on_file,
case 
   when loan_percent_income <= 0.5 then 'low burden'
   when loan_percent_income >0.5 then 'high burden'
end as loan_burden,
count(*) as total_loans,
sum(loan_status) as total_defaults,
round(sum(loan_status)*100.0/count(*),2) as default_rate_percent
from crd
group by cb_person_default_on_file, loan_burden;


-- loan intrest rate vs default (8)

select 
case 
   when loan_int_rate <10 then '<10%'
   when loan_int_rate >= 10 and loan_int_rate<15 then '10-15%'
   when loan_int_rate >=15 and loan_int_rate<20 then '15-20%'
   else '20%+'
end as intrest_group,
count(*) as total_loans,
sum(loan_status) as total_defaults,
round(sum(loan_status)*100/count(*),2) as default_rate_percent
from crd
group by intrest_group;


-- income + loan grade vs default[combined risk] (9)

select 
case 
   when person_income < 30000 then 'Low'
   when person_income >=30000 and person_income<60000 then 'Medium'
   else 'High'
end as income_group,
loan_grade,
count(*) as total_loans,
sum(loan_status) as total_defaults,
round(sum(loan_status)*100/count(*),2) as default_rate_percent
from crd
group by person_income, loan_grade
order by default_rate_percent desc;
