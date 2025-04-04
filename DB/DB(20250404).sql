-- sql developer 에서 한 줄 주석문

/*
  관계형 데이터베이스의 구성 요소
  
  1. 테이블
     - 관계형 데이터베이스는 기본적으로 데이터를 2차원 형태의
       표로 저장을 하고 관리를 함.
     - 이러한 표 형태의 데이터 저장 공간을 테이블(table)이라고 함.
     - 테이블은 2차원 형태이므로 가로줄과 세로줄로 구성이 되어 있음.
       * 가로줄 : 행(row)
       * 세로줄 : 열(column)
       
  2. 행
     - 행은 저장하려는 하나의 객체를 구성하는 값.
     - 예를 든다면 학생 한 사람에 대한 정보를 저장한 것.
     
  3. 열
     - 저장하는 데이터를 대표하는 이름과 공통 특성을 정의한 것.
     - 열은 저장 정보의 종류(자료형)와 자료형의 저장 가능한 
       최대 크기, 중복 여부를 설정하게 됨.
*/

/*
  오라클에서 속성에 들어가는 주요 자료형(data type)
  1. number(n, n1) : 숫자 자료형(정수, 실수)
     * n : 전체 자릿수
     * n1 : 소숫점 자릿수
     * n - n1 : 정수 자릿수
     예) number(7,2) : 전체 자릿수는 7자리이고, 정수는 5자리,
                       소숫점 자릿수는 2자리.
                    
  2. char(n) : 문자열 n개가 저장되는 자료형. ==> 고정 자료형.
  
  3. varchar(n) : 문자열 n개가 저장되는 자료형. ==> 가변 자료형.
                  ※ 현재 오라클에서는 사용하지 않는 자료형.
                  
  4. varchar2(n) : 문자열 n개가 저장되는 자료형. ==> 가변 자료형.
                   ※ 한글은 무조건 한 글자당 2바이트씩 사용됨.
                   
  5. date : 날짜가 저장되는 자료형. ==> 시스템의 현재 날짜 및 시간이 저장됨.
*/

/*
  무결성(Integrity) : 데이터베이스에 저장된 값과 그것이 표현하는 현실 세계의
                     실제 값이 일치하는 정확성을 의미함.
                     
  무결성 제약조건 : 데이터베이스에 저장된 데이터의 정확성을 보장하기 위해서
                  정확하지 않는 데이터가 데이터베이스 내에 저장되는 것을
                  방지하기 위한 조건.
                  
  데이터베이스 내에서 사용되는 무결성 제약조건의 종류
  1. unique 제약 조건
     ==> 중복이 되면 안 되는 제약 조건.
     
  2. not null 제약 조건
     ==> 공백(null) 값을 허용하지 않는 제약 조건.
     
  3. check 제약 조건
     ==> 특정한 값이 아닌 데이터가 들어오지 못하게 하는 제약 조건.
     
  4. 기본키(primary key) 제약 조건
     ==> unique + not null 제약 조건.
     ==> 기본 키는 해당 테이블을 대표하는 컬럼으로써의 역할을 수행하며,
         다른 테이블에서 외래키들이 참조할 수 있는 키로서의 자격을 가짐.
         
  5. 외래 키(foreign key) 제약 조건
     ==> 외래 키는 다른 테이블의 기본 키(primary key)를 참조하는
         컬럼의 집합임. 여기서의 외래 키 값은 참조하고 있는 테이블의
         기본 키에 없는 내용을 참조할 수 없음.
         이를 참조 무결성(Referential Integrity) 이라고 함.
*/

/*
  학생 테이블을 만들어 보자.
  구성요소 (컬럼 - 속성)
  ==> 학번, 이름, 학과, 연락처, 나이, 주소, 등록일(입학일) 등등
  
  테이블을 만드는 형식
  형식)
        create table 테이블이름(
           학번 자료형(최대크기) [제약조건],
           이름 자료형(최대크기) [제약조건],
           학과 자료형(최대크기) [제약조건],
           연락처 자료형(최대크기) [제약조건],
           나이 자료형(최대크기) [제약조건],
           주소 자료형(최대크기) [제약조건],
           등록일 자료형(최대크기) [제약조건]
        );
*/

