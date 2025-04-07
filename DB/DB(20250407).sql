/*
  �ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
  �ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
  �ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
  
  where ������
  - ��� �����͸� ��ȸ�ϴ� ���� �ƴ϶� ����ڰ� ���ϴ� �����͸� 
    ��ȸ�� ��쿡 ����� ��. 
  - where �������� �ڷḦ ���͸��� �� ���Ǵ� Ű����.
  - where �������� from ���̺�� �ڿ� ����� �ؾ� ��.
  
  ����) select �÷���1, �÷���2,......
       from ���̺��
       where ������;
       
  �������� ���� ����
  1) = : ������ ������ ���� Ȯ��.
  2) < : ������ ������ ���� Ȯ��.
  3) <= : ������ �۰ų� ������ ���� Ȯ��.
  4) > : ������ ū�� ���� Ȯ��.
  5) >= : ������ ũ�ų� ������ ���� Ȯ��.
  6) != : ������ ���� ������ ���� Ȯ��.
  7) <> : ������ ���� ������ ���� Ȯ��. ==> != �� ���� �ǹ�.
  8) between A and B : A�� B ���̿� �ִ��� ���� Ȯ��.
  9) in(list) : list �� �߿� ��� �ϳ��� ��ġ�ϴ��� ���� Ȯ��.
  10) not between A and B : A�� B ���̿� ���� ������ ���� Ȯ��.
      ==> A, B ���� �������� ����.
  11) not in(list) : list ���� ��ġ���� �ʴ��� ���� Ȯ��.
*/

select * from emp;

-- emp ���̺��� �������� 'MANAGER' �� ����� 
-- ��� ������ �����ּ���.
select * from emp
where job = 'MANAGER';

-- emp ���̺��� �������� 'SALESMAN' �� ����� 
-- ��� ������ ȭ�鿡 �����ּ���.
select * from emp
where job = 'SALESMAN';


-- [����1] emp ���̺��� �������� 'CLERK' �� �����
-- ���, �̸�, ������, �޿��� ȭ�鿡 �����ּ���.
select empno, ename, job, sal
from emp
where job = 'CLERK';


-- [����2] emp ���̺��� 1982�� 1�� 1�� ���Ŀ� �Ի���
-- ����� ���, �̸�, ������, �޿�, �Ի����ڸ� ȭ�鿡 �����ּ���.
select empno, ename, job, sal, hiredate
from emp
where hiredate >= '82/01/01';


-- [����3] emp ���̺��� �޿��� 1300 ~ 1500 ������ �����
-- �̸��� ������, �޿�, �μ���ȣ�� ȭ�鿡 �����ּ���.
select ename, job, sal, deptno
from emp
-- where sal >= 1300 and sal <= 1500;
where sal between 1300 and 1500;


-- [����4] emp ���̺��� ����� 7902, 7788, 7566 �� �����
-- ���, �̸�, �������� ȭ�鿡 �����ּ���.
select empno, ename, job
from emp
-- where empno = 7902 or empno = 7788 or empno = 7566;
where empno in (7902, 7788, 7566);


--[����5] emp ���̺��� ���ʽ��� 300�̰ų� 500�̰ų�
-- 1400�� ����� ��� ������ ȭ�鿡 �����ּ���.
select *
from emp
-- where comm = 300 or comm = 500 or comm = 1400;
where comm in ( 300, 500, 1400);


-- [����6] member ���̺��� �̸��� ȫ�浿�̸鼭 ������
-- �л��� ȸ���� ��� ������ ȭ�鿡 �����ּ���.
select *
from member
where memname = 'ȫ�浿' and job = '�л�';


-- [����7] products ���̺��� �����簡 '�Ｚ' �Ǵ� '����'
-- �̸鼭 �԰��� 100���� ������ ��ǰ�� ��ǰ��� �԰� �׸���
-- ����� ȭ�鿡 �����ּ���.
select products_name, input_price, output_price
from products
where company in ('�Ｚ', '����') and input_price <= 1000000;


-- [����8] emp ���̺��� �޿��� 1100 �̻��̰�, ��������
-- 'MANAGER' �� ����� ���, �̸�, ������, �޿��� ȭ�鿡 �����ּ���.
select empno, ename, job, sal
from emp
where sal >= 1100 and job = 'MANAGER';


