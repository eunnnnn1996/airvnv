--유저 테이블
create table auser(
 user_num number not null,
 user_id varchar2(12) unique not null,
 user_auth number(1) default 2 not null,/*0탈퇴,1.정지,2일반,3관리자*/
 constraint auser_pk primary key(user_num)
);

create table auser_detail(
	user_num number not null,
	user_name varchar2(30) not null,
	passwd varchar2(35) not null,
	phone varchar2(15) not null,
	photo blob,
	photo_name varchar2(100),
	zipcode varchar2(5) not null,
	address1 varchar2(90) not null,
	address2 varchar2(90) not null,
	reg_date date default sysdate not null,
	modify_date date,
	constraint auser_detail_pk primary key (user_num),
	constraint auser_detail_fk foreign key (user_num) references auser (user_num)
);
create sequence auser_seq;

--게시판 (매물 등록)

create table amarket(
	market_num number not null,
	market_type number(1) default 1 not null, --디폴트 1, 1.원룸 2.투룸 3.쓰리룸 4.오피스텔 5.아파트
	market_type_sort number(1) default 1 not null, --디폴트 1, 1.단독주택 2.다가구 3.빌라 4.상가
	zipcode varchar2(5) not null, --자동
	address1 varchar2(90) not null, --자동
	address2 varchar2(90) not null, --몇 동
	address3 varchar2(90) not null, --몇 호
	trade_type number(1) default 1 not null, --디폴트 1, 1.월세 2.전세
	trade_short number(1) default 2 not null, --디폴트 1, 1.가능 2.불가능
	otherpay number(50) not null,
	elevator number(1) default 1 not null, --디폴트 1, 1.가능 2.불가능 (엘리베이터)
	parking number(1) default 1 not null, --디폴트 1, 1.가능 2.불가능 (주차)
	veranda number(1) default 1 not null, --디폴트 1, 1.가능 2.불가능 (베란다)
	optionitem varchar2(300) , --디폴트 1, 1.가능 2.불가능	
	user_num number not null,
	constraint amarket_pk primary key (market_num),
	constraint amarket_fk foreign key (user_num) references auser (user_num)
);
create sequence amarket_seq;
--amarket 입력하고 다음단계 상세페이지
create table amarket_detail(
	market_num number not null,
	market_title varchar2(100) not null,
	market_content clob not null,
	user_num number not null,
	constraint amarket_detail_pk primary key (market_num),
	constraint amarket_detail_fk foreign key (user_num) references auser (user_num)
);
create table amarket_photo(
	market_num number not null,
	user_num number not null,
	real_name varchar2(300) not null,
	file_name varchar2(300) not null,
	file_size number not null,
	constraint amarket_photo_pk primary key (market_num),
	constraint amarket_photo_fk foreign key (user_num) references auser (user_num)
);


























