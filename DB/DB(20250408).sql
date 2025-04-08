insert into memo
    values(memo_seq.nextval, '�޸�6', '������', 'ȭ�� �޸�~~~', sysdate);
    
/*
  3) Self Join
     - �ϳ��� ���̺� ������ ������ �ؾ� �����͸� �� �� �ִµ�
       �� �״�� �ڱ� �ڽŰ� ������ �δ� ���� ����.
     - from �� ������ ���̺� �̸��� ������ �� �� ����� �� �� ����.
       ���� ���� ���̺��� �ϳ� �� �����ϴ� ��ó�� ����� �� �ֵ���
       ���̺� ��Ī�� �ٿ��� ����ؾ� ��.
*/

-- emp ���̺��� �� ����� �������� �̸��� ȭ�鿡 ����� ����.
-- ��) CLERK ����� ������ �̸��� KING �Դϴ�.
select e1.ename || ' ����� ������ �̸��� ' || e2.ename || ' �Դϴ�.'
from emp e1 join emp e2
on e1.mgr = e2.empno;

-- emp ���̺��� �����ڰ� 'BLAKE'�� �������
-- �̸��� �������� ȭ�鿡 �����ּ���.
select e1.ename, e1.job
from emp e1 join emp e2
on e1.mgr = e2.empno
where e2.ename = 'BLAKE';


/*
  4) Outer Join
     - 2�� �̻��� ���̺��� ������ �� �� ��� �� �� ���̺���
       �ش�Ǵ� �����Ͱ� �ٸ��� ���̺��� �����Ͱ� ��������
       �ʴ� ��� �� �����Ͱ� ����� ���� �ʴ� �������� �ذ��ϱ�
       ���� ���Ǵ� ���� �����.
     - ������ ������ ���̺��� �÷� �ڿ� '(+)' ��ȣ�� �ٿ� ����� ��.
*/

select ename, d.deptno, dname
from emp e join dept d
on e.deptno(+) = d.deptno;

select e1.ename, e1.job, e1.mgr
from emp e1 join emp e2
on e1.mgr = e2.empno(+);



/*
  dual ���̺�
  - ����Ŭ���� ��ü������ ������ �ִ� ���̺�.
  - �����ϰ� �Լ��� �̿��ؼ� ���, ������� Ȯ���� �� ����ϴ� ���̺�.
  - ���� �� ��, �� �÷����� ��� �ִ� ���̺�.
  - ��� �뵵 : Ư�� ���̺��� ������ �ʿ� ���� �Լ� �Ǵ�
               ����� �ϰ��� �� �� ����� ��.
*/

-- ����Ŭ���� ������ �ִ� �Լ���
-- 1. ��¥�� ���õ� �Լ���
--    1) sysdate : ���� �ý����� ��¥�� ���� ���� Ű����.
select sysdate from dual;

--    2) add_months(���� ��¥, ����(���� ��))
--       ==> ���� ��¥���� ���� ���� ���� �ִ� �Լ�.
select add_months(sysdate, 3) from dual;

--    3) next_day(���� ��¥, '����')
--       ==> �ٰ��� ��¥(����)�� ���� �ִ� �Լ�.
select next_day(sysdate, '������') from dual;


-- ��� ���� Ȯ�� ������
-- select * from NLS_SESSION_PARAMETERS
-- where parameter = 'NLS_DATE_LANGUAGE';

-- ��� ���� ������
-- alter sesison set NLS_DATE_LANGUAGE = ''

--    4) to_char(��¥, '��¥����)
--       ==> ���Ŀ� �°� ���ڿ��� ��¥�� ����� �ִ� �Լ�.
select to_char(sysdate, 'yyyy/mm/dd') from dual;

select to_char(sysdate, 'yyyy-mm-dd') from dual;

select to_char(sysdate, 'mm/dd/yyyy') from dual;

--    5) months_between('��������¥', ���糯¥)
--       ==> �� ��¥ ������ ���� ���� ����� �ִ� �Լ�.
select months_between('25/09/09', sysdate) from dual;

--    6) last_day()
--       ==> �־��� ��¥�� ���� ���� ������ ��¥�� ���� �ִ� �Լ�.
select last_day(sysdate) from dual;



-- 2. ���ڿ� ���õ� �Լ���
--    1-1) concat('���ڿ�1', '���ڿ�2')
--         ==> �� ���ڿ��� ����(����)�� �ִ� �Լ�.
select concat('�ȳ�', '�ϼ���!!!') from dual;

--    1-2) || ������ : ���ڿ��� �����ϴ� ������.
select '�氡' || '�氡' from dual;

--    2) upper() : �ҹ��ڸ� �빮�ڷ� �ٲپ� �ִ� �Լ�.
select upper('happy day') from dual;

