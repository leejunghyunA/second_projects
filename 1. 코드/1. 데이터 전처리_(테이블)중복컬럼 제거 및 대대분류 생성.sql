select count(*) from MERGE_PURPRD_PRICE;
select * from MERGE_PURPRD_PRICE;

-- ���÷� ����
alter table MERGE_PURPRD_PRICE
add BBCL varchar2(50);

-- ���÷� �� ���з� ������ ä���
update MERGE_PURPRD_PRICE a
set BBCL = case when bcl in ('��ǰ', '��Ȱ') then '��ǰ/��Ȱ' 
                when bcl in ('ħ��' , '�ֹ�') then 'ħ��/�ֹ�'
                when bcl in ('�������׸���' , '��ȭ') then '�������׸���/��ȭ'
                when bcl in ('�Ƿ�' , '�̹̿�') then '�Ƿ�/�̹̿�'
                when bcl in ('����' , '�������','��Ƽ��') then '����/�������/��Ƽ��'
                when bcl in ('������ȭ' , '�Ƶ�') then '������ȭ/�Ƶ�'
                end;
-- ���÷� ����
alter table MERGE_PURPRD_PRICE
add HALF_YEAR number;

-- ���÷� �� ���з� ������ ä���
update MERGE_PURPRD_PRICE a
set HALF_YEAR = case when puryear = 2014 and quarter in (1,2) then 1 
                when puryear = 2014 and quarter in (3,4) then 2
                when puryear = 2015 and quarter in (1,2) then 3
                when puryear = 2015 and quarter in (3,4) then 4
                end; 
 
                
create table MERGE_PURPRD_PRICE_2 as
select m.custno, m.asso, m.rno, m.bbcl, m.bcl, m.mcl, m.scl, m.type, m.puryear, m.half_year, m.quarter, m.price_type, m.puramt
from MERGE_PURPRD_PRICE m;
            
select * from MERGE_PURPRD_PRICE;
select count(*) from MERGE_PURPRD_PRICE_2;


drop table MERGE_PURPRD;