/*
  �ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�

  like Ű���� : �˻��� �ϴ� Ű����.
  
  1) where ename like '%S%'  
     ==> ename �÷��� S�ڸ� �����ϴ� ����� �̸��� �˻�.
     
  2) where ename like 'S%'
     ==> ename �÷����� ù���ڰ� S�ڷ� �����ϴ� ����� �̸��� �˻�.
     
  3) where ename like '%S'
     ==> ename �÷����� ������ ���ڰ� S�ڷ� ������ ����� �̸��� �˻�.
     
  4) where ename like '_S%'
     ==> ename �÷�����  �ι�° ���ڰ� S�ڸ� �����ϴ� ����� �̸��� �˻�.
*/

-- [����1] emp ���̺��� ����� 'M' �̶�� ���ڸ� �����ϴ�
-- ����� ��� ������ ȭ�鿡 �����ּ���.
select *
from emp
where ename like '%M%';


-- [����2] emp ���̺��� ������� �ι�° ���ڿ� 'I' �̶�� 
-- ���ڸ� �����ϴ� ����� ��� ������ ȭ�鿡 �����ּ���.
select * 
from emp
where ename like '_I%';


-- [����3] emp ���̺��� ����� �̸��� 'S' ��� ���ڷ� ������
-- ����� ����� �̸�, ������, �μ���ȣ�� ȭ�鿡 �����ּ���.
select empno, ename, job, deptno
from emp
where ename like '%S';

-- [����4] emp ���̺��� ����� ����° ���ڰ� 'R' �̶�� 
-- ���ڸ� �����ϴ� ����� �̸��� ������, �޿��� ȭ�鿡 �����ּ���.
select ename, job, sal
from emp
where ename like '__R%';


-- [����5] emp ���̺��� ����� �ι�° ���ڰ� 'O' ��� 
-- ���ڸ� �����ϴ� ����� ��� ������ ȭ�鿡 �����ּ���.
select *
from emp
where ename like '_O%';


-- [����6] emp ���̺��� �Ի�⵵�� 82�⵵�� ����� 
-- ���, �̸�, ������, �Ի����ڸ� ȭ�鿡 �����ּ���.
select empno, ename, job, hiredate
from emp
where hiredate like '82%';


-- [����7] member ���̺��� ���� '��'�� ���� ������ 
-- ȸ���� ��� ������ ȭ�鿡 �����ּ���.
select *
from member
where memname like '��%';


-- [����8] member ���̺��� �ּҿ� '�����' �� ���� 
-- ȸ���� �̸�, �ּ�, ������ ȭ�鿡 �����ּ���.
select memname, addr, job
from member
where addr like '�����%';


-- [����9] products ���̺��� ��ǰ�� '������' �� 
-- �����ϴ� ��ǰ�� ��ǰ��, �԰�, ���, �����縦
-- ȭ�鿡 �����ּ���.
select products_name, input_price, output_price, company
from products
where products_name like '%������%';



/*
  �ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
  
  order by ��
  
  - �ڷḦ �����Ͽ� ��Ÿ�� �� ����ϴ� ��ɾ�.
  - order by ���� ����� ���� select ������ �� �������� ��ġ�ؾ� ��.
  - asc : �������� ����
  - desc : �������� ����
  - �⺻������ order by ���� ��� �ÿ��� �������� ������ default(�⺻��)��.
  - �������� ������ ��쿡�� asc�� �����ص� ��.
*/

-- member ���̺��� �̸��� �������� ������������ ������ �Ͽ�
-- ��� ������ ȭ�鿡 �����ּ���.
-- ��, �̸��� ���� ��쿡�� ���̸� �������� �������� �����ϼ���.
select *
from member
order by memname asc, age desc;



-- [����1] emp ���̺��� �μ���ȣ�� �������� �������� ������ �ϰ�,
-- �μ���ȣ�� ���� ��� �޿��� �������� ������������ ������ �Ͽ�
-- ȭ�鿡 �����ּ���.
-- ��, �޿��� ���� ��� �����ȣ�� �������� �������� ����
select *
from emp
order by deptno, sal desc, deptno;

