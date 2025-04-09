/*
  group by ��
  - Ư�� �÷��̳� ���� �������� �ش� ���ڵ带 ��� 
    �ڷḦ ������ �� �����.
  - ������ Ư�� �÷��� �������� ���踦 ���ϴµ� ���� ����.
  - ���� �׷��Լ��� �Բ� ����ϸ� ȿ�������� Ȱ���� ������.
*/

select distinct deptno
from emp
order by deptno;

select deptno
from emp
group by deptno;

-- emp ���̺��� �μ����� �ش� �μ���
-- �ο��� Ȯ���ϰ� ���� ���
select deptno, count(*) "�μ��ο�"
from emp
group by deptno;

-- emp ���̺��� �� �μ����� �μ� ������
-- �޿� �հ���� ���Ͽ� ȭ�鿡 �����ּ���.
select deptno, sum(sal)
from emp
group by deptno
order by sum(sal) desc;

-- [����] emp ���̺��� �μ����� �׷��� ��� �μ��� �޿� �հ��
--       �μ��� �ο� ��, �μ��� ��� �޿�, �μ��� �ִ� �޿�, �μ���
--       �ּ� �޿��� ���Ͽ� ȭ�鿡 �����ּ���.
--       ��, �޿� �հ踦 �������� ������������ �����Ͽ� �����ּ���.
select deptno, sum(sal), count(*), avg(sal), max(sal), min(sal)
from emp
group by deptno
order by sum(sal) desc;


/*
  having ��
  - group by �� ������ ������ ������.
  - group by ���� ����� ������ �־ ������ �� �����.
  - group by �� �������� where(������)�� �� �� ����.
*/

-- products ���̺��� ī�װ� ����
-- ��ǰ�� ������ ȭ�鿡 �����ּ���.
select category_fk, count(*)
from products
group by category_fk
having count(*) >= 2;



/*
  �ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
  �ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
  View
  - �������� ���̺� �ٰ��� ������ ������ ���̺��� ����.
  - View�� ���������� �����͸� �����ϰ� ���� ����.
  - View�� ����� �����ͺ��̽��� ���� �� ���� ���̺� �����Ͽ�
    �����͸� �ҷ����� ��.
  - �����ϰ� �ʿ��� ����鸸 �����ؼ� ����� �� ���� ����� ��.
  - View�� ���̺�� �����ϸ�, ���̺�ó�� ����� ������.
  - View�� ���̺� �����ϱ� ���� �������� ������ �ʿ䰡 ����.
  - ���̺�� ���������� insert, update, delete ����� ������.
  - ������ �ַ� �����͸� ��ȸ(select) �� �� ���� ���� ����.
  - View�� ����ϴ� ����.
    1) ���� ������ ���� �����(�߿�)
       ==> ���� ��޿� ���߾� �÷��� ������ ���ؼ� ��ȸ��
           �����ϵ��� �� �� ����.
    2) ������� ���Ǽ��� ������.
    
    ����) 
            create view ���̸�
            as
            ������;
*/

-- ���� ������ ���ؼ� View�� �����(�߿�)
-- �λ�� View
-- �÷��� sal(�޿�), comm(���ʽ�) �÷��� ����
create view emp_insa
as
select empno, ename, job, mgr, hiredate, deptno
from emp;

-- ������ View
-- �÷��� sal(�޿�) �÷��� ����
create view emp_sales
as
select empno, ename, job, mgr, hiredate, comm, deptno
from emp;

select * from emp_sales;

-- ������(ȸ��) View
-- ��� �÷��� ����.
create view emp_account
as
select *
from emp;

select * from emp_account;

-- View�� �����͸� �߰��� ����.
insert into emp_insa
    values(9000, 'ANGEL', 'SALESMAN', 7698, sysdate, 30);
    

-- View�� �б� �������� ����� �����Ͱ� �߰��� �� ��.
-- �б� �������� ����� ���.
-- ==> View�� ���� �� ������ �� �������� with read only ���� �߰�.

create view emp_insa1
as
select empno, ename, job, mgr, hiredate, deptno
from emp
with read only;

-- �б� ���� View �̹Ƿ� insert �� �� ��.
insert into emp_insa1
    values(9001, 'TIGER', 'SALESMAN', 7698, sysdate, 30);
    
