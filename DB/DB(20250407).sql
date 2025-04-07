/*
  ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
  ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
  ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
  
  where 조건절
  - 모든 데이터를 조회하는 것이 아니라 사용자가 원하는 데이터만 
    조회할 경우에 사용이 됨. 
  - where 조건절은 자료를 필터링할 때 사용되는 키워드.
  - where 조건절은 from 테이블명 뒤에 기술을 해야 함.
  
  형식) select 컬럼명1, 컬럼명2,......
       from 테이블명
       where 조건절;
       
  조건절에 들어가는 내용
  1) = : 조건이 같은지 여부 확인.
  2) < : 조건이 작은지 여부 확인.
  3) <= : 조건이 작거나 같은지 여부 확인.
  4) > : 조건이 큰지 여부 확인.
  5) >= : 조건이 크거나 같은지 여부 확인.
  6) != : 조건이 같지 않은지 여부 확인.
  7) <> : 조건이 같지 않은지 여부 확인. ==> != 과 같은 의미.
  8) between A and B : A와 B 사이에 있는지 여부 확인.
  9) in(list) : list 값 중에 어느 하나와 일치하는지 여부 확인.
  10) not between A and B : A와 B 사이에 있지 않은지 여부 확인.
      ==> A, B 값을 포함하지 않음.
  11) not in(list) : list 값과 일치하지 않는지 여부 확인.
*/

select * from emp;

-- emp 테이블에서 담당업무가 'MANAGER' 인 사원의 
-- 모든 정보를 보여주세요.
select * from emp
where job = 'MANAGER';

-- emp 테이블에서 담당업무가 'SALESMAN' 인 사원의 
-- 모든 정보를 화면에 보여주세요.
select * from emp
where job = 'SALESMAN';


-- [문제1] emp 테이블에서 담당업무가 'CLERK' 인 사원의
-- 사번, 이름, 담당업무, 급여를 화면에 보여주세요.
select empno, ename, job, sal
from emp
where job = 'CLERK';


-- [문제2] emp 테이블에서 1982년 1월 1일 이후에 입사한
-- 사원의 사번, 이름, 담당업무, 급여, 입사일자를 화면에 보여주세요.
select empno, ename, job, sal, hiredate
from emp
where hiredate >= '82/01/01';


-- [문제3] emp 테이블에서 급여가 1300 ~ 1500 사이인 사원의
-- 이름과 담당업무, 급여, 부서번호를 화면에 보여주세요.
select ename, job, sal, deptno
from emp
-- where sal >= 1300 and sal <= 1500;
where sal between 1300 and 1500;


-- [문제4] emp 테이블에서 사번이 7902, 7788, 7566 인 사원의
-- 사번, 이름, 담당업무를 화면에 보여주세요.
select empno, ename, job
from emp
-- where empno = 7902 or empno = 7788 or empno = 7566;
where empno in (7902, 7788, 7566);


--[문제5] emp 테이블에서 보너스가 300이거나 500이거나
-- 1400인 사원의 모든 정보를 화면에 보여주세요.
select *
from emp
-- where comm = 300 or comm = 500 or comm = 1400;
where comm in ( 300, 500, 1400);


-- [문제6] member 테이블에서 이름이 홍길동이면서 직업이
-- 학생인 회원의 모든 정보를 화면에 보여주세요.
select *
from member
where memname = '홍길동' and job = '학생';


-- [문제7] products 테이블에서 제조사가 '삼성' 또는 '현대'
-- 이면서 입고가가 100만원 이하인 상품의 상품명과 입고가 그리고
-- 출고가를 화면에 보여주세요.
select products_name, input_price, output_price
from products
where company in ('삼성', '현대') and input_price <= 1000000;


-- [문제8] emp 테이블에서 급여가 1100 이상이고, 담당업무가
-- 'MANAGER' 인 사원의 사번, 이름, 담당업무, 급여를 화면에 보여주세요.
select empno, ename, job, sal
from emp
where sal >= 1100 and job = 'MANAGER';


