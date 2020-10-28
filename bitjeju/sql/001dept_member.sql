create table bitjejudept(
	dept varchar2(20) primary key,
	lvl number unique not null
);
--부서와 권한레벨을 가진 테이블, 6개의 부서로 나뉜다. 
insert into bitjejudept values ('일반회원',0);
insert into bitjejudept values ('수료생',1);
insert into bitjejudept values ('수강생',2);
insert into bitjejudept values ('강사',3);
insert into bitjejudept values ('영업',4);
insert into bitjejudept values ('행정',5);
insert into bitjejudept values ('관리자',6);



create sequence member_seq;
create table member(					
	num number primary key, 			
	id_email varchar2(50) unique not null,
	name varchar2(15),					
	lvl number(1) default 0,			
	password varchar2(15) not null, 	
	phone varchar2(15),					
	lecture varchar2(50),					
	foreign key(lvl) references bitjejudept(lvl)
);

insert into member values (member_seq.nextval,'sales@email.com','이영업',4,'password','01012341234', null);
insert into member values (member_seq.nextval,'staff@email.com','김행정',5,'password','01012341234', null);
insert into member values (member_seq.nextval,'teacher@email.com','김영조',3,'password','01012341234', null);
insert into member values (member_seq.nextval,'teacher1email.com','설민석',3,'password','01012341235',null);
insert into member values (member_seq.nextval,'teacher2@email.com','황현필',3,'password','01012341234',null);
insert into member values (member_seq.nextval,'teacher3@email.com','정민재',3,'password','01012341234',null);