-- View�� ����ϴٰ� �����ϴ� ���
-- ����) drop view ���̸�;
drop view emp_insa;
drop view emp_insa1;
drop view emp_sales;
drop view emp_account;

-- create or replace view ���̸�
-- ���� �̸��� view�� �ִ� ��쿡�� ������ View�� �����ϰ�
-- ���ο� View�� ������ �ǹ�.
create or replace view view_insa
as
select empno, ename, job, mgr, hiredate, deptno
from emp
with read only;

create or replace view view_sales
as
select empno, ename, job, mgr, hiredate, comm, deptno
from emp
with read only;

create or replace view view_account
as
select *
from emp
with read only;


-- 2) ������� ���Ǽ��� ������.
create or replace view view_salary
as
select empno, ename, (sal * 12 + nvl2(comm, comm, 0)) "����"
from emp
with read only;

select * from view_salary;


-- [����1] �μ����� �μ��� �޿��հ�, �μ��� �޿� ����� ����
--        View�� ����� ȭ�鿡 �����ּ���.
create or replace view dept_sal
as
select deptno, sum(sal) "�޿��հ�", avg(sal) "�޿����"
from emp
group by deptno
with read only;

select * from dept_sal;

-- [����2] emp ���̺��� �̿��Ͽ� emp_dept20 �̶�� View��
--        ����� �ּ���. ��, �μ���ȣ�� 20�� �μ��� ����
--        ������� ���, �̸�, ������, ������, �μ���ȣ��
--        ȭ�鿡 �����ּ���.
create or replace view emp_dept20
as
select empno, ename, job, mgr, deptno
from emp
where deptno = 20
with read only;

select * from emp_dept20;

-- [����3] emp ���̺��� �� �μ��� �ִ�޿��� �ּұ޿���
--        ���� �ִ� View�� �����, sal_view ��� �̸�����
--        ����� ȭ�鿡 �����ּ���.
create or replace view sal_view
as
select deptno, max(sal) "�ִ�޿�", min(sal) "�ּұ޿�"
from emp
group by deptno
with read only;

select * from sal_view;

-- [����4] �������� 'SALESMAN'�� ����� ���, �̸�, ������,
--        �Ի���, �μ���ȣ�� �÷����� �ϴ� View�� �����, 
--        view_sale �̶�� View�� ����� ȭ�鿡 �����ּ���.
create or replace view view_sale
as
select empno, ename, job, hiredate, deptno
from emp
where job = 'SALESMAN'
with read only;

select * from view_sale;



/*
  Ʈ�����(Transaction)?
  - ������ ó���� �� ������ ����.
  - ����Ŭ���� �߻��ϴ� ���� ���� SQL ��ɹ�����
    �ϳ��� ������ �۾� ������ ó���ϴ� ���� ����.
  - All or Nothing ������� ó����.
  - ����� ���� ���� ������ ���������� ó���� �Ǹ� �����ϰ�,
    ���� ���� ��ɾ� �߿��� �ϳ��� ����̶� �߸��� �Ǹ�
    ��ü�� ����ϴ� ���� ����.(�߿�)
    
  - Ʈ������� ����ϴ� ���� : �������� �ϰ����� �����ϸ鼭
                            �������� �������� �����ϱ� ����.
  - Ʈ����� ��� �� Ʈ������� �����ϱ� ���� ��ɾ�.
    1) commit : ��� �۾��� ���������� ó���ϰڴٰ� �ϴ� ��ɾ�.
                Ʈ�����(insert, update, delete) �۾��� ������
                ���� DB�� �ݿ�.
                ������ �ִ� �����Ϳ� update ������ �߻��� ��.
                ��� ����ڰ� ����� �������� ����� �� �� ����.
    2) rollback : �۾� �߿� ������ �߻����� �� Ʈ����� ó�� ��������
                  ���� ������ ����Ͽ� ���� ���·� �ǵ����� ��ɾ�.
                  Ʈ�����(insert, update, delete) �۾��� ������
                  �����. ������ commit �� �� ������ ������ ��.
*/

-- 1. dept ���̺��� �����Ͽ� dept_02 ��� ���̺��� ������.
create table dept_02
as
select * from dept;

