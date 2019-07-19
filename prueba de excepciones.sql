CREATE OR REPLACE PROCEDURE list_best_clients
(total_clientes number)
IS 
    CURSOR CLIENTES IS SELECT BEST_CLIENTS.CUSTOMER_ID, CUST_FIRST_NAME FROM (
        SELECT CUSTOMER_ID 
        FROM DEMO_ORDERS
        GROUP BY CUSTOMER_ID
        ORDER BY SUM(ORDER_TOTAL) DESC
    ) BEST_CLIENTS
    RIGHT JOIN DEMO_CUSTOMERS
    ON BEST_CLIENTS.CUSTOMER_ID = DEMO_CUSTOMERS.CUSTOMER_ID
    WHERE ROWNUM <= total_clientes;
    bad_input_exception EXCEPTION;
    number_of_customers number(10);
BEGIN
    SELECT COUNT(*) INTO number_of_customers
        FROM DEMO_CUSTOMERS;
        
    IF total_clientes <= 0 
        or total_clientes > number_of_customers
        or total_clientes > 50
    THEN
        RAISE bad_input_exception;
    END IF;
    
    FOR cliente IN CLIENTES LOOP
        DBMS_OUTPUT.PUT_LINE('NAME: ' || cliente.cust_first_name);
    END LOOP;
EXCEPTION
    when bad_input_exception then
        DBMS_OUTPUT.PUT_LINE('Input inválido');
END;
/

BEGIN
    list_best_clients(&numerototaldeclientes);
END;

