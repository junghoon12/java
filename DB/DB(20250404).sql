-- sql developer ���� �� �� �ּ���

/*
  ������ �����ͺ��̽��� ���� ���
  
  1. ���̺�
     - ������ �����ͺ��̽��� �⺻������ �����͸� 2���� ������
       ǥ�� ������ �ϰ� ������ ��.
     - �̷��� ǥ ������ ������ ���� ������ ���̺�(table)�̶�� ��.
     - ���̺��� 2���� �����̹Ƿ� �����ٰ� �����ٷ� ������ �Ǿ� ����.
       * ������ : ��(row)
       * ������ : ��(column)
       
  2. ��
     - ���� �����Ϸ��� �ϳ��� ��ü�� �����ϴ� ��.
     - ���� ��ٸ� �л� �� ����� ���� ������ ������ ��.
     
  3. ��
     - �����ϴ� �����͸� ��ǥ�ϴ� �̸��� ���� Ư���� ������ ��.
     - ���� ���� ������ ����(�ڷ���)�� �ڷ����� ���� ������ 
       �ִ� ũ��, �ߺ� ���θ� �����ϰ� ��.
*/

/*
  ����Ŭ���� �Ӽ��� ���� �ֿ� �ڷ���(data type)
  1. number(n, n1) : ���� �ڷ���(����, �Ǽ�)
     * n : ��ü �ڸ���
     * n1 : �Ҽ��� �ڸ���
     * n - n1 : ���� �ڸ���
     ��) number(7,2) : ��ü �ڸ����� 7�ڸ��̰�, ������ 5�ڸ�,
                       �Ҽ��� �ڸ����� 2�ڸ�.
                    
  2. char(n) : ���ڿ� n���� ����Ǵ� �ڷ���. ==> ���� �ڷ���.
  
  3. varchar(n) : ���ڿ� n���� ����Ǵ� �ڷ���. ==> ���� �ڷ���.
                  �� ���� ����Ŭ������ ������� �ʴ� �ڷ���.
                  
  4. varchar2(n) : ���ڿ� n���� ����Ǵ� �ڷ���. ==> ���� �ڷ���.
                   �� �ѱ��� ������ �� ���ڴ� 2����Ʈ�� ����.
                   
  5. date : ��¥�� ����Ǵ� �ڷ���. ==> �ý����� ���� ��¥ �� �ð��� �����.
*/

/*
  ���Ἲ(Integrity) : �����ͺ��̽��� ����� ���� �װ��� ǥ���ϴ� ���� ������
                     ���� ���� ��ġ�ϴ� ��Ȯ���� �ǹ���.
                     
  ���Ἲ �������� : �����ͺ��̽��� ����� �������� ��Ȯ���� �����ϱ� ���ؼ�
                  ��Ȯ���� �ʴ� �����Ͱ� �����ͺ��̽� ���� ����Ǵ� ����
                  �����ϱ� ���� ����.
                  
  �����ͺ��̽� ������ ���Ǵ� ���Ἲ ���������� ����
  1. unique ���� ����
     ==> �ߺ��� �Ǹ� �� �Ǵ� ���� ����.
     
  2. not null ���� ����
     ==> ����(null) ���� ������� �ʴ� ���� ����.
     
  3. check ���� ����
     ==> Ư���� ���� �ƴ� �����Ͱ� ������ ���ϰ� �ϴ� ���� ����.
     
  4. �⺻Ű(primary key) ���� ����
     ==> unique + not null ���� ����.
     ==> �⺻ Ű�� �ش� ���̺��� ��ǥ�ϴ� �÷����ν��� ������ �����ϸ�,
         �ٸ� ���̺��� �ܷ�Ű���� ������ �� �ִ� Ű�μ��� �ڰ��� ����.
         
  5. �ܷ� Ű(foreign key) ���� ����
     ==> �ܷ� Ű�� �ٸ� ���̺��� �⺻ Ű(primary key)�� �����ϴ�
         �÷��� ������. ���⼭�� �ܷ� Ű ���� �����ϰ� �ִ� ���̺���
         �⺻ Ű�� ���� ������ ������ �� ����.
         �̸� ���� ���Ἲ(Referential Integrity) �̶�� ��.
*/

