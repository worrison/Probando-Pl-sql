--select max(suma) from (select sum(ORDER_TOTAL) as suma from DEMO_ORDERS group by CUSTOMER_ID);
/*SELECT CLIENT_ID INTO BEST_CLIENT FROM(
select CUSTOMER_ID ,suma from (select  CUSTOMER_ID ,sum(ORDER_TOTAL) as suma  
from DEMO_ORDERS
group by CUSTOMER_ID 
order by suma DESC)
WHERE ROWNUM = 1;)*/



select ORDERS.CID , DEMO_CUSTOMERS.CUST_FIRST_NAME AS NAME ,suma
from (
    select  DEMO_ORDERS.CUSTOMER_ID AS CID,sum(ORDER_TOTAL) as suma
        from DEMO_ORDERS
        group by DEMO_ORDERS.CUSTOMER_ID 
        order by suma DESC
    ) ORDERS 
INNER JOIN DEMO_CUSTOMERS
ON  ORDERS.cid = DEMO_CUSTOMERS.CUSTOMER_ID
WHERE ROWNUM = 1





