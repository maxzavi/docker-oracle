-- ===============================================
-- Script: load_sample_locals.sql
-- Descripción: Carga masiva de locales de ejemplo
-- ===============================================

SET SERVEROUTPUT ON;
DECLARE
  v_cities    SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST(
    'Lima', 'Arequipa', 'Trujillo', 'Chiclayo', 'Piura',
    'Cusco', 'Huancayo', 'Iquitos', 'Tacna', 'Puno'
  );
  v_states    SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST(
    'Lima', 'Arequipa', 'La Libertad', 'Lambayeque', 'Piura',
    'Cusco', 'Junín', 'Loreto', 'Tacna', 'Puno'
  );
  v_managers  SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST(
    'Carlos Paredes', 'María Flores', 'José Rivas', 'Lucía Delgado',
    'Pedro Gamarra', 'Rosa Huamán', 'Luis Chávez', 'Ana Salazar',
    'Ricardo Valdivia', 'Elena Quispe', 'Mario Pérez', 'Silvia León'
  );

  v_code     VARCHAR2(10);
  v_name     VARCHAR2(200);
  v_addr     VARCHAR2(300);
  v_city     VARCHAR2(100);
  v_state    VARCHAR2(100);
  v_phone    VARCHAR2(30);
  v_email    VARCHAR2(100);
  v_manager  VARCHAR2(150);

BEGIN
  FOR i IN 1..30 LOOP
    v_code := 'L' || TO_CHAR(i, 'FM000');
    v_city := v_cities(TRUNC(DBMS_RANDOM.VALUE(1, v_cities.COUNT+1)));
    v_state := v_states(TRUNC(DBMS_RANDOM.VALUE(1, v_states.COUNT+1)));
    v_manager := v_managers(TRUNC(DBMS_RANDOM.VALUE(1, v_managers.COUNT+1)));
    v_name := 'Local ' || v_city || ' ' || TRUNC(DBMS_RANDOM.VALUE(1, 5));
    v_addr := 'Av. ' || INITCAP(DBMS_RANDOM.STRING('A', TRUNC(DBMS_RANDOM.VALUE(5, 10)))) || ' ' || TRUNC(DBMS_RANDOM.VALUE(100, 999));
    v_phone := '+51 9' || TRUNC(DBMS_RANDOM.VALUE(10000000, 99999999));
    v_email := LOWER(REPLACE(v_city, ' ', '')) || i || '@tienda.pe';

    INSERT INTO demo.LOCAL (
      LOCAL_CODE, LOCAL_NAME, ADDRESS, CITY, STATE, PHONE_NUMBER, EMAIL, MANAGER_NAME
    )
    VALUES (
      v_code, v_name, v_addr, v_city, v_state, v_phone, v_email, v_manager
    );
  END LOOP;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('✅ Se cargaron 30 locales de ejemplo correctamente.');
END;
/