-- 실제로 student 테이블을 만들어 보자.

create table student(
    hakbun varchar2(10) primary key,
    irum varchar2(30) not null,
    major varchar2(50),
    phone varchar2(15) not null,
    age number(3),
    addr varchar2(500),
    regdate date not null
);

-- student 테이블에 데이터(학생 정보)를 추가해 보자.
-- 형식1)
-- ==> insert into student values('학번데이터', '이름데이터', 
--            '학과데이터', '연락처데이터', 나이데이터, '주소데이터' sysdate);
insert into student values(
    '2025_001', '홍길동', '경제학과', '010-1111-1234', 28, '경기도 고양시', sysdate);

-- 형식2)
-- ==> insert into student(not null 제약조건 컬럼명을 기재)
--        values(컬럼데이터)
insert into student(hakbun, irum, phone, regdate)
    values('2025_002', '유관순', '010-2222-2345', sysdate);
    

-- student 테이블에 학생 3명의 정보를 저장하자.
insert into student(hakbun, irum, phone, regdate)
    values('2025_003', '이순신', '010-3333-3456', sysdate);

insert into student 
    values('2025_004', '세종대왕', '국문학과', 
            '010-4444-4567', 50, '서울시 중구 태평로', sysdate);

insert into student(hakbun, irum, phone, regdate)
    values('2025_005', '신사임당', '010-5555-5678', sysdate);
    
    

-- DEPT 테이블 생성
create table dept( 
  deptno     number(2,0), 
  dname      varchar2(14), 
  loc        varchar2(13), 
  constraint pk_dept primary key (deptno) 
);


create table emp( 
  empno    number(4,0), 
  ename    varchar2(10), 
  job      varchar2(9), 
  mgr      number(4,0), 
  hiredate date, 
  sal      number(7,2), 
  comm     number(7,2), 
  deptno   number(2,0), 
  constraint pk_emp primary key (empno), 
  constraint fk_deptno foreign key (deptno) references dept (deptno) 
);

-- DEPT 테이블에 데이터 추가
insert into DEPT (DEPTNO, DNAME, LOC)
	values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept 
	values(20, 'RESEARCH', 'DALLAS');
insert into dept 
	values(30, 'SALES', 'CHICAGO');
insert into dept 
	values(40, 'OPERATIONS', 'BOSTON');

-- EMP 테이블에 데이터 추가
insert into emp 
	values(7839, 'KING', 'PRESIDENT', null, to_date('17-11-1981','dd-mm-yyyy'), 5000, null, 10);

insert into emp 
	values(7698, 'BLAKE', 'MANAGER', 7839, to_date('1-5-1981','dd-mm-yyyy'), 2850, null, 30);

insert into emp 
	values(7782, 'CLARK', 'MANAGER', 7839, to_date('9-6-1981','dd-mm-yyyy'), 2450, null, 10);

insert into emp 
	values(7566, 'JONES', 'MANAGER', 7839, to_date('2-4-1981','dd-mm-yyyy'), 2975, null, 20);

insert into emp 
	values(7788, 'SCOTT', 'ANALYST', 7566, to_date('13-07-1987','dd-mm-yyyy') - 85, 3000, null, 20);

insert into emp 
	values(7902, 'FORD', 'ANALYST', 7566, to_date('3-12-1981','dd-mm-yyyy'), 3000, null, 20);

insert into emp 
	values(7369, 'SMITH', 'CLERK', 7902, to_date('17-12-1980','dd-mm-yyyy'), 800, null, 20);

insert into emp 
	values(7499, 'ALLEN', 'SALESMAN', 7698, to_date('20-2-1981','dd-mm-yyyy'), 1600, 300, 30);

insert into emp 
	values(7521, 'WARD', 'SALESMAN', 7698, to_date('22-2-1981','dd-mm-yyyy'), 1250, 500, 30);

insert into emp 
	values(7654, 'MARTIN', 'SALESMAN', 7698, to_date('28-9-1981','dd-mm-yyyy'), 1250, 1400, 30);

