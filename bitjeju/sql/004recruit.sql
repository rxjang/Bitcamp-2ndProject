--모집공고테이블
create table recruit (
	recruit_file_name varchar2(200),
	recruit_num number primary key,
	thumbnail varchar2(200),
	foreign key(recruit_num) references lectures(lecture_num) on delete cascade
);

