DECLARE
    cursor lineas is select * from DEMO_ORDER_ITEMS;
    -- mi_registro  lineas.UNIT_PRICE%rowtype;
BEGIN
    /*FOR mi_registro IN mediaPedido
    LOOP
        DBMS_OUTPUT.PUT_LINE('HOLA'||' ' || mi_registro.CUST_FIRST_NAME);
    END LOOP;*/
END;