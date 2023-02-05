show databases;

create database oz_php_board;

use oz_php_board;

show tables;

create table member
(
    unq_id int auto_increment primary key,
    id varchar(40) not null unique ,
    pw varchar(40) not null ,
    name varchar(20) not null ,
    email varchar(50) not null ,
    regi_day date not null ,
    lv int not null default 9
);

create table notice
(
    noti_unq_id int auto_increment primary key,
    mbr_unq_id int,
    noti_title varchar(100) not null,
    noti_regi_date datetime not null,
    noti_edit_date datetime,
    foreign key (user_unq_id)
    references member(unq_id) on update cascade on delete no action
);

create table notice_content
(
    noti_cnt_unq_id int auto_increment primary key,
    noti_unq_id int not null,
    noti_cnt text not null,
    noti_is_html boolean,
    foreign key (noti_unq_id)
    references notice(noti_unq_id) on update cascade on delete cascade
);

select * from notice_content;
drop table notice_content;

create table notice_comment
(
    noti_cmt_unq_id int auto_increment primary key,
    mbr_unq_id int,
    noti_unq_id int not null,
    noti_cmt_cnt text not null,
    noti_cmt_regi_date datetime not null,
    noti_cmt_edit_date datetime,
    foreign key (mbr_unq_id)
    references member(unq_id) on update cascade on delete no action ,
    foreign key (noti_unq_id)
    references notice(noti_unq_id) on update cascade on delete cascade
);

create table qna
(
    qna_unq_id int auto_increment primary key,
    mbr_unq_id int,
    qna_title varchar(100) not null,
    qna_regi_date datetime not null,
    qna_edit_date datetime,
    foreign key (mbr_unq_id)
    references member(unq_id) on update cascade on delete no action
);

create table qna_recommend
(
    qna_rcmd_unq_id int auto_increment primary key,
    mbr_unq_id int,
    qna_unq_id int not null,
    foreign key (mbr_unq_id)
    references member(unq_id) on update cascade on delete no action ,
    foreign key (qna_unq_id)
    references qna(qna_unq_id) on update cascade on delete cascade
);

create table qna_content
(
    qna_cnt_unq_id int auto_increment primary key,
    qna_unq_id int not null,
    noti_cnt text not null,
    noti_is_html boolean default(false) not null,
    foreign key (qna_unq_id)
    references qna(qna_unq_id) on update cascade on delete cascade
);

create table qna_comment
(
    qna_cmt_unq_id int auto_increment primary key,
    mbr_unq_id int,
    qna_unq_id int not null,
    qna_cmt_cnt text not null,
    qna_cmt_regi_date datetime not null,
    qna_cmt_edit_date datetime,
    foreign key (mbr_unq_id)
    references member(unq_id) on update cascade on delete no action ,
    foreign key (qna_unq_id)
    references qna(qna_unq_id) on update cascade on delete cascade
);

create table qna_comment_recommend
(
    qna_cmt_rcmd_unq_id int auto_increment primary key,
    mbr_unq_id int,
    qna_cmt_unq_id int not null ,
    foreign key (mbr_unq_id)
    references member(unq_id) on update cascade on delete no action ,
    foreign key (qna_cmt_unq_id)
    references qna_comment(qna_cmt_unq_id) on update cascade on delete cascade
);

create table simple_board
(
    sb_unq_id int auto_increment primary key,
    mbr_unq_id int,
    sb_cat varchar(10) not null,
    sb_cnt text not null,
    sb_regi_date datetime not null,
    sb_edit_date datetime,
    foreign key (mbr_unq_id)
    references member(unq_id) on update cascade on delete no action
);

create table simple_board_comment
(
    sb_cmt_unq_id int auto_increment primary key,
    mbr_unq_id int,
    sb_unq_id int not null,
    sb_cmt_cnt text not null,
    sb_cmt_regi_date datetime not null,
    sb_cmt_edit_date datetime,
    foreign key (mbr_unq_id)
    references member(unq_id) on update cascade on delete no action ,
    foreign key (sb_unq_id)
    references simple_board(sb_unq_id) on update cascade on delete cascade
);