/*
  �л� ���̺��� ����� ����.
  ������� (�÷� - �Ӽ�)
  ==> �й�, �̸�, �а�, ����ó, ����, �ּ�, �����(������) ���
  
  ���̺��� ����� ����
  ����)
        create table ���̺��̸�(
           �й� �ڷ���(�ִ�ũ��) [��������],
           �̸� �ڷ���(�ִ�ũ��) [��������],
           �а� �ڷ���(�ִ�ũ��) [��������],
           ����ó �ڷ���(�ִ�ũ��) [��������],
           ���� �ڷ���(�ִ�ũ��) [��������],
           �ּ� �ڷ���(�ִ�ũ��) [��������],
           ����� �ڷ���(�ִ�ũ��) [��������]
        );
*/

-- ������ student ���̺��� ����� ����.

create table student(
    hakbun varchar2(10) primary key,
    irum varchar2(30) not null,
    major varchar2(50),
    phone varchar2(15) not null,
    age number(3),
    addr varchar2(500),
    regdate date not null
);

-- student ���̺� ������(�л� ����)�� �߰��� ����.
-- ����1)
-- ==> insert into student values('�й�������', '�̸�������', 
--            '�а�������', '����ó������', ���̵�����, '�ּҵ�����' sysdate);
insert into student values(
    '2025_001', 'ȫ�浿', '�����а�', '010-1111-1234', 28, '��⵵ ����', sysdate);

-- ����2)
-- ==> insert into student(not null �������� �÷����� ����)
--        values(�÷�������)
insert into student(hakbun, irum, phone, regdate)
    values('2025_002', '������', '010-2222-2345', sysdate);
    

-- student ���̺� �л� 3���� ������ ��������.
insert into student(hakbun, irum, phone, regdate)
    values('2025_003', '�̼���', '010-3333-3456', sysdate);

insert into student 
    values('2025_004', '�������', '�����а�', 
            '010-4444-4567', 50, '����� �߱� �����', sysdate);

insert into student(hakbun, irum, phone, regdate)
    values('2025_005', '�Ż��Ӵ�', '010-5555-5678', sysdate);
    
    

-- DEPT ���̺� ����
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

-- DEPT ���̺� ������ �߰�
insert into DEPT (DEPTNO, DNAME, LOC)
	values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept 
	values(20, 'RESEARCH', 'DALLAS');
insert into dept 
	values(30, 'SALES', 'CHICAGO');
insert into dept 
	values(40, 'OPERATIONS', 'BOSTON');

-- EMP ���̺� ������ �߰�
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

-- ���࿡ ���̺� �÷��� �߰��ؾ� �ϴ� ���
-- ����) alter table ���̺��̸� add(�߰��� �÷��� �ڷ���(ũ��) [��������]);
alter table student add(grade number(1));

-- ���̺��� �÷��� �����ؾ� �ϴ� ���(�÷��� ��ü���� ���� ����)
-- ����) alter table ���̺��̸� modify(�÷��� �ڷ���(ũ��));
alter table student modify(grade varchar2(1));

-- ���̺��� �÷����� �����ؾ� �ϴ� ���
-- ����) alter table ���̺��̸� rename column �����÷��� to �������÷���;
alter table student rename column addr to address;

-- ���̺��� �÷��� �����ؾ� �ϴ� ���
-- ����) alter table ���̺��̸� drop column �÷���;
alter table student drop column grade;

