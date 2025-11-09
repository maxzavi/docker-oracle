SET SERVEROUTPUT ON;
DECLARE
  v_categories  SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST('Bebidas', 'Abarrotes', 'Snacks', 'Limpieza', 'Cuidado Personal');
  v_brands      SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST('IncaKola', 'CocaCola', 'Gloria', 'Costeño', 'Laive', 'Ariel', 'Nivea', 'Pepsi', 'San Jorge', 'Andina');
  v_names       SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST('Agua Mineral', 'Gaseosa Cola', 'Leche Evaporada', 'Cereal', 'Aceite Vegetal', 'Jabón', 'Detergente', 'Papel Higiénico', 'Shampoo', 'Cerveza Rubia');
  v_descs       SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST('Producto de alta calidad', 'Edición especial', 'Presentación familiar', 'Nuevo sabor', 'Envase reciclable', 'Gran rendimiento', 'Recomendado por expertos', 'Formato económico', 'Ideal para el hogar', 'Producto popular');
  
  v_code   VARCHAR2(50);
  v_name   VARCHAR2(200);
  v_desc   VARCHAR2(500);
  v_cat    VARCHAR2(100);
  v_brand  VARCHAR2(100);
  v_price  NUMBER(10,2);
  v_stock  NUMBER(10,2);
BEGIN
  FOR i IN 1..50 LOOP
    v_code  := 'P' || TO_CHAR(i, 'FM000');
    v_cat   := v_categories(TRUNC(DBMS_RANDOM.VALUE(1, v_categories.COUNT+1)));
    v_brand := v_brands(TRUNC(DBMS_RANDOM.VALUE(1, v_brands.COUNT+1)));
    v_name  := v_names(TRUNC(DBMS_RANDOM.VALUE(1, v_names.COUNT+1))) || ' ' || v_brand;
    v_desc  := v_descs(TRUNC(DBMS_RANDOM.VALUE(1, v_descs.COUNT+1)));
    v_price := ROUND(DBMS_RANDOM.VALUE(2, 50), 2);

    INSERT INTO demo.PRODUCT (
      PRODUCT_CODE, PRODUCT_NAME, DESCRIPTION, CATEGORY, BRAND, UNIT_PRICE
    )
    VALUES (
      v_code, v_name, v_desc, v_cat, v_brand, v_price
    );
  END LOOP;
  
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('✅ Se cargaron 50 productos de ejemplo correctamente.');
END;
/