--    3) lower() : �빮�ڸ� �ҹ��ڷ� �ٲپ� �ִ� �Լ�.
select lower(upper('happy day')) from dual;

--    4) substr('���ڿ�', x, y)
--       ==> ���ڿ��� x���� y�� ���̸�ŭ ������ �ִ� �Լ�.
select substr('ABCDEFG', 3, 2) from dual;   -- CD

--       ==> x ���� ������ ��쿡�� ������(����)�������� ������.
select substr('ABCDEFG', -3, 2) from dual;  -- EF

--    5) �ڸ����� �÷� �ִ� �Լ�.
--    5-1) lpad('���ڿ�', '��ü �ڸ���', '�þ �ڸ����� �� ���ڿ�')
select lpad('ABCDEFG', 15, '*') from dual;

--    5-2) rpad('���ڿ�', '��ü �ڸ���', '�þ �ڸ����� �� ���ڿ�')
select rpad('ABCDEFG', 15, '*') from dual;

--    6) ���ڸ� ���� �ִ� �Լ�.
--    6-1) ltrim() : ���� ���ڸ� ���� �ִ� �Լ�.
select ltrim('ABCDEFGA', 'ABCD') from dual;

--    6-1) rtrim() : ������ ���ڸ� ���� �ִ� �Լ�.
select rtrim('ABCDEFGA', 'AG') from dual;

--    7) replace() : ���ڿ��� ��ü�� �ִ� �Լ�.
--       ����) replace('���� ���ڿ�', '��ü�� ���ڿ�', '���ο� ���ڿ�')
select replace('Java Program', 'Java', 'Python') from dual;


-- [����1] emp ���̺��� ����� �Ʒ��� ���� ��������
-- ȭ�鿡 �����ּ���.
-- ���) 'SCOTT�� �������� ANALYST �Դϴ�.'
-- ��, concat() �Լ��� �̿��ϼ���.
select concat(ename, ' �� ��������'), concat(job, ' �Դϴ�.')
from emp;


-- [����2] emp ���̺��� ����� �Ʒ��� ���� ��������
-- ȭ�鿡 �����ּ���.
-- ���) 'SCOTT�� ������ 36000�Դϴ�.'
-- ��, concat() �Լ��� �̿��ϼ���.
select concat(concat(ename, ' �� ������ '), concat(sal * 12, ' �Դϴ�.'))
from emp;


-- [����3] member ���̺��� ����� �Ʒ��� ���� ��������
-- ȭ�鿡 �����ּ���.
-- ���) 'ȫ�浿 ȸ���� ������ �л��Դϴ�.'
-- ��, concat() �Լ��� �̿��ϼ���.
select concat(concat(memname, ' ȸ���� ������ '), concat(job, ' �Դϴ�.'))
from member;


-- [����4] emp ���̺��� ���, �̸�, �������� ȭ�鿡
-- �����ּ���. ��, �������� �ҹ��ڷ� �����Ͽ� �����ּ���.
select empno, ename, lower(job)
from emp;

-- [����5] �������� �ֹε�� ��ȣ �߿��� ��������� �����Ͽ�
-- ȭ�鿡 �����ּ���.
select substr('881212-1234567', 1, 6)
from dual;


-- [����6] emp ���̺��� �������� 'A' ��� ���ڸ�
-- '$'�� �ٲپ� ȭ�鿡 �����ּ���.
select replace(job, 'A', '$')
from emp;

-- [����7] member ���̺��� ������ '�л�' �� ������
-- '���л�'���� �ٲپ� ȭ�鿡 �����ּ���.
select replace(job, '�л�', '���л�')
from member;


--[����8] member ���̺��� �ּҿ� '�����' �� �� ������
-- '����Ư����'�� �ٲپ� ȭ�鿡 �����ּ���.
select replace(addr, '�����', '����Ư����')
from member;


-- 3. ���ڿ� ���õ� �Լ���
-- 1) abs(����) : ���밪�� ���� �ִ� �Լ�.
select abs(23) from dual;

select abs(-23) from dual;

-- 2) sign(����) : ���� ���� ����̸� 1, �����̸� -1, 0�̸� 0�� ��ȯ�� �ִ� �Լ�.
select sign(21) from dual;

select sign(13), sign(-13), sign(0) from dual;

-- 3) round(�Ǽ�) : �ݿø��� �� �ִ� �Լ�.
select round(1234.5678) from dual;  -- 1235

--    �ݿø��� �� �� �ڸ����� ����.
--    ����) round([����(�ʼ�)], [�ݿø���ġ(����)])
--          ==> ���� ���� �����ϸ� �ڿ���(����)������ ���ڸ���
--              ���� �ݿø��� �� ��.
select round(0.1234567, 6) from dual;  -- 0.123457

