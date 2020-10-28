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

