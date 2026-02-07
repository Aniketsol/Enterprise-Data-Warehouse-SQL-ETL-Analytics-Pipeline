
-- check for unique cst_id ( primary key )

SELECT 
cst_id,
count(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 or cst_id IS NULL;


-- unwanted spaces

select cst_firstname
from silver.crm_cust_info
where cst_firstname != TRIM(cst_firstname)


-- Consistency

select DISTINCT cst_gndr
from silver.crm_cust_info