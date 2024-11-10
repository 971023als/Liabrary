-- 테이블 삭제 (이미 존재할 경우)
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE b_member CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        NULL; -- 테이블이 존재하지 않는 경우 예외 무시
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE b_book CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE b_borrow CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;

-- 인덱스 삭제 (이미 존재할 경우)
BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX idx_book_bname';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX idx_book_bcategory';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX idx_book_bwriter';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX idx_borrow_brmid';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX idx_borrow_brbrcode';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;

-- 회원 테이블 생성
CREATE TABLE b_member (
                          mid VARCHAR(50) PRIMARY KEY,     -- 회원 ID (Primary Key)
                          mpw VARCHAR(100) NOT NULL,       -- 회원 비밀번호
                          mname VARCHAR(100) NOT NULL,     -- 회원 이름
                          mphone VARCHAR(15) NOT NULL,     -- 회원 전화번호
                          brcode VARCHAR(50)               -- 대출 코드 (외래 키)
);

-- 도서 테이블 생성
CREATE TABLE b_book (
                        bcode VARCHAR(50) PRIMARY KEY,   -- 도서 코드 (Primary Key)
                        bname VARCHAR(255) NOT NULL,     -- 도서 이름
                        bcategory VARCHAR(100) NOT NULL, -- 도서 카테고리
                        bwriter VARCHAR(100) NOT NULL,   -- 도서 저자
                        bhave VARCHAR(50),               -- 보유 여부
                        brcode VARCHAR(50)               -- 대출 코드 (외래 키)
);

-- 대출 테이블 생성
CREATE TABLE b_borrow (
                          brcode INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,  -- 대출 코드 (Primary Key, Auto Increment)
                          brbcode VARCHAR(50) NOT NULL,           -- 대여한 도서의 코드 (외래 키)
                          brmid VARCHAR(50) NOT NULL,             -- 대여한 회원의 ID (외래 키)
                          brdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 대출 일자
                          brrdate TIMESTAMP NULL,                  -- 반납 예정 일자
                          bhave VARCHAR(50),                       -- 대출 상태
    -- 외래 키 설정
                          FOREIGN KEY (brbcode) REFERENCES b_book(bcode),
                          FOREIGN KEY (brmid) REFERENCES b_member(mid)
);

-- 인덱스 생성
BEGIN
    EXECUTE IMMEDIATE 'CREATE INDEX idx_book_bname ON b_book (bname)';
    EXECUTE IMMEDIATE 'CREATE INDEX idx_book_bcategory ON b_book (bcategory)';
    EXECUTE IMMEDIATE 'CREATE INDEX idx_book_bwriter ON b_book (bwriter)';
    EXECUTE IMMEDIATE 'CREATE INDEX idx_borrow_brmid ON b_borrow (brmid)';
    EXECUTE IMMEDIATE 'CREATE INDEX idx_borrow_brbrcode ON b_borrow (brbcode)';
EXCEPTION
    WHEN OTHERS THEN
        NULL; -- 인덱스 생성 실패 시 예외 무시
END;
