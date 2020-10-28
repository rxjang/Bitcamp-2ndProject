select lecture_name, name, lecture_num, num, lecture_room, start_day, end_day from lectures natural join member where lecture_num=2



delete from lectures where lecture_name='테스트3' and lecture_num=8;

insert into member values (member_seq.nextval||member_seq.currval,'teacher4@email.com','설민석','강사',3,'password',01012341235,null);
insert into member values (member_seq.nextval||member_seq.currval,'teacher5@email.com','황현필','강사',3,'password',01012341235,null);
insert into member values (member_seq.nextval||member_seq.currval,'teacher6@email.com','정민재','강사',3,'password',01012341235,null);
select * from member;
select * from lectures;
select * from BITJEJUDEPT;
commit;
name, num, lecture, lecture_name, lecture_room, lecture_num, start_day, end_day

select * from member full outer join lectures on member.num=lectures.num;
select * from member full outer join lectures on member.num=lectures.num where lecture_name = (select lecture from member where num = 수강생번호);


select * from member where id_email='staff@email.com';

update member set lecture = '거북선 제조과정A' where num = 66;

select * from member full outer join grade on member.num = GRADE.num where num = 4848;

select * from lectures where lecture_name=(select lecture from member where num=1010);

select * from lectures natural join member;

select * from member natural join grade where num =1010;
select * from attendance where num = 1010;

select lecture_name, lecture_num, lecture_room, name, start_day, end_day from lectures natural join member where lecture_name=(select lecture from member where num=1313);

select * from member full outer join grade on member.num=grade.num where member.num=3838;

insert into member values (member_seq.nextval||member_seq.currval,'tttt','tttt',0,'asdf1234',01011111111,null);


select * from recruit where recruit_num=1;

update member set lecture = '영업assign테스트' where name = '신짱구';

select * from (select num,lecture_name,name,start_day,lvl, rownum as rwn from (select m.num, name,lecture_name,start_day,lvl from member m inner join lectures l on m.lecture=l.lecture_name where lvl<3 and name like '%%')) where rwn between 1 and 5 order by lvl asc;
delete from recruit;
commit;

select * from member;
select grade.num,exam1,exam2,exam3, name from grade, (select num,name from  member where lvl=2 and lecture =
(select lecture from member where num = 55)) m where grade.num=m.num;


select * from recruit natural join lectures where recruit_num=lecture_num;

update member set lecture = '영업assign테스트' where name ='장영희';

select nalja, attendance.num,name,state from attendance,member where attendance.num=member.num and lecture=(select lecture from member where num=3232) order by nalja desc, num asc;

select * from notice;




update member set lecture = '비트캠프 기본A' where name='정민재';

delete from attendance as a inner join grade as g on a.num=g.num where num = (select num from member where lecture = ? and lvl = 2) 

select * from attendance at natural join grade gr;

on at.num = gr.num;

delete from attendance, grade where num = 4242;

select * from grade;
select * from attendance;


delete from recruit; 	
select lecture_name,start_day,end_day,num,lecture_room,lecture_num,recruit_num from lectures full outer join recruit on recruit_num = lecture_num;
delete from lectures;
alter table recruit drop primary key(recruit_num);
alter table recruit modify (recruit_num number unique);
alter table recruit add (thumbnail varchar2(100));

insert into member values (member_seq.nextval,'teststu@email.com','학생',2,'password',01012341235,'테스트반99');




