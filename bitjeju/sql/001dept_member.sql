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
insert into member values (member_seq.nextval,'teacher2@email.com','Ȳ����',3,'password','01012341234',null);
insert into member values (member_seq.nextval,'teacher3@email.com','������',3,'password','01012341234',null);
