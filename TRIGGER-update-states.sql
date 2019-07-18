CREATE OR REPLACE TRIGGER logs_estados
AFTER INSERT OR DELETE OR UPDATE ON DEMO_STATES
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
    fecha_actual DATE := SYSDATE;
    message DEMO_LOGS.message%TYPE := 'Pilila insertada en state';
    messageDelete DEMO_LOGS.message%TYPE := 'Pilila eliminada en state';
    messageUpdate DEMO_LOGS.message%TYPE := 'Pilila actualizada en state';
BEGIN
    IF INSERTING THEN
        INSERT INTO DEMO_LOGS(LOG_DATE,message) VALUES (fecha_actual,message);
    ELSE 
        INSERT INTO DEMO_LOGS(LOG_DATE,message) VALUES (fecha_actual,messageUpdate);
            
    END IF;
        
END;