/*
  1. DDL(Data Define Language : ������ ���� ���)
     - create : �����ͺ��̽� �Ǵ� ���̺��� �����ϴ� ��ɾ�.
     - alter : ���̺��� �����ϴ� ��ɾ�.
     - drop : �����ͺ��̽� �Ǵ� ���̺��� �����ϴ� ��ɾ�.
     - truncate : ���̺��� �ʱ�ȭ�ϴ� ��ɾ�.
     
  2. DML(Data Manipulation Language : ������ ���� ���)
     ==> �����ͺ��̽����� ���� ���� ����ϴ� ��ɾ�.
     - select : �����͸� �˻��ϴ� ��ɾ�.
     - insert : �����͸� �߰��ϴ� ��ɾ�.
     - update : �����͸� �����ϴ� ��ɾ�.
     - delete : �����͸� �����ϴ� ��ɾ�.
     
  3. DCL(Data Control Language : ������ ���� ���)
     - grant : Ư�� �����ͺ��̽� ����ڿ��� �۾��� Ư�� ����
               ������ �ο��ϴ� ��ɾ�.
     - revoke : Ư�� �����ͺ��̽� ����ڿ��� �۾��� Ư�� ����
                ������ �����ϴ� ��ɾ�.
     - commit : Ʈ����� �۾��� �Ϸ��ϴ� ��ɾ�.
     - rollback : Ʈ����� �۾��� ����ϰų�, ���� ���·�
                  �����ϴ� ������ �ϴ� ��ɾ�.
*/


-- �����͸� �˻��ϴ� ��ɾ�.
-- student ���̺� �ִ� ��� �����͸� ȭ�鿡 �����ּ���.
-- ����) select * from ���̺��̸�;
select * from student;

-- ���� ���� �÷��� ���̰� �ϰ� ���� ���
-- ����) select �÷���1, �÷���2,.... �÷���n from ���̺��̸�;
select hakbun, irum, phone from student;

-- [����1] emp ���̺��� empno, ename, job, deptno �÷���
--         ȭ�鿡 �����ּ���.
select empno, ename, job, deptno from emp;

-- [����2] emp ���̺��� �̸�, �Ի���, �޿��� ȭ�鿡 �����ּ���.
select ename, hiredate, sal from emp;

-- [����3] emp ���̺��� ���, �̸�, ������, ���ʽ��� ȭ�鿡 �����ּ���.
select empno, ename, job, comm from emp;

-- [����4] emp ���̺��� ���, �̸�, �޿�, ���ʽ�, �޿� + ���ʽ� �����
--         ȭ�鿡 �����ּ���.
select empno, ename, sal, comm, sal + comm from emp;

-- null ���� ������ �÷��� �ٸ� �÷��� ������ �ϰ� �Ǹ�
-- ��� null ������ ó���� �Ǵ� ������ �߻�.

-- nvl() �Լ� : null ���� Ư���� ������ ������� �ִ� �Լ�.
--             ��� �ڷ����� ������ ������.
--             nvl() �Լ��� ����� ������ ��ȯ�Ǵ� ����
--             �ڷ����� ��ġ���� �־�� ��.
-- ����) nvl(null ���� ��� �ִ� �÷���, ������ ��)
select empno, ename, sal, comm, sal + nvl(comm, 0) from emp;

-- nvl2() �Լ� : �ڹٿ����� 3�׿����ڿ� ����� �Լ�.
-- ����) nvl2(�÷���, expr1, expr2)
--       ==> �÷��� ��� �ִ� ���� null�� �ƴϸ� expr1 ���� ��ȯ.
--       ==> �÷��� ��� �ִ� ���� null�̸� expr2 ���� ��ȯ.
select empno, ename, sal, comm, sal + nvl2(comm, comm, 0) from emp;

-- as Ű���� : �÷��� ����(title)�� �̸��� �����Ű�� Ű����.
--            ��Ī �Ǵ� �����̶�� ��.
--            ����� ������ �÷��� �ٷ� �ڿ� ����� ��.
--            �÷���� ��Ī ���̿� as ��� Ű���带 �־��ָ� ��.
--            ��Ī�� "" (�ֵ���ǥ) �ȿ� �ۼ��� �ؾ� ��.
--            as ��� Ű���带 �����ص� ��.
select empno, ename, sal, comm, 
    sal + nvl2(comm, comm, 0) "�޿� + ���ʽ�" from emp;
    
