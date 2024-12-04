SELECT donor_id,
       d.first_name,
       d.last_name,
       d.address1,
       d.address2,
       d.city,
       d.state,
       d.zip_code,
       COUNT(donor_id) as donation_count,
       SUM(amount)     as total_donated
FROM donations
         INNER JOIN
     nu.donors d on donations.donor_id = d.id
WHERE
    address1 <>'' and
    address2 <> '' and
    city <> '' and
    zip_code <> ''

    GROUP BY donor_id
        HAVING donation_count = 1 and
               total_donated >= 100
            ORDER BY donation_count DESC;


select donor_id,
       donors.first_name,
       donors.last_name,
       donors.address1,
       donors.address2,
       donors.city,
       donors.state,
       donors.zip_code,
       donors.phone,
       SUM(d.amount) as total_donated,
       MAX(d.created_at) as last_donated_on

from donors
    RIGHT JOIN nu.donations d on donors.id = d.donor_id
where phone <> ''
    AND (
     address1 = ''
    or address2 = ''
    or city = ''
    or state = ''
    or zip_code =''
    )
    GROUP BY donor_id;


SELECT DATE_FORMAT(donations.created_at, '%Y-%u')week_donated,
       sum(donations.amount) as total_donated
from donations
WHERE
    created_at BETWEEN '2024-10-01' AND '2024-10-21'
GROUP BY week_donated
ORDER BY week_donated ASC;


SELECT DATE_FORMAT(donations.created_at, '%Y-%u') as donation_week,
       sum(donations.amount) as total_donated
from donations
WHERE
    created_at BETWEEN '2024-10-01' AND '2024-10-21'
GROUP BY donation_week
ORDER BY donation_week ASC;



SELECT DATE_FORMAT(donations.created_at, '%Y-%m') month_donated,
       from donations
group by month_donated
order by month_donated ASC;


SELECT donations.donor_id,
       sum(donations.amount) as total_donated
FROM donations
WHERE created_at BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY donor_id
ORDER BY total_donated DESC
LIMIT 5;





