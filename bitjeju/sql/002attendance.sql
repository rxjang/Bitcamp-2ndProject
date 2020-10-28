--출석테이블
create table attendance( 
	nalja date not null,
	num number,
	state varchar2(10),
	foreign key(num) references member(num) on delete cascade
);
