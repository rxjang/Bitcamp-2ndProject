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