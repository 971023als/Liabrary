DECLARE
    v_table_name VARCHAR2(255);
BEGIN
    FOR tbl IN (SELECT table_name
                FROM all_tables
                WHERE owner = 'SYSTEM'
                  AND table_name NOT LIKE 'LOGMNR%'
                  AND table_name NOT LIKE 'AQ$%'
                  AND table_name NOT LIKE 'MVIEW%')
        LOOP
            v_table_name := tbl.table_name;
            BEGIN
                DBMS_OUTPUT.PUT_LINE('Dropping table: ' || v_table_name);
                EXECUTE IMMEDIATE 'DROP TABLE SYSTEM.' || v_table_name || ' CASCADE CONSTRAINTS';
            EXCEPTION
                WHEN OTHERS THEN
                    DBMS_OUTPUT.PUT_LINE('Failed to drop table: ' || v_table_name || ' - Error: ' || SQLERRM);
            END;
        END LOOP;
END;
/