select round(2.3423557, 4) from dual;  -- 2.3424

select round(1256.5678, -2) from dual; -- 1300

-- 4) trunc() : �Ҽ��� ���� �ڸ����� �߶󳻴� �Լ�.
--    ����) trunc([����(�ʼ�)], [������ġ(����)])
select trunc(1234.1234567, 0) from dual;   -- 1234

select trunc(1234.1234567, 4) from dual;   -- 1234.1234

select trunc(1234.1234567, -3) from dual;  -- 1000


-- 5) ceil() : ������ �ø��� �� �ִ� �Լ�.
select ceil(22.8) from dual;    -- 23

select ceil(22.1) from dual;    -- 23

-- 6) power() : ������ �� �ִ� �Լ�.
select power(4, 3) from dual;

-- 7) mod() : �������� ���� �ִ� �Լ�.
select mod(77, 4) from dual;

-- 8) sqrt() : �������� ���� �ִ� �Լ�.
select sqrt(3) from dual;

select sqrt(16) from dual;


/*
  �ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
  �ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
  �ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
  
  ��������
  - �ϳ��� ������ �ȿ� ���ԵǾ� �ִ� �� �ٸ� �������� ����.
  - ������ �ȿ� �� �ٸ� �������� �����ϴ� ���� ����.
  - ���������� ���������� ���������� �����ϴ� �������� ������.
  - ���� �� ������ �����ؼ� ���� �� �ִ� ����� �ϳ��� ��ø��
    ���� �������� ����� ���� �� �ְ� ��.
  
  �� ���ǻ���
     - ���������� ��ȣ�� ��� ����ϴ� ���� ������.
     - �������� �ȿ����� order by ���� ����� �� ����.
     
  - ������ : �켱�� ���ʿ� �ִ� �������� ���� ��, �� �������
              ������ �ٱ��� �������� ������.
*/

-- emp ���̺��� �̸��� 'SCOTT' �� ����� �޿����� �� ����
-- �޿��� �޴� ����� ���, �̸�, ������, �޿��� ȭ�鿡 �����ּ���.
select empno, ename, job, sal
from emp
where sal >
(select sal 
from emp
where ename = 'SCOTT');  -- SCOTT�� �޿� : 3000




-- �������� ����
-- [����1] emp ���̺��� ��ձ޿����� �� ���� �޴� �����
-- ���, �̸�, ������, �޿�, �μ���ȣ�� ȭ�鿡 �����ּ���.
select empno, ename, job, sal, deptno
from emp
where sal <
(select avg(sal) from emp);  -- ��� �޿� : �� 2073


-- [����2] emp ���̺��� ����� 7521�� ����� �������� ����,
-- ����� 7934�� ����� �޿����� �� ���� �޴� ����� ���, �̸�, 
-- ������, �޿��� ȭ�鿡 �����ּ���.
select empno, ename, job, sal
from emp
where job =
(select job from emp where empno = 7521)  -- 7521 ��� ������ : SALESMAN
and
sal > (select sal from emp where empno = 7934);  -- 7934 ��� �޿� : 1300

-- [����3] emp ���̺��� �������� 'MANAGER' �� ����� �ּұ޿�����
-- �����鼭, �������� 'CLERK'�� �ƴ� ����� ���, �̸�, ������,
-- �޿��� ȭ�鿡 �����ּ���.
select empno, ename, job, sal
from emp
where sal < 
(select min(sal) from emp where job = 'MANAGER')  -- 'MANAGER' �ּұ޿� : 2450
and
job != 'CLERK';


-- [����4] �μ���ġ�� 'DALLAS' �� ����� ���, �̸�, �μ���ȣ, 
-- �������� ȭ�鿡 �����ּ���.
select empno, ename, deptno, job
from emp
where deptno =  
(select deptno 
from dept 
where loc = 'DALLAS');    -- 20�� �μ�


-- [����5] member ���̺� �ִ� ���� ���� �� ���ϸ����� ���� ����
-- ���� ��� ������ ȭ�鿡 �����ּ���.
select *
from member
where mileage = 
(select max(mileage) from member);   -- �ִ� ���ϸ��� : 10,000 ���ϸ���

-- [����6] emp ���̺��� 'SMITH' �� ������� �� ���� �޿���
-- �޴� ����� �̸���, �޿��� ȭ�鿡 �����ּ���.
select ename, sal
from emp
where sal > 
(select sal from emp where ename = 'SMITH');   -- SMITH ��� �޿� : 800


-- [����7] emp ���̺��� 10�� �μ� �޿��� ��� �޿����� ���� �޿��� �޴�
-- ������� �̸�, �޿�, �μ���ȣ�� ȭ�鿡 �����ּ���.
select ename, sal, deptno
from emp
where sal <
(select avg(sal) from emp where deptno = 10);   -- 10�� �μ� ��� �޿� : 2916