insert into emp 
	values(7844, 'TURNER', 'SALESMAN', 7698, to_date('8-9-1981','dd-mm-yyyy'), 1500, 0, 30);

insert into emp 
	values(7876, 'ADAMS', 'CLERK', 7788, to_date('13-07-1987', 'dd-mm-yyyy') - 51, 1100, null, 20);

insert into emp 
	values(7900, 'JAMES', 'CLERK', 7698, to_date('3-12-1981','dd-mm-yyyy'), 950, null, 30);

insert into emp 
	values(7934, 'MILLER', 'CLERK', 7782, to_date('23-1-1982','dd-mm-yyyy'), 1300, null, 10);

-- 만약에 테이블에 컬럼을 추가해야 하는 경우
-- 형식) alter table 테이블이름 add(추가할 컬럼명 자료형(크기) [제약조건]);
alter table student add(grade number(1));

-- 테이블의 컬럼을 수정해야 하는 경우(컬럼의 전체적인 내용 수정)
-- 형식) alter table 테이블이름 modify(컬럼명 자료형(크기));
alter table student modify(grade varchar2(1));

-- 테이블의 컬럼명을 수정해야 하는 경우
-- 형식) alter table 테이블이름 rename column 기존컬럼명 to 변경할컬럼명;
alter table student rename column addr to address;

-- 테이블의 컬럼을 삭제해야 하는 경우
-- 형식) alter table 테이블이름 drop column 컬럼명;
alter table student drop column grade;

/*
  1. DDL(Data Define Language : 데이터 정의 언어)
     - create : 데이터베이스 또는 테이블을 생성하는 명령어.
     - alter : 테이블을 수정하는 명령어.
     - drop : 데이터베이스 또는 테이블을 삭제하는 명령어.
     - truncate : 테이블을 초기화하는 명령어.
     
  2. DML(Data Manipulation Language : 데이터 조작 언어)
     ==> 데이터베이스에서 가장 많이 사용하는 명령어.
     - select : 데이터를 검색하는 명령어.
     - insert : 데이터를 추가하는 명령어.
     - update : 데이터를 수정하는 명령어.
     - delete : 데이터를 삭제하는 명령어.
     
  3. DCL(Data Control Language : 데이터 제어 언어)
     - grant : 특정 데이터베이스 사용자에게 작업의 특정 수행
               권한을 부여하는 명령어.
     - revoke : 특정 데이터베이스 사용자에게 작업의 특정 수행
                권한을 삭제하는 명령어.
     - commit : 트랜잭션 작업을 완료하는 명령어.
     - rollback : 트랜잭션 작업을 취소하거나, 이전 상태로
                  복구하는 역할을 하는 명령어.
*/


-- 데이터를 검색하는 명령어.
-- student 테이블에 있는 모든 데이터를 화면에 보여주세요.
-- 형식) select * from 테이블이름;
select * from student;

-- 보고 싶은 컬럼만 보이게 하고 싶은 경우
-- 형식) select 컬럼명1, 컬럼명2,.... 컬럼명n from 테이블이름;
select hakbun, irum, phone from student;

-- [문제1] emp 테이블에서 empno, ename, job, deptno 컬럼을
--         화면에 보여주세요.
select empno, ename, job, deptno from emp;

-- [문제2] emp 테이블에서 이름, 입사일, 급여를 화면에 보여주세요.
select ename, hiredate, sal from emp;

-- [문제3] emp 테이블에서 사번, 이름, 담당업무, 보너스를 화면에 보여주세요.
select empno, ename, job, comm from emp;

-- [문제4] emp 테이블에서 사번, 이름, 급여, 보너스, 급여 + 보너스 결과를
--         화면에 보여주세요.
select empno, ename, sal, comm, sal + comm from emp;

-- null 값을 가지는 컬럼은 다른 컬럼과 연산을 하게 되면
-- 모두 null 값으로 처리가 되는 문제가 발생.

