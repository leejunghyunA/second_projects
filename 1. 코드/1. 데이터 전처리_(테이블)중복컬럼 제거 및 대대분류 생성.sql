select count(*) from MERGE_PURPRD_PRICE;
select * from MERGE_PURPRD_PRICE;

-- 빈컬럼 생성
alter table MERGE_PURPRD_PRICE
add BBCL varchar2(50);

-- 빈컬럼 내 대대분류 데이터 채우기
update MERGE_PURPRD_PRICE a
set BBCL = case when bcl in ('식품', '생활') then '식품/생활' 
                when bcl in ('침구' , '주방') then '침구/주방'
                when bcl in ('가구인테리어' , '잡화') then '가구인테리어/잡화'
                when bcl in ('의류' , '이미용') then '의류/이미용'
                when bcl in ('가전' , '레저취미','멀티샵') then '가전/레저취미/멀티샵'
                when bcl in ('교육문화' , '아동') then '교육문화/아동'
                end;
-- 빈컬럼 생성
alter table MERGE_PURPRD_PRICE
add HALF_YEAR number;

-- 빈컬럼 내 대대분류 데이터 채우기
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