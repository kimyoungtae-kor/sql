-- 102번 학과 학생이면서 4학년이거나 1학년
SELECT DEPTNO,STUDNO,NAME,GRADE FROM STUDENT WHERE DEPTNO =102 AND (GRADE = 1 OR GRADE =4);
-- IN버전
SELECT DEPTNO,STUDNO,NAME,GRADE FROM STUDENT WHERE DEPTNO =102 AND GRADE IN (1,4);

-- 이야 이건몰랐넹 
CREATE TABLE STUD_HEAVY AS
SELECT * FROM STUDENT WHERE WEIGHT >=70 AND GRADE = 1 ;

CREATE TABLE STUD_101 AS
SELECT * FROM STUDENT WHERE DEPTNO = 101 AND GRADE = 1;

SELECT STUDNO,NAME FROM STUD_HEAVY 
INTERSECT 
SELECT STUDNO,NAME FROM STUD_101;

--UNION,UNION ALL을 활용하여 학번 이름 조회 (대상테이블 : STUD_HEAVY ,SYUD_101);
SELECT DISTINCT * FROM (
SELECT STUDNO,NAME FROM STUD_HEAVY 
UNION ALL
SELECT STUDNO,NAME FROM STUD_101
);
--학생 테이블에서 이름순으로 정렬,이름 ,학년,전화번호
SELECT NAME,GRADE,TEL FROM STUDENT ORDER BY NAME ASC;
--학생 테이블에서 학년을 내림차순으로 정렬,이름 ,학년,전화번호
SELECT NAME,GRADE,TEL FROM STUDENT  ORDER BY GRADE DESC;
--학생 테이블에서 학년을 내림차순으로 학년이같으면 이름을 오름차순으로 정렬,이름 ,학년,전화번호
SELECT NAME,GRADE,TEL FROM STUDENT  ORDER BY GRADE DESC,NAME ASC;

SELECT * FROM STUDENT ORDER BY PROFNO DESC,NAME DESC ;


SELECT SUBSTR(NAME,1,3) FROM PROFESSOR;


SELECT * FROM STUDENT s ;
--학생의 이름,아이디를 조회,단 아이디의 첫글자는 대문자로
SELECT NAME,INITCAP(USERID),UPPER(USERID),LOWER(USERID)  FROM STUDENT;

-- 부서의 이름을 조회하고 이름의 길이와,바이트 갯수를 조회
SELECT DNAME,LENGTH(DNAME),LENGTHB(DNAME)  FROM DEPARTMENT ;

-- 1학년 학생들의 생년월일, 태어난 달을 조회(주민번호를 통해서)

SELECT STUDNO,IDNUM ,SUBSTR(IDNUM,1,6) AS BIRTHDATE,SUBSTR(IDNUM,3,2) FROM STUDENT WHERE GRADE = 1 ;

SELECT * FROM STUDENT s ;
--tel 끝내자리를 안보고싶다
--SELECT TEL,REPLACE(TEL,SUBSTR(TEL,-4,INSTR(TEL,'-')),'****') FROM STUDENT; 
SELECT TEL,REPLACE(TEL,SUBSTR(TEL,-4),'****') FROM STUDENT;

--선생님풀이
SELECT TEL,SUBSTR(TEL,1,INSTR(TEL,'-') ) || '****' TEL FROM STUDENT;

--부서 테이블에서 부서이름 조회, 부서이름 '과' 글자의 위치를 탐색

SELECT DNAME,INSTR(DNAME,'과',-3,1) FROM DEPARTMENT; 
-- 교수의 직급의 왼쪽에 + 기호를 추가 하여 10글자로,아이디의 오른쪽에 + 추가하여 12글자로 조회
SELECT POSITION,LPAD(POSITION,10,'*'),RPAD(POSITION,12,'+') FROM PROFESSOR;

SELECT 'xyxyyyyy',LTRIM('  xyxxyyyyxy',' '),RTRIM('xyxyyyyyxy','xy') FROM DUAL;

--부서 테이블에서 부서 이름의 마직막 '과'를 글자를 제거
SELECT DNAME,RTRIM(DNAME,'과') AS DNAME FROM DEPARTMENT ;

--교수 테이블에서 일급계산(1달은 22일 가정)
-- 일급 각각,소수점 첫째 자리에서,소수점 셋째 자리에서 반올림

SELECT SAL,ROUND(SAL /22,0) AS sosu0 ,ROUND(SAL /22,2) AS sosu2,ROUND(SAL /22,-1) AS sosu,TRUNC(SAL / 22,2) AS A,TRUNC(SAL / 22)AS B FROM PROFESSOR p ;

--교수 테이블에서 입사일 +30 과 +60 교수번호 9908

SELECT HIREDATE ,HIREDATE+30,HIREDATE+60 FROM PROFESSOR  WHERE PROFNO = 9908;
--오늘날짜 에서 NEXTDAY 월요일

SELECT SYSDATE FROM DUAL ;

SELECT ROUND(MONTHS_BETWEEN(SYSDATE,'2023/08/21')) A FROM DUAL; 

--입사한지 120개월된 교수들을 조회 / 교수번호,입사일,입사일 + 6개월후 ,입사일 부터 현재까지의 개월 계산

SELECT PROFNO,HIREDATE,ADD_MONTHS(HIREDATE,6) A,MONTHS_BETWEEN(SYSDATE,HIREDATE) B FROM PROFESSOR WHERE MONTHS_BETWEEN(SYSDATE,HIREDATE) <= 240+120;

-- 오늘이 속한 달의 마직막 날짜, 다가오는 일요일을 조회
SELECT SYSDATE,LAST_DAY(SYSDATE),NEXT_DAY(SYSDATE,1) FROM DUAL;

--오늘을 조회, 반올림,절삭처리

SELECT SYSDATE - 4/24,ROUND(SYSDATE - 1/24),TRUNC(SYSDATE)  FROM DUAL;

-- 오늘을 반올림 날짜 월 연도로 반올림
SELECT SYSDATE ,ROUND(SYSDATE,'dd') d,ROUND(SYSDATE,'mm') m,ROUND(SYSDATE,'YY') Y,ROUND(SYSDATE,'HH') H,ROUND(SYSDATE,'MI') mi  FROM DUAL;

--4학년 학생조회
SELECT * FROM STUDENT s  WHERE GRADE = 4;