-- nvl() 함수 : null 값을 특정한 값으로 변경시켜 주는 함수.
--             모든 자료형에 적용이 가능함.
--             nvl() 함수를 사용할 때에는 전환되는 값의
--             자료형을 일치시켜 주어야 함.
-- 형식) nvl(null 값이 들어 있는 컬럼명, 변경할 값)
select empno, ename, sal, comm, sal + nvl(comm, 0) from emp;

-- nvl2() 함수 : 자바에서의 3항연산자와 비숫한 함수.
-- 형식) nvl2(컬럼명, expr1, expr2)
--       ==> 컬럼에 들어 있는 값이 null이 아니면 expr1 값을 반환.
--       ==> 컬럼에 들어 있는 값이 null이면 expr2 값을 반환.
select empno, ename, sal, comm, sal + nvl2(comm, comm, 0) from emp;

-- as 키워드 : 컬럼의 제목(title)의 이름을 변경시키는 키워드.
--            별칭 또는 별명이라고도 함.
--            사용할 때에는 컬럼명 바로 뒤에 사용을 함.
--            컬럼명과 별칭 사이에 as 라는 키워드를 넣어주면 됨.
--            별칭은 "" (쌍따옴표) 안에 작성을 해야 함.
--            as 라는 키워드를 생략해도 됨.
select empno, ename, sal, comm, 
    sal + nvl2(comm, comm, 0) "급여 + 보너스" from emp;
    
-- emp 테이블에서 각 사원의 담당업무를 화면에 보여주세요.
select job from emp;

-- emp 테이블에서 각 사원의 관리자(mgr)를 화면에 보여주세요.
select mgr from emp;

/*
  distinct 키워드 : 중복을 제거해 주는 명령어.
  - 주로 하나의 컬럼에서 중복된 값을 제거하고 보여줄 때 사용함.
  - distinct 키워드는 항상 select 키워드 다음에 기술한다.
  - distinct 키워드 뒤에 나오는 컬럼들은 모두 distinct의 영향을 받는다.
  - distinct 키워드 뒤에 여러 개의 컬럼이 기술이 되면 해당 컬럼들은
    중복이 되어 나타나지 않는다.
*/

-- emp 테이블에서 각 사원의 담당업무를 중복이 되지 않게 화면에 보여주세요.
select distinct job from emp;

-- emp 테이블에서 각 사원의 관리자를 중복이 되지 않게 화면에 보여주세요.
select distinct mgr from emp;

-- emp 테이블에서 각 사원의 부서번호를 중복이 되지 않게 화면에 보여주세요.
select distinct deptno from emp;



-- member 라는 테이블을 만들어 보자.

create table member(
    memno number primary key,          -- 회원 번호
    memid varchar2(20) not null,       -- 회원 아이디
    memname varchar2(30) not null,     -- 회원 이름
    mempwd varchar2(20) not null,      -- 회원 비밀번호
    age number,                        -- 회원 나이
    mileage number,                    -- 회원 마일리지
    job varchar2(30),                  -- 회원 직업
    addr varchar2(500),                -- 회원 주소
    regdate date not null              -- 회원 가입일
);


-- member 테이블에 회원의 정보를 저장해 보자.
insert into member
    values(1, 'id1', '홍길동', '1111', 25, 0, '학생',
            '부산시 동래구', '2013-08-08');

insert into member
    values(2, 'kimkd', '김길동', '2222', 30, 1500, '회사원',
            '서울시 강남구', '2013-09-15');

insert into member
    values(3, 'id3', '공성현', '3333', 33, 10000, '회사원',
            '부산시 중구', '2013-09-09');
            
insert into member
    values(4, 'kimyh', '김영희', '4444', 18, 3000, '학생',
            '경상남도 마산시', '2014-05-23');
            
insert into member
    values(5, 'id5', '박말자', '5555', 45, 5000, '주부',
            '경기도 남양주시', '2013-12-01');

insert into member
    values(6, 'id6', '김철수', '6666', 55, 0, '교수',
            '제주도 서귀포시', '2013-01-10');

insert into member
    values(7, 'hong', '홍길동', '7777', 14, 0, '학생',
            '경상북도 경주시', '2013-12-25');

insert into member
    values(8, 'id8', '김상현', '8888', 31, 0, '무직',
            '서울시 마포구', '2013-04-22');

