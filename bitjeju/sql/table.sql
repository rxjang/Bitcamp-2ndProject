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
--�ٸ����� �����ϹǷ� �׻� drop�� �������� �������

create table bitjejudept(
	dept varchar2(20) primary key,
	lvl number unique not null
);
--�μ��� ���ѷ����� ���� ���̺�, 6���� �μ��� ������. 
insert into bitjejudept values ('�Ϲ�ȸ��',0);
insert into bitjejudept values ('�����',1);
insert into bitjejudept values ('������',2);
insert into bitjejudept values ('����',3);
insert into bitjejudept values ('����',4);
insert into bitjejudept values ('����',5);
insert into bitjejudept values ('������',6);

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

insert into member values (member_seq.nextval,'sales@email.com','�̿���',4,'password','01012341234', null);
insert into member values (member_seq.nextval,'staff@email.com','������',5,'password','01012341234', null);
insert into member values (member_seq.nextval,'teacher@email.com','�迵��',3,'password','01012341234', null);
insert into member values (member_seq.nextval,'teacher1email.com','���μ�',3,'password','01012341235',null);
insert into member values (member_seq.nextval,'teacher2@email.com','Ȳ����',3,'password','01012341235',null);
insert into member values (member_seq.nextval,'teacher3@email.com','������',3,'password','01012341235',null);

--�⼮���̺�
create table attendance( 
	nalja date not null,
	num number,
	state varchar2(10),
	foreign key(num) references member(num) on delete cascade
);

--�����Խ���
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


--��������Խ���
create table recruit (
	recruit_file_name varchar2(200),
	recruit_num number primary key,	
	foreign key(recruit_num) references lectures(lecture_num) on delete cascade
);


--�ڷ�� �Խ��� ����
create sequence dataroom_seq;
create table dataroom(
	drNum number primary key,
	drTitle varchar2(200) default '�������',
	num number,
	drDate date,
	fileName varchar2(300),
	drContent varchar2(2048),
	foreign key (num) references member(num)
);

 --�������� �Խ���
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