--[����2] products ���̺��� �ǸŰ����� �������� ������������
-- ������ �Ͽ� ��� ������ ȭ�鿡 �����ּ���.
select *
from products
order by output_price desc;

-- [����3] products ���̺��� ��ۺ� �������� ������������
-- �����ϼ���. ��, ��ۺ� ���� ��� ���ϸ����� ��������
-- ������������ �����Ͽ� ��� ������ ȭ�鿡 �����ּ���.
select *
from products
order by trans_cost desc, mileage desc;


-- [����4] emp ���̺��� �Ի����ڰ� ������ ������� �ֱٿ� 
-- �Ի��� ����� �������� �����ϵ�, �����, �Ի����ڸ�
-- ȭ�鿡 �����ּ���.
select ename, hiredate
from emp
order by hiredate;


-- [����5] emp ���̺��� �޿��� �������� ������������ ������
-- �Ͽ� ��� ������ ȭ�鿡 �����ּ���.
select *
from emp
order by sal desc;


-- [����6] emp ���̺��� �޿��� 1100 �̻��� ������� ������
-- �����ֵ�, �Ի����ڰ� ���� ������ �����Ͽ� ȭ�鿡 �����ּ���.
select *
from emp
where sal >= 1100
order by hiredate;


-- [����7] emp ���̺��� �μ���ȣ�� �������� �������� �����Ͽ�
-- ��Ÿ����, �μ���ȣ�� ���� ��� �������� �������� ���������Ͽ�
-- �����ϼ���. ���� �������� ���ٰ� �ϸ�, �޿��� �������� ����
-- ������ �����Ͽ� ��� ������ ȭ�鿡 �����ּ���.
select *
from emp
order by deptno, job, sal desc;


/*
  not Ű���� : ����
  - ������ ó���ϴ� ��쿡�� �켱�� ������ �������� �ۼ��� �Ŀ�
    ������ �ǹ��� not Ű���带 �ٿ��ָ� ��.
*/

-- emp ���̺��� �������� 'MANAGER', 'CLERK', 'ANALYST' ��
-- �ƴ� ����� ���, �̸�, ������, �޿��� ȭ�鿡 �����ּ���.
select empno, ename, job, sal
from emp
where job not in('MANAGER', 'CLERK', 'ANALYST');



-- [����1] emp ���̺��� �̸��� 'S' �ڰ� ���� �ʴ�
-- ����� �̸��� �������� ȭ�鿡 �����ּ���.
select ename, job
from emp
where ename not like '%S%';


-- [����2] emp ���̺��� �μ���ȣ�� 10�� �μ��� �ƴ� �����
-- �̸�, ������, �μ���ȣ�� ȭ�鿡 �����ּ���.
select ename, job, deptno
from emp
-- where not deptno = 10;
-- where deptno != 10;
where deptno <> 10;

-- [����3] member ���̺��� �ּҰ� '�����' �� �ƴ� ȸ����
-- ��� ������ ȭ�鿡 �����ּ���.
select *
from member
where  addr not like '�����%';


-- [����4] products ���̺��� ����� 100���� �̸��� �ƴ�
-- ��ǰ�� ��ǰ��� ����� ȭ�鿡 �����ּ���.
select products_name, output_price
from products
where not output_price < 1000000;

-- [����5] emp ���̺��� ���ʽ��� null�� �ƴ� ����� 
-- ��� ������ ȭ�鿡 �����ּ���.
select *
from emp
where comm is not null;


/*
  - ����� ������ ����� ���
  - ����) create user ����ڰ����� identified by ��й�ȣ;
  
  - ������� ������ ����ϱ� ���� ������ ����.
  - ����) grant connect, resource to ����ڰ�����;

  - role : ����ڿ��� ���� ȿ�������� ������ �ο��� �� �ֵ���
           ���� ���� ������ ���� ���� ���� ����.
    
    * connect role
      ==> ����Ŭ �����ͺ��̽��� ������ �� �ִ� ���� ���� ��
          ����ڰ� �����ͺ��̽��� ������ �����ϵ��� �ϱ� ���ؼ�
          ���� �⺻���� �ý��� ������ ���� ���� ���� ����.
    
    * resource role
      ==> ����ڰ� ���̺��� ������ �� �ֵ��� �ϱ� ���ؼ�
          �ý��� ������ ���� ���� ���� ����.
          ���� insert, update, delete ������ ����� ��
          �ִ� ������ ���� ���� ���� ����.
*/