/*
  ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★

  like 키워드 : 검색을 하는 키워드.
  
  1) where ename like '%S%'  
     ==> ename 컬럼에 S자를 포함하는 사원의 이름을 검색.
     
  2) where ename like 'S%'
     ==> ename 컬럼에서 첫글자가 S자로 시작하는 사원의 이름을 검색.
     
  3) where ename like '%S'
     ==> ename 컬럼에서 마지막 글자가 S자로 끝나는 사원의 이름을 검색.
     
  4) where ename like '_S%'
     ==> ename 컬럼에서  두번째 글자가 S자를 포함하는 사원의 이름을 검색.
*/

-- [문제1] emp 테이블에서 사원명에 'M' 이라는 글자를 포함하는
-- 사원의 모든 정보를 화면에 보여주세요.
select *
from emp
where ename like '%M%';


-- [문제2] emp 테이블에서 사원명의 두번째 글자에 'I' 이라는 
-- 글자를 포함하는 사원의 모든 정보를 화면에 보여주세요.
select * 
from emp
where ename like '_I%';


-- [문제3] emp 테이블에서 사원명에 이름이 'S' 라는 글자로 끝나는
-- 사원의 사번과 이름, 담당업무, 부서번호를 화면에 보여주세요.
select empno, ename, job, deptno
from emp
where ename like '%S';

-- [문제4] emp 테이블에서 사원명에 세번째 글자가 'R' 이라는 
-- 글자를 포함하는 사원의 이름과 담당업무, 급여를 화면에 보여주세요.
select ename, job, sal
from emp
where ename like '__R%';


-- [문제5] emp 테이블에서 사원명에 두번째 글자가 'O' 라는 
-- 글자를 포함하는 사원의 모든 정보를 화면에 보여주세요.
select *
from emp
where ename like '_O%';


-- [문제6] emp 테이블에서 입사년도가 82년도인 사원의 
-- 사번, 이름, 담당업무, 입사일자를 화면에 보여주세요.
select empno, ename, job, hiredate
from emp
where hiredate like '82%';


-- [문제7] member 테이블에서 성이 '김'씨 성을 가지는 
-- 회원의 모든 정보를 화면에 보여주세요.
select *
from member
where memname like '김%';


-- [문제8] member 테이블에서 주소에 '서울시' 가 들어가는 
-- 회원의 이름, 주소, 직업을 화면에 보여주세요.
select memname, addr, job
from member
where addr like '서울시%';


-- [문제9] products 테이블에서 제품명에 '에어컨' 을 
-- 포함하는 제품의 제품명, 입고가, 출고가, 제조사를
-- 화면에 보여주세요.
select products_name, input_price, output_price, company
from products
where products_name like '%에어컨%';



/*
  ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
  
  order by 절
  
  - 자료를 정렬하여 나타낼 때 사용하는 명령어.
  - order by 절을 사용할 때는 select 구문의 맨 마지막에 위치해야 함.
  - asc : 오름차순 정렬
  - desc : 내림차순 정렬
  - 기본적으로 order by 절을 사용 시에는 오름차순 정렬이 default(기본값)임.
  - 오름차순 정렬인 경우에는 asc를 생략해도 됨.
*/

-- member 테이블에서 이름을 기준으로 오름차순으로 정렬을 하여
-- 모든 정보를 화면에 보여주세요.
-- 단, 이름이 같은 경우에는 나이를 기준으로 내림차순 정렬하세요.
select *
from member
order by memname asc, age desc;



-- [문제1] emp 테이블에서 부서번호를 기준으로 오름차순 정렬을 하고,
-- 부서번호가 같은 경우 급여를 기준으로 내림차순으로 정렬을 하여
-- 화면에 보여주세요.
-- 단, 급여가 같은 경우 사원번호를 기준으로 오름차순 정렬
select *
from emp
order by deptno, sal desc, deptno;

