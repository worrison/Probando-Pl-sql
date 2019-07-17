CREATE OR REPLACE FUNCTION check_best_cliente RETURN NUMBER IS
    best_cliente NUMBER;
BEGIN
    SELECT CUSTOMER_ID INTO best_cliente FROM (
        SELECT CUSTOMER_ID
        FROM DEMO_ORDERS
        GROUP BY CUSTOMER_ID
        ORDER BY SUM(ORDER_TOTAL) DESC
    ) WHERE ROWNUM = 1;
    
    return best_cliente;
END;
/
CREATE OR REPLACE FUNCTION getName (user_id NUMBER) RETURN VARCHAR2 IS
    nombre_mejor_cliente VARCHAR2;
BEGIN
    SELECT CUST_FIRST_NAME INTO nombre_mejor_cliente FROM DEMO_CUSTOMERS WHERE CUSTOMER_ID = user_id;
    RETURN nombre_mejor_cliente;
END;
/
BEGIN
    consolelog((getName(check_best_cliente())));
END;