use rap;
select * from crd;

update crd 
set person_home_ownership=concat(
upper(left(person_home_ownership,1)),lower(substring(person_home_ownership,2))
);

update crd 
set loan_intent=concat(
upper(left(loan_intent,1)),lower(substring(loan_intent,2))
);

select person_age,count(person_age)
from crd
group by person_age;

select distinct person_age 
from crd order by person_age limit 1 offset 28;


UPDATE crd 
SET person_age = (
    SELECT person_age 
    FROM (
        SELECT person_age 
        FROM crd 
        ORDER BY person_age 
        LIMIT 1 OFFSET 28
    ) AS temp
)
WHERE person_age IN (123,144);

select distinct person_emp_length 
from crd;


select person_emp_length,count(distinct person_emp_length)
from crd
group by person_emp_length;



select count(distinct person_emp_length)
from crd;

select distinct person_emp_length
from crd order by person_emp_length limit 1 offset 17;


update crd 
set person_emp_length=(
select person_emp_length
from (
select distinct person_emp_length 
from crd order by person_emp_length limit 1 offset 17) as temp
)
where person_emp_length=123;