--[문제2] products 테이블에서 판매가격을 기준으로 내림차순으로
-- 정렬을 하여 모든 정보를 화면에 보여주세요.
select *
from products
order by output_price desc;

-- [문제3] products 테이블에서 배송비를 기준으로 내림차순으로
-- 정렬하세요. 단, 배송비가 같은 경우 마일리지를 기준으로
-- 내림차순으로 정렬하여 모든 정보를 화면에 보여주세요.
select *
from products
order by trans_cost desc, mileage desc;


-- [문제4] emp 테이블에서 입사일자가 오래된 사원부터 최근에 
-- 입사한 사원을 기준으로 정렬하되, 사원명, 입사일자를
-- 화면에 보여주세요.
select ename, hiredate
from emp
order by hiredate;


-- [문제5] emp 테이블에서 급여를 기준으로 내림차순으로 정렬을
-- 하여 모든 정보를 화면에 보여주세요.
select *
from emp
order by sal desc;


-- [문제6] emp 테이블에서 급여가 1100 이상인 사원들의 정보를
-- 보여주되, 입사일자가 빠른 순으로 정렬하여 화면에 보여주세요.
select *
from emp
where sal >= 1100
order by hiredate;


-- [문제7] emp 테이블에서 부서번호를 기준으로 오름차순 정렬하여
-- 나타내고, 부서번호가 같은 경우 담당업무를 기준으로 오름차순하여
-- 정렬하세요. 만약 담당업무가 같다고 하면, 급여가 많은데서 적은
-- 순으로 정렬하여 모든 정보를 화면에 보여주세요.
select *
from emp
order by deptno, job, sal desc;


/*
  not 키워드 : 부정
  - 부정을 처리하는 경우에는 우선은 긍정의 쿼리문을 작성한 후에
    부정의 의미인 not 키워드를 붙여주면 됨.
*/

-- emp 테이블에서 담당업무가 'MANAGER', 'CLERK', 'ANALYST' 가
-- 아닌 사원의 사번, 이름, 담당업무, 급여를 화면에 보여주세요.
select empno, ename, job, sal
from emp
where job not in('MANAGER', 'CLERK', 'ANALYST');



-- [문제1] emp 테이블에서 이름에 'S' 자가 들어가지 않는
-- 사원의 이름과 담당업무를 화면에 보여주세요.
select ename, job
from emp
where ename not like '%S%';


-- [문제2] emp 테이블에서 부서번호가 10번 부서가 아닌 사원의
-- 이름, 담당업무, 부서번호를 화면에 보여주세요.
select ename, job, deptno
from emp
-- where not deptno = 10;
-- where deptno != 10;
where deptno <> 10;

-- [문제3] member 테이블에서 주소가 '서울시' 가 아닌 회원의
-- 모든 정보를 화면에 보여주세요.
select *
from member
where  addr not like '서울시%';


-- [문제4] products 테이블에서 출고가가 100만원 미만이 아닌
-- 제품의 제품명과 출고가를 화면에 보여주세요.
select products_name, output_price
from products
where not output_price < 1000000;

-- [문제5] emp 테이블에서 보너스가 null이 아닌 사원의 
-- 모든 정보를 화면에 보여주세요.
select *
from emp
where comm is not null;


/*
  - 사용자 계정을 만드는 방법
  - 형식) create user 사용자계정명 identified by 비밀번호;
  
  - 만들어진 계정을 사용하기 위해 권한을 설정.
  - 형식) grant connect, resource to 사용자계정명;

  - role : 사용자에게 보다 효율적으로 권한을 부여할 수 있도록
           여러 개의 권한을 묶어 놓은 것을 말함.
    
    * connect role
      ==> 오라클 데이터베이스에 접속할 수 있는 세션 설정 및
          사용자가 데이터베이스에 접근이 가능하도록 하기 위해서
          가장 기본적인 시스템 권한을 묶어 놓은 것을 말함.
    
    * resource role
      ==> 사용자가 테이블을 생성할 수 있도록 하기 위해서
          시스템 권한을 묶어 놓은 것을 말함.
          또한 insert, update, delete 구문을 사용할 수
          있는 권한을 묶어 놓은 것을 말함.
*/

