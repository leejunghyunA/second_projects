select * from purprd;
select * from cat_all;

-- 대분류포함 테이블의 제휴사, 대분류코드 컬럼 생성
-- 1) 빈 컬럼생성
alter table cat_all 
add ASSO varchar2(20);
alter table cat_all 
add "대분류코드" number;

-- 2) 컬럼 내용 채우기
select * from cat_all;
update cat_all
set asso = substr(cat,1,1);

update cat_all
set 대분류코드 = substr(cat,2,2);


-- 구매데이터 계절, 분기 컬럼 생성
--1) 계절
alter table purprd
add SEASON number;

update purprd a
set season = case when substr(purdate,5,2) in (3,4,5) then 1 
     when substr(purdate,5,2) in (6,7,8) then 2
     when substr(purdate,5,2) in (9,10,11) then 3
     else 4 end; 


-- 2)분기
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
-- 상품분류코드 데이터 MERGE 위해 대분류코드+중분류명인 CAT 컬럼 생성
create table prodcl_2 as
select p.*, substr(scode,1,3)||mcl "CAT" from prodcl p;


-- 상품 분류코드 MERGE
create table MERGE_CATEGORY as
select p.scode, p.mcl, p.scl, c.category "BCL", c.type
from prodcl_2 p full outer join cat_all c on c.cat = p.cat;


-- 구매데이터와 분류코드 데이터 MREGE_merge_purprd 테이블 생성
select * from purprd;
select * from merge_category;

create table MERGE_PURPRD as
select p.custno, p.asso, p.rno, p.bcode, p.mcode, p.scode, c.bcl, c.mcl, c.scl, c.type, p.purdate, p.purtime, p.puramt, p.quarter, p.season, p.stcode 
from purprd p full outer join merge_category c on p.scode = c.scode;

-- 확인 
select * from MERGE_PURPRD;


select count(*) from MERGE_PURPRD;

-- 고/중/저가 컬럼 생성
create table MERGE_PURPRD_PRICE as
select m.*, c.price_type
from MERGE_PURPRD m, cat_price c 
where m.asso = c.asso and 
      m.bcode = c."대분류코드" and
      m.bcl = c."대분류명_Y" and
      m.mcl = c."중분류명" and
      m.scl = c."소분류명";


-- 확인 
select * from MERGE_PURPRD_PRICE;


-- 고객 나누기
-- 1)연도 컬럼 생성
alter table MERGE_PURPRD
add "PURYEAR" number;

-- 2) 컬럼 내용 채우기
update MERGE_PURPRD
set PURYEAR = substr(purdate,1,4);

-- 확인 
select * from MERGE_PURPRD;


-- GROUPBY로 고객별 감소여부 확인
create table CUSTNO_PURAMT_COMPARED as
select custno,
sum(case when purdate <= '20141231' then puramt end) "2014 구매액", 
sum(case when purdate > '20141231' and purdate <= '20151231' then puramt end) "2015 구매액"
from MERGE_PURPRD_PRICE
group by custno
order by custno;
--확인
select * from CUSTNO_PURAMT_COMPARED;

alter table CUSTNO_PURAMT_COMPARED
add "감소여부" number;
alter table CUSTNO_PURAMT_COMPARED
add "금액차이" number;

update CUSTNO_PURAMT_COMPARED
set "금액차이" =  "2015 구매액"-"2014 구매액";
update CUSTNO_PURAMT_COMPARED
set "감소여부" =  (case when "금액차이" > 0 then 0 when "금액차이" < 0 then 1 else 2 end);
--확인
select * from CUSTNO_PURAMT_COMPARED 
where 감소여부 = 2;


select * from CUSTNO_PURAMT_COMPARED ;
select * from MERGE_PURPRD; 

drop table MINUS_CUSTNO;
drop table PLUS_CUSTNO;
-- 구매 감소 고객 확인
create table MINUS_CUSTNO as 
select p.*, c.금액차이
from MERGE_PURPRD_PRICE p full outer join CUSTNO_PURAMT_COMPARED c 
    on p.custno = c.custno
where c.감소여부 = 1;
--확인
select * from MINUS_CUSTNO; 
select count(distinct custno) from MINUS_CUSTNO; 

-- 구매 증가 고객 확인
create table PLUS_CUSTNO as
select p.*, c.금액차이 
from MERGE_PURPRD_PRICE p full outer join CUSTNO_PURAMT_COMPARED c 
    on p.custno = c.custno
where c.감소여부 = 0;
--확인
select * from PLUS_CUSTNO; 
select count(distinct custno) from PLUS_CUSTNO; 
