create table topcategory (
top_id number PRIMARY key,
title varchar2(30),
rank number default 0
);

create sequence seq_topcategory
increment by 1
start with 1;

create table subcategory (
sub_id number PRIMARY KEY,
top_id number,
title varchar2(30),
rank number default 0
);

create SEQUENCE seq_subcategory
increment by 1
start with 1;

insert into topcategory (top_id, title) 
values (seq_topcategory.nextval, '상의');
insert into topcategory (top_id, title) 
values (seq_topcategory.nextval, '하의');
insert into topcategory (top_id, title) 
values (seq_topcategory.nextval, '신발');
insert into topcategory (top_id, title) 
values (seq_topcategory.nextval, '엑세서리');
insert into topcategory (top_id, title) 
values (seq_topcategory.nextval, '가죽제품');


insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 1, '점퍼');
insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 1, '셔츠');
insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 1, '블라우스');
insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 1, '니트');

insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 2, '청바지');
insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 2, '스커트');
insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 2, '면바지');
insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 2, '슬랙스');

insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 3, '운동화');
insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 3, '구두');
insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 3, '슬리퍼');
insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 3, '하이힐');

insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 4, '반지');
insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 4, '귀걸이');
insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 4, '목걸이');
insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 4, '팔찌');

insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 5, '점퍼');
insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 5, '지갑');
insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 5, '벨트');
insert into subcategory (sub_id, top_id, title) 
values (seq_subcategory.nextval, 5, '장갑');

