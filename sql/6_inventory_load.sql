-- Conéctate como DEMO
-- sqlplus demo/demo@FREEPDB1

DECLARE
    v_count_products NUMBER;
    v_count_locals   NUMBER;
BEGIN
    -- Contar productos y locales existentes
    SELECT COUNT(*) INTO v_count_products FROM demo.product;
    SELECT COUNT(*) INTO v_count_locals FROM demo.local;

    -- Generar inventario aleatorio
    FOR i IN 1..v_count_products LOOP
        FOR j IN 1..v_count_locals LOOP
            INSERT INTO demo.inventory (
                product_id,
                local_id,
                quantity_on_hand,
                quantity_reserved,
                last_update_date,
                last_updated_by
            )
            VALUES (
                i,                               -- producto i
                j,                               -- local j
                ROUND(DBMS_RANDOM.VALUE(0, 500), 2),  -- stock aleatorio
                ROUND(DBMS_RANDOM.VALUE(0, 50), 2),   -- reserva aleatoria
                SYSDATE - DBMS_RANDOM.VALUE(0, 30),   -- fecha aleatoria (últimos 30 días)
                'SYSTEM'
            );
        END LOOP;
    END LOOP;

    COMMIT;
END;
/
