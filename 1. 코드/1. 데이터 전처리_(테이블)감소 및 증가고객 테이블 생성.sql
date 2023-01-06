select * from purprd;
select * from cat_all;

-- ��з����� ���̺��� ���޻�, ��з��ڵ� �÷� ����
-- 1) �� �÷�����
alter table cat_all 
add ASSO varchar2(20);
alter table cat_all 
add "��з��ڵ�" number;

-- 2) �÷� ���� ä���
select * from cat_all;
update cat_all
set asso = substr(cat,1,1);

update cat_all
set ��з��ڵ� = substr(cat,2,2);


-- ���ŵ����� ����, �б� �÷� ����
--1) ����
alter table purprd
add SEASON number;

update purprd a
set season = case when substr(purdate,5,2) in (3,4,5) then 1 
     when substr(purdate,5,2) in (6,7,8) then 2
     when substr(purdate,5,2) in (9,10,11) then 3
     else 4 end; 


-- 2)�б�
alter table purprd
add QUARTER number;

update purprd a
set quarter = case when substr(purdate,5,2) in (1,2,3) then 1 
     when substr(purdate,5,2) in (4,5,6) then 2
     when substr(purdate,5,2) in (7,8,9) then 3
     else 4 end; 
      


select * from purprd; 
select * from cat_all;
select * from prodcl_2;
-- ��ǰ�з��ڵ� ������ MERGE ���� ��з��ڵ�+�ߺз����� CAT �÷� ����
create table prodcl_2 as
select p.*, substr(scode,1,3)||mcl "CAT" from prodcl p;


-- ��ǰ �з��ڵ� MERGE
create table MERGE_CATEGORY as
select p.scode, p.mcl, p.scl, c.category "BCL", c.type
from prodcl_2 p full outer join cat_all c on c.cat = p.cat;


-- ���ŵ����Ϳ� �з��ڵ� ������ MREGE_merge_purprd ���̺� ����
select * from purprd;
select * from merge_category;

create table MERGE_PURPRD as
select p.custno, p.asso, p.rno, p.bcode, p.mcode, p.scode, c.bcl, c.mcl, c.scl, c.type, p.purdate, p.purtime, p.puramt, p.quarter, p.season, p.stcode 
from purprd p full outer join merge_category c on p.scode = c.scode;

-- Ȯ�� 
select * from MERGE_PURPRD;


select count(*) from MERGE_PURPRD;

-- ��/��/���� �÷� ����
create table MERGE_PURPRD_PRICE as
select m.*, c.price_type
from MERGE_PURPRD m, cat_price c 
where m.asso = c.asso and 
      m.bcode = c."��з��ڵ�" and
      m.bcl = c."��з���_Y" and
      m.mcl = c."�ߺз���" and
      m.scl = c."�Һз���";


-- Ȯ�� 
select * from MERGE_PURPRD_PRICE;


-- �� ������
-- 1)���� �÷� ����
alter table MERGE_PURPRD
add "PURYEAR" number;

-- 2) �÷� ���� ä���
update MERGE_PURPRD
set PURYEAR = substr(purdate,1,4);

-- Ȯ�� 
select * from MERGE_PURPRD;


-- GROUPBY�� ���� ���ҿ��� Ȯ��
create table CUSTNO_PURAMT_COMPARED as
select custno,
sum(case when purdate <= '20141231' then puramt end) "2014 ���ž�", 
sum(case when purdate > '20141231' and purdate <= '20151231' then puramt end) "2015 ���ž�"
from MERGE_PURPRD_PRICE
group by custno
order by custno;
--Ȯ��
select * from CUSTNO_PURAMT_COMPARED;

alter table CUSTNO_PURAMT_COMPARED
add "���ҿ���" number;
alter table CUSTNO_PURAMT_COMPARED
add "�ݾ�����" number;

update CUSTNO_PURAMT_COMPARED
set "�ݾ�����" =  "2015 ���ž�"-"2014 ���ž�";
update CUSTNO_PURAMT_COMPARED
set "���ҿ���" =  (case when "�ݾ�����" > 0 then 0 when "�ݾ�����" < 0 then 1 else 2 end);
--Ȯ��
select * from CUSTNO_PURAMT_COMPARED 
where ���ҿ��� = 2;


select * from CUSTNO_PURAMT_COMPARED ;
select * from MERGE_PURPRD; 

drop table MINUS_CUSTNO;
drop table PLUS_CUSTNO;
-- ���� ���� �� Ȯ��
create table MINUS_CUSTNO as 
select p.*, c.�ݾ�����
from MERGE_PURPRD_PRICE p full outer join CUSTNO_PURAMT_COMPARED c 
    on p.custno = c.custno
where c.���ҿ��� = 1;
--Ȯ��
select * from MINUS_CUSTNO; 
select count(distinct custno) from MINUS_CUSTNO; 

-- ���� ���� �� Ȯ��
create table PLUS_CUSTNO as
select p.*, c.�ݾ����� 
from MERGE_PURPRD_PRICE p full outer join CUSTNO_PURAMT_COMPARED c 
    on p.custno = c.custno
where c.���ҿ��� = 0;
--Ȯ��
select * from PLUS_CUSTNO; 
select count(distinct custno) from PLUS_CUSTNO; 
