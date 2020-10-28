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