/*
  �׷��Լ�
  ==> ���� �� �Ǵ� ���̺� ��ü�� ���Ͽ� �Լ��� ����Ǿ�
      �ϳ��� ������� �������� �Լ�.
      
  1) avg() : ��հ��� ���ϴ� �Լ�.
  2) count() : ��(���ڵ�)�� ������ ���ϴ� �Լ�.
               ==> null ���� �����ϰ� ���� ������ ����.
  3) max() : �ִ밪�� ���ϴ� �Լ�.
  4) min() : �ּҰ��� ���ϴ� �Լ�.
  5) sum() : �� ���� ���ϴ� �Լ�.
*/

-- emp ���̺��� ����� ������ �ִ� ��� ����� ���� ���Ͽ�
-- ȭ�鿡 �����ּ���.
select count(empno)
from emp;

-- [����1] emp ���̺��� ������(mgr)�� ����
--        ���Ͽ� ȭ�鿡 �����ּ���.
select count(distinct mgr)
from emp;


-- [����2] emp ���̺��� ���ʽ��� ���� �����
--        ���� ���Ͽ� ȭ�鿡 �����ּ���.
select count(comm)
from emp;


-- [����3] emp ���̺��� ��� 'SALESMAN'�� 
--        �޿� ��հ� �޿� �ְ��, �޿� ������,
--        �޿� �հ���� ���Ͽ� ȭ�鿡 �����ּ���.
select avg(sal), max(sal), min(sal), sum(sal)
from emp
where job = 'SALESMAN';


-- [����4] emp ���̺��� ��ϵǾ� �ִ� ����� �� ��,
--        ���ʽ��� null �� �ƴ� ��� ��, ���ʽ���
--        ���, ��ϵǾ� �ִ� �μ��� ���� ���Ͽ� 
--        ȭ�鿡 �����ּ���.
select count(*), count(comm), avg(comm), count(distinct deptno) 
from emp;


/*
  ������(sequence)
  ==> ������ �ο��� �� ����ϴ� ����.
      �������� ��ȣ�� ����� �ִ� ����� ��.
      
  ����)
        create sequence �������̸�
        start with n(���۹�ȣ ���� - �⺻������ �⺻���� 1)
        increment by n(������ȣ ���� - �⺻������ �⺻���� 1)
        [maxvalue n(������ �ִ� ��ȣ ����)] ==> ������ ������.
        [minvalue n(������ �ּ� ��ȣ ����)] ==> ������ ������.
        cache / nocache ==> ĳ�� �޸� ��� ����.
        
        1) cache : �������� ������ �����ϱ� ���� �̸� ĳ�� �޸𸮿�
                   �������� �־� �ΰ� �غ��ϰ� �ִٰ� ������ �۾���
                   �ʿ��� �� ����� ��.
                   
        2) nocache : cache ����� ������� �ʰڴٴ� �ǹ�.
*/


-- memo ��� ���̺��� ����� ����.
create table memo(
    bunho number(5),
    title varchar2(100) not null,
    writer varchar2(50) not null,
    cont varchar2(1000) not null,
    regdate date,
    primary key(bunho)
);

-- memo ���̺� �̿� �� ����� �������� ����� ����.
create sequence memo_seq
start with 1
increment by 1
cache 20;

-- memo ���̺� �������� ����Ͽ� �����͸� ������ ����.
insert into memo
    values(memo_seq.nextval, '�޸�1', 'ȫ�浿', '�浿�� �޸�~~~', sysdate);

insert into memo
    values(memo_seq.nextval, '�屺 �޸�', '�̼���', '�̼��� �屺 �޸�~~~', sysdate);
    
insert into memo
    values(memo_seq.nextval, '��������', '������', '���� ���� ����!!!', sysdate);
    