-- emp ���̺��� �� ����� �������� ȭ�鿡 �����ּ���.
select job from emp;

-- emp ���̺��� �� ����� ������(mgr)�� ȭ�鿡 �����ּ���.
select mgr from emp;

/*
  distinct Ű���� : �ߺ��� ������ �ִ� ��ɾ�.
  - �ַ� �ϳ��� �÷����� �ߺ��� ���� �����ϰ� ������ �� �����.
  - distinct Ű����� �׻� select Ű���� ������ ����Ѵ�.
  - distinct Ű���� �ڿ� ������ �÷����� ��� distinct�� ������ �޴´�.
  - distinct Ű���� �ڿ� ���� ���� �÷��� ����� �Ǹ� �ش� �÷�����
    �ߺ��� �Ǿ� ��Ÿ���� �ʴ´�.
*/

-- emp ���̺��� �� ����� �������� �ߺ��� ���� �ʰ� ȭ�鿡 �����ּ���.
select distinct job from emp;

-- emp ���̺��� �� ����� �����ڸ� �ߺ��� ���� �ʰ� ȭ�鿡 �����ּ���.
select distinct mgr from emp;

-- emp ���̺��� �� ����� �μ���ȣ�� �ߺ��� ���� �ʰ� ȭ�鿡 �����ּ���.
select distinct deptno from emp;



-- member ��� ���̺��� ����� ����.

create table member(
    memno number primary key,          -- ȸ�� ��ȣ
    memid varchar2(20) not null,       -- ȸ�� ���̵�
    memname varchar2(30) not null,     -- ȸ�� �̸�
    mempwd varchar2(20) not null,      -- ȸ�� ��й�ȣ
    age number,                        -- ȸ�� ����
    mileage number,                    -- ȸ�� ���ϸ���
    job varchar2(30),                  -- ȸ�� ����
    addr varchar2(500),                -- ȸ�� �ּ�
    regdate date not null              -- ȸ�� ������
);


-- member ���̺� ȸ���� ������ ������ ����.
insert into member
    values(1, 'id1', 'ȫ�浿', '1111', 25, 0, '�л�',
            '�λ�� ������', '2013-08-08');

insert into member
    values(2, 'kimkd', '��浿', '2222', 30, 1500, 'ȸ���',
            '����� ������', '2013-09-15');

insert into member
    values(3, 'id3', '������', '3333', 33, 10000, 'ȸ���',
            '�λ�� �߱�', '2013-09-09');
            
insert into member
    values(4, 'kimyh', '�迵��', '4444', 18, 3000, '�л�',
            '��󳲵� �����', '2014-05-23');
            
insert into member
    values(5, 'id5', '�ڸ���', '5555', 45, 5000, '�ֺ�',
            '��⵵ �����ֽ�', '2013-12-01');

insert into member
    values(6, 'id6', '��ö��', '6666', 55, 0, '����',
            '���ֵ� ��������', '2013-01-10');

insert into member
    values(7, 'hong', 'ȫ�浿', '7777', 14, 0, '�л�',
            '���ϵ� ���ֽ�', '2013-12-25');

insert into member
    values(8, 'id8', '�����', '8888', 31, 0, '����',
            '����� ������', '2013-04-22');

insert into member
    values(9, 'id9', '������', '9999', 25, 0, '�л�',
            '������ ������', '2013-10-10');

insert into member
    values(10, 'id10', 'ȫ�浿', '1010', 52, 10000, '����',
            '����� ���ϱ�', '2013-09-15');


