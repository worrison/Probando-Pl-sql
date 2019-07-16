DECLARE
    sumaTotal number;
    media number;
    total_filas NUMBER;
    fila_cliente DEMO_CUSTOMERS%ROWTYPE;
    cursor c1 is select * from DEMO_CUSTOMERS;
    mi_registro DEMO_CUSTOMERS%ROWTYPE;
    
BEGIN
    select sum(order_total) into sumaTotal from DEMO_ORDERS;
    DBMS_OUTPUT.PUT_LINE('suma: '|| sumaTotal);
    select AVG(order_total) into media from DEMO_ORDERS;
    DBMS_OUTPUT.PUT_LINE('media: '|| media);
    /*OPEN c1;
        loop
            fetch c1 into mi_registro;
            DBMS_OUTPUT.PUT_LINE('HOLA'||' ' || mi_registro.CUST_FIRST_NAME);
            exit when c1%NOTFOUND;
        end loop;
    close c1;*/
    FOR mi_registro IN c1
    LOOP
        DBMS_OUTPUT.PUT_LINE('HOLA'||' ' || mi_registro.CUST_FIRST_NAME);
    END LOOP;
    
END;