insert into member
    values(9, 'id9', '이지연', '9999', 25, 0, '학생',
            '강원도 강릉시', '2013-10-10');

insert into member
    values(10, 'id10', '홍길동', '1010', 52, 10000, '무직',
            '서울시 강북구', '2013-09-15');


-- 카테고리 테이블을 만들어 보자.
create table category(
    cnum number unique,                        -- 카테고리 번호
    category_code varchar2(8),                 -- 카테고리 코드
    category_name varchar2(30) not null,       -- 카테고리 이름
    primary key(category_code)
);


-- 카테고리 테이블에 데이터를 저장해 보자.
insert into category values(1, '00010000', '전자제품');
insert into category values(2, '00010001', 'TV');
insert into category values(3, '00010002', '컴퓨터');
insert into category values(4, '00010003', '노트북');
insert into category values(5, '00010004', '에어컨');
insert into category values(6, '00020000', '의류제품');
insert into category values(7, '00020001', '남방');
insert into category values(8, '00020002', '속옷');
insert into category values(9, '00020003', '바지');
insert into category values(10, '00030000', '도서');
insert into category values(11, '00030001', '컴퓨터도서');
insert into category values(12, '00030002', '소설');


-- 상품 정보 테이블을 만들어 보자.
create table products(
    pnum number(11) primary key,                   -- 제품 번호
    category_fk varchar2(8) not null,              -- 카테고리 코드
    products_name varchar2(50) not null,           -- 제품명
    ep_code_fk varchar2(5) not null,               -- 제품 코드
    input_price number(10) default 0 not null,     -- 제품 입고 가격
    output_price number(10) default 0 not null,    -- 제품 출고 가격
    trans_cost number(5) default 0 not null,       -- 제품 배송비
    mileage number(6) default 0 not null,          -- 제품 마일리지
    company varchar2(30),                          -- 제품 제조사
    constraint category_ref foreign key(category_fk) 
        references category(category_code)
);

-- 제품 데이터를 저장해 보자.
insert into products
   values(1, '00010001', 'S 벽걸이 TV', '00001', 5000000, 8000000, 0, 100000, '삼성');
insert into products
   values(2, '00010001', 'L TV', '00002', 1000000, 1500000, 0, 50000, 'LG');
insert into products
   values(3, '00010004', 'S 에어컨', '00001', 1000000, 1100000, 5000, 100000, '삼성');
insert into products
   values(4, '00010000', 'C 밥솥', '00003', 200000, 220000, 5500, 0, '쿠쿠');
insert into products
   values(5, '00010004', 'L 에어컨', '00003', 1200000, 1300000, 0, 0, 'LG');
insert into products
   values(6, '00020001', '남성난방', '00002', 100000, 150000, 2500, 0, '');
insert into products
   values(7, '00020001', '여성난방', '00002', 120000, 200000, 0, 0, '');
insert into products
   values(8, '00020002', '사각팬티', '00002', 10000, 20000, 0, 0, '보디가드');
insert into products
   values(9, '00020003', '멜빵바지', '00002', 15000, 18000, 0, 0, '');
insert into products
   values(10, '00030001', '무따기 시리즈', '00001', 25000, 30000, 2000, 0, '길벗');

-- [문제1] member 테이블에서 회원의 이름과 나이, 직업을 화면에 보여주세요.
select memname, age, job from member;

-- [문제2] products 테이블에서 제품명, 입고가, 출고가, 제조사를 화면에 보여주세요.
select products_name, input_price, output_price, company from products;

-- [문제3] member 테이블의 내용을 아래와 같이 화면에 출력해 보세요.
-- 예시) 홍길동 회원의 직업은 학생이고, 마일리지는 0 마일리지 입니다.
select memname || ' 회원의 직업은 ' || job || '이고, 마일리지는 ' 
        || mileage || ' 마일리지 입니다.' from member; 


-- 예) KING 사원의 연봉은 60000 입니다.
-- || : 오라클에서 연결 연산자.
select ename || ' 사원의 연봉은 ' || sal *12 || ' 입니다.'
    as "사원의 연봉" from emp;

commit;
