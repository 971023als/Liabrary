-- 회원 데이터 확인 및 삽입
MERGE INTO b_member m
USING (SELECT 'user01' AS mid, 'password123' AS mpw, 'John Doe' AS mname, '010-1234-5678' AS mphone FROM dual) src
ON (m.mid = src.mid)
WHEN NOT MATCHED THEN
    INSERT (mid, mpw, mname, mphone) VALUES (src.mid, src.mpw, src.mname, src.mphone);

MERGE INTO b_member m
USING (SELECT 'user02' AS mid, 'securePass456' AS mpw, 'Jane Smith' AS mname, '010-9876-5432' AS mphone FROM dual) src
ON (m.mid = src.mid)
WHEN NOT MATCHED THEN
    INSERT (mid, mpw, mname, mphone) VALUES (src.mid, src.mpw, src.mname, src.mphone);

MERGE INTO b_member m
USING (SELECT 'user03' AS mid, 'myPass789' AS mpw, 'Alice Johnson' AS mname, '010-5678-1234' AS mphone FROM dual) src
ON (m.mid = src.mid)
WHEN NOT MATCHED THEN
    INSERT (mid, mpw, mname, mphone) VALUES (src.mid, src.mpw, src.mname, src.mphone);

-- 도서 데이터 확인 및 삽입
MERGE INTO b_book b
USING (SELECT 'B001' AS bcode, 'Introduction to SQL' AS bname, 'Database' AS bcategory, 'Author A' AS bwriter, 'Available' AS bhave FROM dual) src
ON (b.bcode = src.bcode)
WHEN NOT MATCHED THEN
    INSERT (bcode, bname, bcategory, bwriter, bhave) VALUES (src.bcode, src.bname, src.bcategory, src.bwriter, src.bhave);

MERGE INTO b_book b
USING (SELECT 'B002' AS bcode, 'Advanced Java Programming' AS bname, 'Programming' AS bcategory, 'Author B' AS bwriter, 'Available' AS bhave FROM dual) src
ON (b.bcode = src.bcode)
WHEN NOT MATCHED THEN
    INSERT (bcode, bname, bcategory, bwriter, bhave) VALUES (src.bcode, src.bname, src.bcategory, src.bwriter, src.bhave);

MERGE INTO b_book b
USING (SELECT 'B003' AS bcode, 'Cybersecurity Essentials' AS bname, 'Security' AS bcategory, 'Author C' AS bwriter, 'Available' AS bhave FROM dual) src
ON (b.bcode = src.bcode)
WHEN NOT MATCHED THEN
    INSERT (bcode, bname, bcategory, bwriter, bhave) VALUES (src.bcode, src.bname, src.bcategory, src.bwriter, src.bhave);

MERGE INTO b_book b
USING (SELECT 'B004' AS bcode, 'Machine Learning Basics' AS bname, 'AI' AS bcategory, 'Author D' AS bwriter, 'Available' AS bhave FROM dual) src
ON (b.bcode = src.bcode)
WHEN NOT MATCHED THEN
    INSERT (bcode, bname, bcategory, bwriter, bhave) VALUES (src.bcode, src.bname, src.bcategory, src.bwriter, src.bhave);

MERGE INTO b_book b
USING (SELECT 'B005' AS bcode, 'Data Structures and Algorithms' AS bname, 'Computer Science' AS bcategory, 'Author E' AS bwriter, 'Available' AS bhave FROM dual) src
ON (b.bcode = src.bcode)
WHEN NOT MATCHED THEN
    INSERT (bcode, bname, bcategory, bwriter, bhave) VALUES (src.bcode, src.bname, src.bcategory, src.bwriter, src.bhave);

-- 대출 데이터 확인 및 삽입
INSERT INTO b_borrow (brbcode, brmid, brdate, brrdate, bhave)
SELECT 'B001', 'user01', CURRENT_TIMESTAMP, NULL, 'Borrowed' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM b_borrow WHERE brbcode = 'B001' AND brmid = 'user01');

INSERT INTO b_borrow (brbcode, brmid, brdate, brrdate, bhave)
SELECT 'B002', 'user02', CURRENT_TIMESTAMP, NULL, 'Borrowed' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM b_borrow WHERE brbcode = 'B002' AND brmid = 'user02');

INSERT INTO b_borrow (brbcode, brmid, brdate, brrdate, bhave)
SELECT 'B003', 'user03', CURRENT_TIMESTAMP, TIMESTAMP '2024-11-15 10:00:00', 'Returned' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM b_borrow WHERE brbcode = 'B003' AND brmid = 'user03');

INSERT INTO b_borrow (brbcode, brmid, brdate, brrdate, bhave)
SELECT 'B004', 'user01', CURRENT_TIMESTAMP, NULL, 'Borrowed' FROM dual
WHERE NOT EXISTS (SELECT 1 FROM b_borrow WHERE brbcode = 'B004' AND brmid = 'user01');

-- 트랜잭션 커밋
COMMIT;
