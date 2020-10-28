drop sequence member_seq;
drop sequence lectures_seq;
drop sequence recruit_seq;
drop sequence notice_seq;
drop sequence dataroom_seq;
drop table dataroom;
drop table notice;
drop table grade;
drop table lectures;
drop table attendance;
drop table recruit;
drop table member;
drop table bitjejudept;
--다른데서 참조하므로 항상 drop을 마지막에 해줘야함

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
insert into member values (member_seq.nextval,'teacher2@email.com','황현필',3,'password','01012341235',null);
insert into member values (member_seq.nextval,'teacher3@email.com','정민재',3,'password','01012341235',null);

--출석테이블
create table attendance( 
	nalja date not null,
	num number,
	state varchar2(10),
	foreign key(num) references member(num) on delete cascade
);

--성적게시판
create table grade(  			
	num number primary key,		
	exam1 number,				
	exam2 number,
	exam3 number,					
	foreign key(num) references member(num) on delete cascade
);  

create sequence lectures_seq;
create table lectures(							
	lecture_name varchar2(50),			
	start_day date,									
	end_day date,
	num number,										
	lecture_room number,							
	lecture_num number  primary key,
	foreign key(num) references member(num) on delete cascade
);


--모집공고게시판
create table recruit (
	recruit_file_name varchar2(200),
	recruit_num number primary key,	
	foreign key(recruit_num) references lectures(lecture_num) on delete cascade
);


--자료실 게시판 강사
create sequence dataroom_seq;
create table dataroom(
	drNum number primary key,
	drTitle varchar2(200) default '제목없음',
	num number,
	drDate date,
	fileName varchar2(300),
	drContent varchar2(2048),
	foreign key (num) references member(num)
);

 --공지사항 게시판
create sequence notice_seq;
create table notice(                          
   ntnum number primary key,
   title varchar2(100) not null,
   num number,
   wtime date,
   content varchar2(3000),
   read_cnt number,
   filename varchar2(200),
   foreign key (num) references member(num)
);


