DECLARE
    cursor listaId IS SELECT DISTINCT ORDER_ID from DEMO_ORDER_ITEMS ORDER BY ORDER_ID;
    
    -- registro DEMO_ORDER_ITEMS.order_id%type;
    
    cursor mediaCompra (id DEMO_ORDER_ITEMS.ORDER_ID%TYPE)
    IS SELECT SUM(unit_price*quantity)/SUM(quantity) from DEMO_ORDER_ITEMS where order_id= id;
    
    media decimal;
BEGIN
    FOR registro IN listaId
    LOOP
        OPEN mediaCompra(registro.ORDER_ID);
            LOOP  FETCH mediaCompra INTO media;  
            EXIT WHEN mediaCompra%NOTFOUND;  --- se procesa el registro END LOOP;
                DBMS_OUTPUT.PUT_LINE( 'COMPRA: '|| registro.ORDER_ID ||' MEDIA:  '|| media);
            END LOOP;
        close mediaCompra;
    END LOOP;
END;