select * from dept_02;

-- 2. dept_02 ���̺��� 40�� �μ��� ���� �� commit�� �� ����.
delete from dept_02 where deptno = 40;
commit;

-- 3. dept_02 ���̺��� ��ü �����͸� ������ ����.
delete from dept_02;

-- 4. �� �� ���� 20�� �μ��� ���ؼ��� ������ �Ϸ��� �ߴµ�
--    �߸��ؼ� ��ü�� ������ �� ���, �ٽ� ������ �� �� ����.
rollback;

-- 5. 20�� �μ��� �����ϸ� �ȴ�.
delete from dept_02 where deptno = 20;

commit;



/*
  savepoint
  - Ʈ������� �۰� �����ϴ� ���� ����.
  - ����ڰ� Ʈ����� �߰� �ܰ迡�� ����Ʈ�� �����Ͽ�
    Ʈ����� ���� Ư�� savepoint���� rollback �� ��
    �ְ� �ϴ� ���� ����.
*/

-- 1. dept ���̺��� �����Ͽ� dept_03 �̶�� ���̺��� ������.
create table dept_03
as
select *
from dept;

-- 2. dept_03 ���̺��� 40�� �μ��� ���� �� commit�� �� ����.
delete from dept_03 where deptno = 40;
commit;

-- 3. dept_03 ���̺��� 30�� �μ��� ������ ����.
delete from dept_03 where deptno = 30;

-- 4. �� �� savepoint sp1�� ������ ����.
savepoint sp1;

-- 5. dept_03 ���̺��� 20�� �μ��� ������ ����.
delete from dept_03 where deptno = 20;

-- 6. �� �� savepoint sp2�� ������ ����.
savepoint sp2;

-- 7. dept_03 ���̺��� 10�� �μ��� ������ ����.
delete from dept_03 where deptno = 10;

-- 8. �μ���ȣ�� 20���� �μ��� �����ϱ� �ٷ� ������
--    �ǵ��ư��� ���� ���
rollback to sp1;


select * from dept_03;



/*
  PL/SQL(Procedual Language / SQL)
  - SQL �����δ� ������ ��ưų� ���� �Ұ����� �۾��� �����ϱ� ���ؼ�
    ����Ŭ���� �����ϴ� ���α׷��� �� ����.
  - �Ϲ������� ���α׷��� ������� ��ҵ��� �� ������ ������, �����ͺ��̽�
    ������ ó���ϱ� ���� ����ȭ�� ���.
  - ����, ���� ó��, �ݺ� ó�� �� �پ��� ����� ����� �� ����.
  - PL/SQL�� ���ø����̼� ���� �ʿ��� ����Ǵ� ���� �ƴ϶�, �����ͺ��̽�
    ���� �ʿ��� ������ ��. ���� �����Ϳ� ���� ����� ���� ��ġ�ϰ�
    �����Ƿ� ���ø����̼� ������ �����͸� �ְ� �޴µ� ������ ��Ʈ��ũ
    Ʈ������ �ּ�ȭ �ȴٴ� ������ ����.
    
  - �⺻ ����
    1) �����(declare) : ��� ������ ����� �����ϴ� �κ�.
    2) �����(executable - begin)
       - ���� ������ ����Ǵ� �κ�.
       - ���(���ǹ�), �ݺ���, �Լ� ���� ���� ������ ����ϴ� �κ�.
    3) ����ó����(exception)
       - ���� ���� ���ܰ� �߻� �� �ذ��ϱ� ���� ��ɵ��� ����ϴ� �κ�.
       
    �� �� �⺻ ���� �߿��� ����ο� ����ó���δ� ������ ����������,
       ����δ� �ݵ�� �����ؾ� ��.
       
  - PL/SQL ��� �� ���ǻ���.
    1) �⺻ ����(declare, begin, exception) Ű���� �ڿ��� �����ݷ�(;)��
       ������ �ʴ´�.
    2) ���� �� �κп��� �����ؾ� �ϴ� ���� ������ �ݵ�� �����ݷ�(;)�� ���δ�.
    3) begin ~ end(�����) �ؿ��� �ݵ�� "/" �� �ٿ� �־�� �Ѵ�.
*/

