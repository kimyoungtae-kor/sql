-- 사번,이름,부서번호,부서이름 조회

SELECT * FROM TAB;
SELECT * FROM DEPARTMENTS d ;
SELECT EMPLOYEE_ID,DEPARTMENT_ID,FIRST_NAME || ' ' || LAST_NAME,DEPARTMENT_ID FROM EMPLOYEES e ,JOIN DEPARTMENTS d USING(DEPARTMENT_ID);

--사번, 성, 상사의 사번,상사의 성

SELECT E.EMPLOYEE_ID,e.Last_name,e.manager_id,e2.LAST_NAME FROM EMPLOYEES e LEFT JOIN EMPLOYEES e2  ON E2.EMPLOYEE_ID = E.MANAGER_ID ORDER  BY 1;