insert into memo
    values(memo_seq.nextval, '�ѱ� �޸�', '�������', '�޸�4', sysdate);
    
insert into memo
    values(memo_seq.nextval, '�޸�5', '�Ż��Ӵ�', '�Ż��Ӵ� �޸�', sysdate);

commit;


/*
  ��������
  - ���̺� �������� �ڷᰡ �ԷµǴ� ���� �����ϱ� ���ؼ�
    ���̺��� ������ �� �� �÷��� ���Ͽ� �����ϴ� ���� ����
    ��Ģ�� ���� ���� ����.

  1) not null
  2) unique
  3) primary key : not null + unique
  4) foreign key
  5) check
*/

/*
  1) not null ���� ����
     - null ���� �Էµ��� ���ϰ� �ϴ� ���� ����.
     - Ư�� ���� �������� �ߺ� ���οʹ� ������� 
       null ���� ������� �ʴ� ���� ����.
*/

create table null_test(
    col1 varchar2(10) not null,
    col2 varchar2(10) not null,
    col3 varchar2(10)
);

insert into null_test values('aa', 'aa1', 'aa2');

insert into null_test(col1, col2) values('bb', 'bb1');

insert into null_test(col1, col2) values('bb', '');  -- error �߻�.


/*
  2) unique ���� ����
     - ���� ������ �������� �ߺ��� ������� �ʰ��� �� ��
       ����ϴ� ���� ����.
     - null ���� �����.
*/

create table unique_test(
    col1 varchar2(10) unique,
    col2 varchar2(10) unique,
    col3 varchar2(10) not null,
    col4 varchar2(10) not null
);

insert into unique_test values('aa', 'aa1', 'aaa1', 'aaaa1');

insert into unique_test values('bb', 'aa1', 'bbb1', 'bbbb1');  -- error �߻�


/*
  3) primary key : not null + unique ���� ����
     - ���̺� �ϳ��� �����ؾ� ��.
     - ������ �ֹι�ȣ�� emp ���̺��� empno(��� ��ȣ),
       �л��� �й� ���� primary key �� ��ǥ���� ��
*/

/*
  4) foreign key ���� ����
     - �ٸ� ���̺��� �ʵ�(�÷�)�� �����ؼ� ���Ἲ�� �˻��ϴ� ���� ����.
     - ���� Ű : �θ� ���̺��� �÷�(primary key)�� �̾߱� ��.
     - �ܷ� Ű : �ڽ� ���̺��� �÷��� �̾߱� ��.
     - �ڽ� ���̺��� �÷��� ��(������)�� �θ� ���̺� ���� ���
       ���Ἲ�� ��Ģ�� ���� ����.
     - �ܷ� Ű�� �����ϱ� ���ؼ��� �켱������ �θ� ���̺��� ���� ��������� ��.
     - �ɼ�
       * on delete cascade
         ==> �θ� ���̺��� ������ ���� �� �ش� �����͸� �����ϰ� �ִ�
             �ڽ� ���̺��� �����ͱ��� ��� �����ϴ� �ɼ�.
       * on delete set null
         ==> �θ� ���̺��� ������ ���� �� �ش� �����͸� �����ϰ� �ִ�
             �ڽ� ���̺� �ִ� �÷��� �ִ� ���� null�� �����Ű�� �ɼ�.
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


-- DEPT ���̺� ������ �߰�
insert into DEPT10 (DEPTNO, DNAME, LOC)
	values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept10 
	values(20, 'RESEARCH', 'DALLAS');
insert into dept10 
	values(30, 'SALES', 'CHICAGO');
insert into dept10 
	values(40, 'OPERATIONS', 'BOSTON');


insert into foreign_test values(1111, 'ȫ�浿', 30);

insert into foreign_test values(2222, '������', 10);

insert into foreign_test values(3333, '�̼���', 50);  -- error �߻�

commit;

-- dept10 ���̺��� 10�� �μ��� ������ �� ����.
delete from dept10 where deptno = 10;



/*
  5) check ���� ����
     - ���� ������ �� �ִ� ���� ���� �Ǵ� ������ ������ ��
       ���Ǵ� ���� ����.
*/