/*
  그룹함수
  ==> 여러 행 또는 테이블 전체에 대하여 함수가 적용되어
      하나의 결과값을 가져오는 함수.
      
  1) avg() : 평균값을 구하는 함수.
  2) count() : 행(레코드)의 갯수를 구하는 함수.
               ==> null 값은 무시하고 행의 갯수를 구함.
  3) max() : 최대값을 구하는 함수.
  4) min() : 최소값을 구하는 함수.
  5) sum() : 총 합을 구하는 함수.
*/

-- emp 테이블에서 사번을 가지고 있는 모든 사원의 수를 구하여
-- 화면에 보여주세요.
select count(empno)
from emp;

-- [문제1] emp 테이블에서 관리자(mgr)의 수를
--        구하여 화면에 보여주세요.
select count(distinct mgr)
from emp;


-- [문제2] emp 테이블에서 보너스를 가진 사원의
--        수를 구하여 화면에 보여주세요.
select count(comm)
from emp;


-- [문제3] emp 테이블에서 모든 'SALESMAN'의 
--        급여 평균과 급여 최고액, 급여 최저액,
--        급여 합계액을 구하여 화면에 보여주세요.
select avg(sal), max(sal), min(sal), sum(sal)
from emp
where job = 'SALESMAN';


-- [문제4] emp 테이블에서 등록되어 있는 사원의 총 수,
--        보너스가 null 이 아닌 사원 수, 보너스의
--        평균, 등록되어 있는 부서의 수를 구하여 
--        화면에 보여주세요.
select count(*), count(comm), avg(comm), count(distinct deptno) 
from emp;


/*
  시퀀스(sequence)
  ==> 순서를 부여할 때 사용하는 문법.
      연속적인 번호를 만들어 주는 기능을 함.
      
  형식)
        create sequence 시퀀스이름
        start with n(시작번호 설정 - 기본적으로 기본값은 1)
        increment by n(증감번호 설정 - 기본적으로 기본값은 1)
        [maxvalue n(시퀀스 최대 번호 설정)] ==> 생략도 가능함.
        [minvalue n(시퀀스 최소 번호 설정)] ==> 생략도 가능함.
        cache / nocache ==> 캐쉬 메모리 사용 여부.
        
        1) cache : 시퀀스를 빠르게 제공하기 위해 미리 캐쉬 메모리에
                   시퀀스를 넣어 두고 준비하고 있다가 시퀀스 작업이
                   필요할 때 사용을 함.
                   
        2) nocache : cache 기능을 사용하지 않겠다는 의미.
*/


-- memo 라는 테이블을 만들어 보자.
create table memo(
    bunho number(5),
    title varchar2(100) not null,
    writer varchar2(50) not null,
    cont varchar2(1000) not null,
    regdate date,
    primary key(bunho)
);

-- memo 테이블 이용 시 사용할 시퀀스를 만들어 보자.
create sequence memo_seq
start with 1
increment by 1
cache 20;

-- memo 테이블에 시퀀스를 사용하여 데이터를 저장해 보자.
insert into memo
    values(memo_seq.nextval, '메모1', '홍길동', '길동이 메모~~~', sysdate);

insert into memo
    values(memo_seq.nextval, '장군 메모', '이순신', '이순신 장군 메모~~~', sysdate);
    
insert into memo
    values(memo_seq.nextval, '독립선언문', '유관순', '대한 독립 만세!!!', sysdate);
    
insert into memo
    values(memo_seq.nextval, '한글 메모', '세종대왕', '메모4', sysdate);
    
