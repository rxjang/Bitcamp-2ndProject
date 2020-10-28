--°­ÁÂÅ×ÀÌºí
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