-- ȭ�鿡 ��� ����� Ȱ��ȭ �����־�� �Ѵ�.
set serveroutput on;

-- "Hello PL/SQL" �̶�� ������ PL/SQL�� �̿��Ͽ� ȭ�鿡 ����� ����.
begin
    -- ȭ��(�ܼ�)�� ������ ����ϴ� ��ɹ�.
   dbms_output.put_line('Hello PL/SQL');
end;
/


-- �����(declare) ������ ������ �����ϴ� ���
-- 1) ��Į�� �ڷ���
--    ����) ������ �ڷ���(ũ��)
--         ��) num number; or name varchar2(30);

declare
    v_empno number(4) := 7788;
    v_ename varchar2(30);
begin
    v_ename := 'ADAMS';
    
    dbms_output.put_line('v_empno >>> ' || v_empno);
    dbms_output.put_line('v_ename >>> ' || v_ename);
end;
/

-- 2) ���۷��� �ڷ���
-- ���̺� ���ǵ� �÷��� �ڷ����� ũ�⸦ ��� �ľ��ϰ� �ִٸ�
-- ������ ��������, ��κ��� �׷��� ���ϱ� ������ ����Ŭ������
-- ���۷���(reference) ������ ������ ��.
-- ����) ������ ���̺��.�÷�%type;
-- ��) num emp.empno%type;

declare
    e_empno emp.empno%type;
    e_ename emp.ename%type;
begin
    e_empno := 9002;
    e_ename := 'SEJONG';
    
    dbms_output.put_line('e_empno >>> ' || e_empno);
    dbms_output.put_line('e_ename >>> ' || e_ename);

end;
/


-- 3) rowType �ڷ���
-- ���̺��� ��� �÷��� �Ѳ����� �����ϱ� ���� ������ �����ϴ� ���.
-- ����) e_row emp%rowType;

declare
    emp_row emp%rowType;
begin
    
    select * into emp_row
    from emp
    where empno = 7698;
    
    dbms_output.put_line(emp_row.empno || ' ' || emp_row.ename
        || ' ' || emp_row.job || ' ' || emp_row.mgr || ' ' ||
        emp_row.hiredate || ' ' || emp_row.sal || ' ' ||
        emp_row.comm || ' ' || emp_row.deptno);
end;
/

-- dept ���̺��� rowType���� �Ͽ� 30�� �μ��� �ش��ϴ� ������
-- ȭ�鿡 �����ּ���.

declare
    dept_row dept%rowType;
begin

    select * into dept_row
    from dept
    where deptno = 30;
    
    dbms_output.put_line(dept_row.deptno || ' ' || 
            dept_row.dname || ' ' || dept_row.loc);
end;
/


/*
  ���� ���(���ǹ�)
  - Ư�� ���ǽ��� ���� ��Ȳ�� ���� ������ ������ �޸��ϴ� 
    ����� ��ɹ��� ����.

  1. if ���ǹ�
     1) if ~ then ���ǹ�
        - Ư�� ������ �����ϴ� ��쿡�� �۾��� ����.
        - ����)
                if ���ǽ� then
                    ���ǽ��� ���� ��� ���� ����;
                end if;
        
     2) if ~ then ~ else ���ǹ�
        - Ư�� ������ �����ϴ� ���� �������� �ʴ� ���
          ���� ������ �۾��� ����.
        - ����) 
                if ���ǽ� then
                    ���ǽ��� ���� ��� ���� ����;
                else
                    ���ǽ��� ������ ��� ���� ����;
                end if;
     
     3) if ~ then ~ elsif ���ǹ�
        - ���� ���� ���ǿ� ���� ���� ������ �۾��� ����.
        - ����)
                if ���ǽ�1 then
                    ���ǽ�1�� ���� ��� ���� ����;
                elsif ���ǽ�2 then
                    ���ǽ�1�� �����̰�, ���ǽ�2�� ���� ��� ���� ����;
                elsif ���ǽ�3 then
                    ���ǽ�1, ���ǽ�2�� �����̰�, ���ǽ�3�� ���� ��� ���� ����;
                else
                    ���ǽ�1, ���ǽ�2, ���ǽ�3 ��ΰ� ������ ��� ���� ����;
                end if;
*/

