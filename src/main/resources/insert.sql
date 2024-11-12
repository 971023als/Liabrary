-- 회원 데이터 확인 및 삽입
MERGE INTO SYSTEM.b_member m
USING (
    SELECT 'user01' AS mid, 'password123' AS mpw, 'John Doe' AS mname, '010-1234-5678' AS mphone FROM dual
) src
ON (m.mid = src.mid)
WHEN MATCHED THEN
    UPDATE SET m.mpw = src.mpw, m.mname = src.mname, m.mphone = src.mphone
WHEN NOT MATCHED THEN
    INSERT (mid, mpw, mname, mphone)
    VALUES (src.mid, src.mpw, src.mname, src.mphone);

MERGE INTO SYSTEM.b_member m
USING (
    SELECT 'user02' AS mid, 'securePass456' AS mpw, 'Jane Smith' AS mname, '010-9876-5432' AS mphone FROM dual
) src
ON (m.mid = src.mid)
WHEN MATCHED THEN
    UPDATE SET m.mpw = src.mpw, m.mname = src.mname, m.mphone = src.mphone
WHEN NOT MATCHED THEN
    INSERT (mid, mpw, mname, mphone)
    VALUES (src.mid, src.mpw, src.mname, src.mphone);

MERGE INTO SYSTEM.b_member m
USING (
    SELECT 'user03' AS mid, 'myPass789' AS mpw, 'Alice Johnson' AS mname, '010-5678-1234' AS mphone FROM dual
) src
ON (m.mid = src.mid)
WHEN MATCHED THEN
    UPDATE SET m.mpw = src.mpw, m.mname = src.mname, m.mphone = src.mphone
WHEN NOT MATCHED THEN
    INSERT (mid, mpw, mname, mphone)
    VALUES (src.mid, src.mpw, src.mname, src.mphone);

-- 도서 데이터 확인 및 삽입
MERGE INTO SYSTEM.b_book b
USING (
    SELECT 'B001' AS bcode, 'Introduction to SQL' AS bname, 'Database' AS bcategory, 'Author A' AS bwriter, 'Available' AS bhave FROM dual
) src
ON (b.bcode = src.bcode)
WHEN MATCHED THEN
    UPDATE SET b.bname = src.bname, b.bcategory = src.bcategory, b.bwriter = src.bwriter, b.bhave = src.bhave
WHEN NOT MATCHED THEN
    INSERT (bcode, bname, bcategory, bwriter, bhave)
    VALUES (src.bcode, src.bname, src.bcategory, src.bwriter, src.bhave);

-- 대출 데이터 확인 및 삽입 (MERGE 사용)
MERGE INTO SYSTEM.b_borrow b
USING (
    SELECT 'B001' AS brbcode, 'user01' AS brmid, CURRENT_TIMESTAMP AS brdate, NULL AS brrdate, 'Borrowed' AS bhave FROM dual
) src
ON (b.brbcode = src.brbcode AND b.brmid = src.brmid)
WHEN MATCHED THEN
    UPDATE SET b.brdate = src.brdate, b.brrdate = src.brrdate, b.bhave = src.bhave
WHEN NOT MATCHED THEN
    INSERT (brbcode, brmid, brdate, brrdate, bhave)
    VALUES (src.brbcode, src.brmid, src.brdate, src.brrdate, src.bhave);

-- 트랜잭션 커밋
COMMIT;