create table check_test(
    gender varchar2(6),
    constraint gender_chk check(gender in ('��', '��'))
);

insert into check_test values('��');

insert into check_test values('��');

insert into check_test values('����');  -- error �߻�



/*
  join ~ on Ű����
  - ���̺�� ���̺��� �����Ͽ� Ư���� �����͸� ����� �� �� �����.
  - �� �� �̻��� ���̺� ������ �������� ���� �� �����.
  - �ߺ��ؼ� �����Ͱ� ����Ǵ� ���� ���� ���� ���̺��� ������ ������.
  - �� ���� ���̺�� �������� ��쿡�� �������� �ߺ��� �߻����� ������
    ���ϴ� ������ �������� ���� �� ���Ǹ� �ؾ� �ϴ� �������� �߻���.
  - Ư�� ����� �Ҽӵ� �μ��� �μ����� �˰� ���� ��쿡�� emp ���̺��
    dept ���̺��� �ѳ���� �۾��� ����Ƿ� ����� ������. �׷��� �� ����
    ���̺��� �����ؼ� ���ϴ� ����� �� �� �ֵ��� �ϴ� �����̶��
    ����� ���ܳ��� �Ǿ���.
    
    ������ ����
    1) Cross Join
    2) Equi Join
    3) Self Join
    4) Outer Join
*/

/*
  1) Cross Join
     - �� �� �̻��� ���̺��� ������ �� �� ������ ���� ���̺��� ������
       �̷������ ������.
     - ���̺� ��ȣ���� ����� �� �ִ� ��� ����� ���� �����Ͽ� ��Ÿ����
       ���� �����.
     - ����� ����� ���ϴ� ���� ����.
*/

select * 
from emp, dept;

/*
  2) Equi Join
     - ���� ���� ���Ǵ� ���� ���.
     - ������ ����� �Ǵ� �� ���̺��� ���������� �����ϴ� �÷��� ����
       ��ġ�ϴ� ���� �����Ͽ� ����� �����ϴ� ���.
     - �� ���̺��� ������ �Ϸ��� ��ġ�Ǵ� ���� �÷��� ����ؾ� ��.
*/

-- emp ���̺��� ����� ���, �̸�, ������, �μ���ȣ ��
-- �μ���, �μ���ġ�� ȭ�鿡 �����ּ���.
-- ==> emp ���̺�� dept ���̺��� ���ν��� �־�� ��.

select empno, ename, job, e.deptno, dname, loc
from emp e join dept d
on e.deptno = d.deptno;

-- emp ���̺��� ������� 'SCOTT' ����� �μ����� �˰� �ʹٸ�???
select ename, d.deptno, dname
from emp e join dept d
on e.deptno = d.deptno
where ename = 'SCOTT';

-- [����1] �μ����� 'RESEARCH' �� �����
--        ���, �̸�, �޿�, �μ���, �ٹ���ġ�� 
--        ȭ�鿡 �����ּ���.
select empno, ename, sal, dname, loc
from emp e join dept d
on e.deptno = d.deptno
where dname = 'RESEARCH';


-- [����2] emp ���̺��� 'NEW YORK'�� �ٹ��ϴ� �����
--        �̸��� �޿�, �μ���ȣ�� ȭ�鿡 �����ּ���.
select ename, sal, e.deptno, loc
from emp e join dept d
on e.deptno = d.deptno
where loc = 'NEW YORK';


-- [����3] emp ���̺��� 'ACCOUNTING' �μ� �Ҽ� �����
--        �̸��� ������, �Ի��� �׸��� �μ���ȣ, �μ�����
--        ȭ�鿡 �����ּ���.
select ename, job, hiredate, d.deptno, dname
from emp e join dept d
on e.deptno = d.deptno
where dname = 'ACCOUNTING';



-- [����4] emp ���̺��� �������� 'SALESMAN' �� �����
--        �̸��� ������, �μ���ȣ, �μ���, �ٹ���ġ��
--        ȭ�鿡 �����ּ���.
select ename, job, d.deptno, dname, loc
from emp e join dept d
on e.deptno = d.deptno
where job = 'SALESMAN';


select * from emp;