-- ī�װ� ���̺��� ����� ����.
create table category(
    cnum number unique,                        -- ī�װ� ��ȣ
    category_code varchar2(8),                 -- ī�װ� �ڵ�
    category_name varchar2(30) not null,       -- ī�װ� �̸�
    primary key(category_code)
);


-- ī�װ� ���̺� �����͸� ������ ����.
insert into category values(1, '00010000', '������ǰ');
insert into category values(2, '00010001', 'TV');
insert into category values(3, '00010002', '��ǻ��');
insert into category values(4, '00010003', '��Ʈ��');
insert into category values(5, '00010004', '������');
insert into category values(6, '00020000', '�Ƿ���ǰ');
insert into category values(7, '00020001', '����');
insert into category values(8, '00020002', '�ӿ�');
insert into category values(9, '00020003', '����');
insert into category values(10, '00030000', '����');
insert into category values(11, '00030001', '��ǻ�͵���');
insert into category values(12, '00030002', '�Ҽ�');


-- ��ǰ ���� ���̺��� ����� ����.
create table products(
    pnum number(11) primary key,                   -- ��ǰ ��ȣ
    category_fk varchar2(8) not null,              -- ī�װ� �ڵ�
    products_name varchar2(50) not null,           -- ��ǰ��
    ep_code_fk varchar2(5) not null,               -- ��ǰ �ڵ�
    input_price number(10) default 0 not null,     -- ��ǰ �԰� ����
    output_price number(10) default 0 not null,    -- ��ǰ ��� ����
    trans_cost number(5) default 0 not null,       -- ��ǰ ��ۺ�
    mileage number(6) default 0 not null,          -- ��ǰ ���ϸ���
    company varchar2(30),                          -- ��ǰ ������
    constraint category_ref foreign key(category_fk) 
        references category(category_code)
);

-- ��ǰ �����͸� ������ ����.
insert into products
   values(1, '00010001', 'S ������ TV', '00001', 5000000, 8000000, 0, 100000, '�Ｚ');
insert into products
   values(2, '00010001', 'L TV', '00002', 1000000, 1500000, 0, 50000, 'LG');
insert into products
   values(3, '00010004', 'S ������', '00001', 1000000, 1100000, 5000, 100000, '�Ｚ');
insert into products
   values(4, '00010000', 'C ���', '00003', 200000, 220000, 5500, 0, '����');
insert into products
   values(5, '00010004', 'L ������', '00003', 1200000, 1300000, 0, 0, 'LG');
insert into products
   values(6, '00020001', '��������', '00002', 100000, 150000, 2500, 0, '');
insert into products
   values(7, '00020001', '��������', '00002', 120000, 200000, 0, 0, '');
insert into products
   values(8, '00020002', '�簢��Ƽ', '00002', 10000, 20000, 0, 0, '���𰡵�');
insert into products
   values(9, '00020003', '�ủ����', '00002', 15000, 18000, 0, 0, '');
insert into products
   values(10, '00030001', '������ �ø���', '00001', 25000, 30000, 2000, 0, '���');

-- [����1] member ���̺��� ȸ���� �̸��� ����, ������ ȭ�鿡 �����ּ���.
select memname, age, job from member;

-- [����2] products ���̺��� ��ǰ��, �԰�, ���, �����縦 ȭ�鿡 �����ּ���.
select products_name, input_price, output_price, company from products;

-- [����3] member ���̺��� ������ �Ʒ��� ���� ȭ�鿡 ����� ������.
-- ����) ȫ�浿 ȸ���� ������ �л��̰�, ���ϸ����� 0 ���ϸ��� �Դϴ�.
select memname || ' ȸ���� ������ ' || job || '�̰�, ���ϸ����� ' 
        || mileage || ' ���ϸ��� �Դϴ�.' from member; 


-- ��) KING ����� ������ 60000 �Դϴ�.
-- || : ����Ŭ���� ���� ������.
select ename || ' ����� ������ ' || sal *12 || ' �Դϴ�.'
    as "����� ����" from emp;

commit;
