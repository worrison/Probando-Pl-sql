DECLARE
    texto varchar2(100) :='Hola mundo 2';
    mi_numero NUMBER(6,2) :=1235.67;
    multiplicador NUMBER(6,2):=&NUMERO;
    
BEGIN
    DBMS_OUTPUT.PUT_LINE(texto || ' cruel');
    --NUMEROS
    DBMS_OUTPUT.PUT_LINE(mi_numero);
    DBMS_OUTPUT.PUT_LINE(mi_numero * multiplicador); 
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(sysdate,'HH24:MI:SS')); 
    
    IF MULTIPLICADOR > 3 THEN
         DBMS_OUTPUT.PUT_LINE('Buenos dias'); 
    END IF;
END;