insert into memo
    values(memo_seq.nextval, '메모5', '신사임당', '신사임당 메모', sysdate);

commit;


/*
  제약조건
  - 테이블에 부적합한 자료가 입력되는 것을 방지하기 위해서
    테이블을 생성할 때 각 컬럼에 대하여 정의하는 여러 가지
    규칙을 정한 것을 말함.

  1) not null
  2) unique
  3) primary key : not null + unique
  4) foreign key
  5) check
*/

/*
  1) not null 제약 조건
     - null 값이 입력되지 못하게 하는 제약 조건.
     - 특정 열에 데이터의 중복 여부와는 상관없이 
       null 값을 허용하지 않는 제약 조건.
*/

create table null_test(
    col1 varchar2(10) not null,
    col2 varchar2(10) not null,
    col3 varchar2(10)
);

insert into null_test values('aa', 'aa1', 'aa2');

insert into null_test(col1, col2) values('bb', 'bb1');

insert into null_test(col1, col2) values('bb', '');  -- error 발생.


/*
  2) unique 제약 조건
     - 열에 저장할 데이터의 중복을 허용하지 않고자 할 때
       사용하는 제약 조건.
     - null 값을 허용함.
*/

create table unique_test(
    col1 varchar2(10) unique,
    col2 varchar2(10) unique,
    col3 varchar2(10) not null,
    col4 varchar2(10) not null
);

insert into unique_test values('aa', 'aa1', 'aaa1', 'aaaa1');

insert into unique_test values('bb', 'aa1', 'bbb1', 'bbbb1');  -- error 발생


/*
  3) primary key : not null + unique 제약 조건
     - 테이블에 하나만 존재해야 함.
     - 보통은 주민번호나 emp 테이블의 empno(사원 번호),
       학생의 학번 등이 primary key 의 대표적인 예
*/

/*
  4) foreign key 제약 조건
     - 다른 테이블의 필드(컬럼)를 참조해서 무결성을 검사하는 제약 조건.
     - 참조 키 : 부모 테이블의 컬럼(primary key)을 이야기 함.
     - 외래 키 : 자식 테이블의 컬럼을 이야기 함.
     - 자식 테이블의 컬럼의 값(데이터)이 부모 테이블에 없는 경우
       무결성의 규칙이 깨져 버림.
     - 외래 키가 존재하기 위해서는 우선적으로 부모 테이블이 먼저 만들어져야 함.
     - 옵션
       * on delete cascade
         ==> 부모 테이블의 데이터 삭제 시 해당 데이터를 참조하고 있는
             자식 테이블의 데이터까지 모두 삭제하는 옵션.
       * on delete set null
         ==> 부모 테이블의 데이터 삭제 시 해당 데이터를 참조하고 있는
             자식 테이블에 있는 컬럼에 있는 값을 null로 변경시키는 옵션.
*/

create table foreign_test(
    bunho number(5) primary key,
    irum varchar2(30) not null,
    dept number(3),
    constraint dept_fk foreign key(dept)
        references dept10(deptno)
        on delete set null
);


create table dept10( 
  deptno     number(2,0) primary key, 
  dname      varchar2(14), 
  loc        varchar2(13)
);


-- DEPT 테이블에 데이터 추가
insert into DEPT10 (DEPTNO, DNAME, LOC)
	values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept10 
	values(20, 'RESEARCH', 'DALLAS');
insert into dept10 
	values(30, 'SALES', 'CHICAGO');
insert into dept10 
	values(40, 'OPERATIONS', 'BOSTON');


insert into foreign_test values(1111, '홍길동', 30);

insert into foreign_test values(2222, '유관순', 10);

insert into foreign_test values(3333, '이순신', 50);  -- error 발생

commit;

-- dept10 테이블에서 10번 부서를 삭제를 해 보자.
delete from dept10 where deptno = 10;



/*
  5) check 제약 조건
     - 열에 저장할 수 있는 값의 범위 또는 패턴을 정의할 때
       사용되는 제약 조건.
*/