-- 1) if ~ then ���ǽ�

declare
    e_number number := 77;
begin

    if e_number >= 50 then
        dbms_output.put_line(e_number || ' ��(��) 50���� ū ���Դϴ�.');
    end if;
    
end;
/

-- Ű����� �����͸� �Է� �޴� ���
declare
    e_num number;
begin

    e_num := '&num';   -- Ű����� �����͸� �Է� �޴� ���
    
    dbms_output.put_line('�Է� ���� ������ >>> ' || e_num);
end;
/

-- 2) if ~ then ~ else ���ǹ�

declare
    su number;
begin
    su := '&su';
    
    if su >= 50 then
        dbms_output.put_line(su || ' ��(��) 50 �̻��� �����Դϴ�.');
    else
        dbms_output.put_line(su || ' ��(��) 50 ������ �����Դϴ�.');
    end if;
end;
/

-- [����] Ű����� �Է� ���� ���� Ȧ������ ¦������ �Ǻ��� ������.
declare
    e_num number;
begin

    e_num := '&num';
    
    if mod(e_num, 2) = 1 then
        dbms_output.put_line(e_num || ' ��(��) Ȧ���Դϴ�.');
    else
        dbms_output.put_line(e_num || ' ��(��) ¦���Դϴ�.');
    end if;
    
end;
/

-- 3) if ~ then ~ elsif ���ǹ�

declare
    e_avg number := 88.12;
begin
    
    if e_avg >= 90 then
        dbms_output.put_line('A�����Դϴ�.');
    elsif e_avg >= 80 then
        dbms_output.put_line('B�����Դϴ�.');
    elsif e_avg >= 70 then
        dbms_output.put_line('C�����Դϴ�.');
    elsif e_avg >= 60 then
        dbms_output.put_line('D�����Դϴ�.');
    else
        dbms_output.put_line('F�����Դϴ�.');
    end if;
    
end;
/

/*
  �ݺ� ���
  - Ư�� �۾��� �ݺ��Ͽ� �����ϰ��� �� �� ����ϴ� ���.
  - �ݺ� ����� ����
    1) �⺻ loop
       - ���� �⺻���� �ݺ���.
    2) while loop
       - Ư�� ������ ����� ���ؼ� �ݺ��� �����ϴ� �ݺ���.
    3) for loop
       - �ݺ� Ƚ���� ���Ͽ� �ݺ��� �����ϴ� �ݺ���.
  - �ݺ����� �ݺ����� ������ �����Ű�� ��ɾ�.
    1) exit
       - ���� ���� �ݺ��� �����Ű�� ��ɾ�.
    2) exit ~ then
       - �ݺ� ���Ḧ ���� ���ǽ��� �����ϰ� �����ϸ�
         �ݺ��� �����Ű�� ��ɾ�.
    3) continue
       - ���� ���� �ݺ��� ���� �ֱ⸦ �ǳ� �ٴ� ��ɾ�.
    4) continue ~ when
       - Ư�� ���ǽ��� �����ϰ� ���ǽ��� �����ϸ� �ݺ� �ֱ⸦
         �ǳ� �ٴ� ��ɾ�.
*/

-- 1) �⺻ loop �ݺ���

declare

    su number := 1;
begin

    loop
    
        dbms_output.put_line('su >>> ' || su);
        su := su + 1;
        
        if su > 10 then
            exit;
        end if;
        
    end loop;
    
end;
/

-- 2) while loop �ݺ���
declare

    su number := 1;
    
    e_sum number := 0;  -- ���� ������ų ����
    
begin

    dbms_output.put_line('*** 1 ~ 100 ������ �� ***');

    while su <= 100 loop
        e_sum := e_sum + su;
        su := su + 1;
    end loop;
    
    dbms_output.put_line('���� >>> ' || e_sum);

end;
/

-- 3) for loop �ݺ���

declare
    tot number := 0;
begin

    dbms_output.put_line('*** for loop �� �̿��� 1 ~ 100 ������ �� ***');    

    for su in 1 .. 100 loop
        tot := tot + su;
    end loop;
    
    dbms_output.put_line('1 ~ 100 ������ �� >>> ' || tot);
    
end;
/