-- [����8] emp ���̺��� 'BLAKE'�� ���� �μ��� �ִ� �������
-- �̸��� �Ի�����, �μ���ȣ�� ȭ�鿡 �����ֵ�, 'BLAKE' �� �����ϰ�
-- ȭ�鿡 �����ּ���.
select ename, hiredate, deptno
from emp
where deptno = 
(select deptno from emp where ename = 'BLAKE')   -- BLAKE ��� �μ� ��ȣ : 30 
and ename != 'BLAKE';   

-- [����9] emp ���̺��� ��ձ޿����� �� ���� �޴� ������� ���,
-- �̸�, �޿��� ȭ�鿡 �����ֵ�, �޿��� �������� ���� ������ ȭ�鿡 
-- �����ּ���.
select empno, ename, sal
from emp
where sal > 
(select avg(sal) from emp)   -- ��ձ޿� : 2073
order by sal desc;


-- [����10] emp ���̺��� �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ���
-- �ٹ��ϰ� �ִ� ����� ����� �̸�, �μ���ȣ�� ȭ�鿡 �����ּ���.
select empno, ename, deptno
from emp
where deptno in
(select distinct deptno from emp where ename like '%T%');


-- [����11] 'SALES' �μ����� �ٹ��ϰ� �ִ� ������� �μ���ȣ,
-- �̸�, �������� ȭ�鿡 �����ּ���.
select deptno, ename, job
from emp
where deptno =
(select deptno from dept where dname = 'SALES');   -- SALES �μ����� �μ� ��ȣ : 30


-- [����12] emp ���̺��� 'KING'���� �����ϴ� ��� �����
-- �̸��� �޿�, �����ڸ� ȭ�鿡 �����ּ���.
select ename, sal, mgr
from emp
where mgr = 
(select empno from emp where ename = 'KING');


-- [����13] emp ���̺��� �ڽ��� �޿��� ��ձ޿����� ����, �̸���
-- 'S' �ڰ� ���� ����� ������ �μ����� �ٹ��ϴ� ��� ����� 
-- ���, �̸�, �޿�, �μ���ȣ�� ȭ�鿡 �����ּ���.
select empno, ename, sal, deptno
from emp
where sal > 
(select avg(sal) from emp)   -- emp ���̺� ���� ��ձ޿� : �� 2073
and
deptno in
(select distinct deptno from emp where ename like '%S%');


-- [����14] emp ���̺��� ���ʽ��� �޴� ����� �μ���ȣ, �޿��� ����
-- ����� �̸�, �޿�, �μ���ȣ�� ȭ�鿡 �����ּ���.
select ename, sal, deptno
from emp
where deptno in
(select distinct deptno from emp where comm is not null)  -- 30�� �μ�
and
sal in
(select sal from emp where comm is not null);  -- 30�� �μ�

-- [����15] products ���̺��� ��ǰ�� �ǸŰ����� �ǸŰ�����
-- ��պ��� ū ��ǰ�� ��ü ������ ȭ�鿡 �����ּ���.
select *
from products
where output_price > 
(select avg(output_price) from products);  -- �ǸŰ��� ��� : 1,253,800��


-- [����16] products ���̺� �ִ� �Ǹ� ���ݿ��� ��� ���� �̻���
-- ��ǰ ����� ���ϵ�, ����� ���� �� ������ ���� ū �ݾ��� ��ǰ��
-- �����ϰ� ����� ���Ͽ� ȭ�鿡 �����ּ���.
select *
from products
where output_price >=
(select avg(output_price) from products    -- �Ǹ� ���� ��� : 1,253,800��
where output_price <>
(select max(output_price) from products));    -- �Ǹ� ���� �� �ְ� �ǸŰ� : 8,000,000��


-- [����17] products ���̺��� ��ǰ���� �̸��� '������' �̶��
-- �ܾ ���Ե� ī�װ��� ���ϴ� ��ǰ����� ȭ�鿡 �����ּ���.
select *
from products
where category_fk = 
(select distinct category_fk from products
where products_name like '%������%');    -- ������ ī�װ� �ڵ� : 00010004


-- [����18] member ���̺� �ִ� �� ���� �� ���ϸ����� ���� ���� 
-- �ݾ��� ������ ������ ���ʽ� ���ϸ��� 5000���� �� �־� ����,
-- ���ϸ���, ���ϸ���+5000 ���� ȭ�鿡 �����ּ���.
select memname, mileage, mileage + 5000 "�߰� ���ϸ���"
from member
where mileage = 
(select max(mileage) from member);   -- �ִ� ���ϸ��� : 10,000 ���ϸ���


select * from emp;

select * from member;