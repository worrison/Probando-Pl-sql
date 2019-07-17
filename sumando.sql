CREATE OR REPLACE PROCEDURE sumar (num1 number, num2 number) IS
    resultado number;
BEGIN
    resultado := num1 + num2;
    DBMS_OUTPUT.PUT_LINE(resultado);
    
END;
/
BEGIN
  SUMAR(2,3);
END;