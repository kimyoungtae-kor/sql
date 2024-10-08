GRANT CREATE VIEW TO SAMPLE;

SELECT * FROM SAMPLE.STUDENT s ;

-- AUDIT 감사
-- 권한을 한덩어리로 묶으면 Role
--REVOKE << 권한 철회 

-- SAMPLE 이 HR의 EMPLOYEES의 셀렉트 할수있는 권한 부여

GRANT SELECT ON HR.EMPLOYEES TO SAMPLE;

REVOKE SELECT ON HR.EMPLOYEES FROM SAMPLE;
--SAMPLE CREATE SYNONYM 권한 부여
GRANT CREATE PUBLIC SYNONYM TO SAMPLE;

GRANT DBA TO SAMPLE;

CREATE PUBLIC SYNONYM STU FOR SAMPLE.STUDENT;

DROP PUBLIC SYNONYM STU;

REVOKE DBA FROM SAMPLE;