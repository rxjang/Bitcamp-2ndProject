--성적테이블
create table grade(  			
	num number primary key,		
	exam1 number,				
	exam2 number,
	exam3 number,					
	foreign key(num) references member(num) on delete cascade
);  