create table check_test(
    gender varchar2(6),
    constraint gender_chk check(gender in ('남', '여'))
);

insert into check_test values('남');

insert into check_test values('여');

insert into check_test values('남자');  -- error 발생



/*
  join ~ on 키워드
  - 테이블과 테이블을 연결하여 특정한 데이터를 얻고자 할 때 사용함.
  - 두 개 이상의 테이블에 정보가 나뉘어져 있을 때 사용함.
  - 중복해서 데이터가 저장되는 것을 막기 위해 테이블을 나누어 놓았음.
  - 두 개의 테이블로 나누어진 경우에는 데이터의 중복은 발생하지 않지만
    원하는 정보를 얻으려면 여러 번 질의를 해야 하는 불편함이 발생함.
  - 특정 사원이 소속된 부서의 부서명을 알고 싶은 경우에는 emp 테이블과
    dept 테이블을 넘나드는 작업이 생기므로 상당히 불편함. 그래서 두 개의
    테이블을 결합해서 원하는 결과를 얻어낼 수 있도록 하는 조인이라는
    기능이 생겨나게 되었음.
    
    조인의 종류
    1) Cross Join
    2) Equi Join
    3) Self Join
    4) Outer Join
*/

/*
  1) Cross Join
     - 두 개 이상의 테이블이 조인이 될 때 조건이 없이 테이블의 결합이
       이루어지는 조인임.
     - 테이블 상호간에 연결될 수 있는 모든 경우의 수를 산출하여 나타내는
       조인 방법임.
     - 현재는 사용을 안하는 조인 종류.
*/

select * 
from emp, dept;

/*
  2) Equi Join
     - 가장 많이 사용되는 조인 방법.
     - 조인의 대상이 되는 두 테이블에서 공통적으로 존재하는 컬럼의 값이
       일치하는 행을 연결하여 결과를 생성하는 방법.
     - 두 테이블이 조인을 하려면 일치되는 공통 컬럼을 사용해야 함.
*/

-- emp 테이블에서 사원의 사번, 이름, 담당업무, 부서번호 및
-- 부서명, 부서위치를 화면에 보여주세요.
-- ==> emp 테이블과 dept 테이블을 조인시켜 주어야 함.

select empno, ename, job, e.deptno, dname, loc
from emp e join dept d
on e.deptno = d.deptno;

-- emp 테이블에서 사원명이 'SCOTT' 사원의 부서명을 알고 싶다면???
select ename, d.deptno, dname
from emp e join dept d
on e.deptno = d.deptno
where ename = 'SCOTT';

-- [문제1] 부서명이 'RESEARCH' 인 사원의
--        사번, 이름, 급여, 부서명, 근무위치를 
--        화면에 보여주세요.
select empno, ename, sal, dname, loc
from emp e join dept d
on e.deptno = d.deptno
where dname = 'RESEARCH';


-- [문제2] emp 테이블에서 'NEW YORK'에 근무하는 사원의
--        이름과 급여, 부서번호를 화면에 보여주세요.
select ename, sal, e.deptno, loc
from emp e join dept d
on e.deptno = d.deptno
where loc = 'NEW YORK';


-- [문제3] emp 테이블에서 'ACCOUNTING' 부서 소속 사원의
--        이름과 담당업무, 입사일 그리고 부서번호, 부서명을
--        화면에 보여주세요.
select ename, job, hiredate, d.deptno, dname
from emp e join dept d
on e.deptno = d.deptno
where dname = 'ACCOUNTING';



-- [문제4] emp 테이블에서 담당업무가 'SALESMAN' 인 사원의
--        이름과 담당업무, 부서번호, 부서명, 근무위치를
--        화면에 보여주세요.
select ename, job, d.deptno, dname, loc
from emp e join dept d
on e.deptno = d.deptno
where job = 'SALESMAN';


select * from emp;