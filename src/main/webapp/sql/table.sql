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
alter table amarket_detail add onoff number(1) default 1 not null;
alter table auser_detail add age number(20) default 0 not null;
create sequence auser_seq;

--게시판 (매물 등록)

create table amarket(
	market_num number not null,
	market_type number(1) default 1 not null, --디폴트 1, 1.호텔 2.펜션 3.게스트하우스 4.아파트 5.기타
	market_type_sort number(1) default 1 not null, --디폴트 1, 1.단독주택 2.다가구 3.빌라 4.상가
	zipcode varchar2(5) not null, --자동
	address1 varchar2(90) not null, --자동
	address2 varchar2(90) not null, --몇 동
	address3 varchar2(90) not null, --몇 호
	trade_type number(1) default 1 not null, --디폴트 1, 1.현장결제 2.온라인결제
	trade_short number(1) default 2 not null, --디폴트 1, 1.가능 2.불가능
	otherpay number(30) not null, --하루당 비용
	elevator number(1) default 1 not null, --디폴트 1, 1.가능 2.불가능 (엘리베이터)
	parking number(1) default 1 not null, --디폴트 1, 1.가능 2.불가능 (주차)
	veranda number(1) default 1 not null, --디폴트 1, 1.가능 2.불가능 (베란다)
	optionitem varchar2(300) ,	
	photo blob,
	photo_name varchar2(100),
	reg_date date default sysdate not null,
	modify_date date,
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
alter table amarket_detail add hit number(20) default 0 not null;

create table amarket_photo(
	market_num number not null,
	user_num number not null,
	real_name varchar2(300) not null,
	file_name varchar2(300) not null,
	file_size number not null,
	constraint amarket_photo_pk primary key (market_num),
	constraint amarket_photo_fk foreign key (user_num) references auser (user_num)
);

create table houselike(
	houselike_num number not null,
	market_num number not null,
	user_num number not null,
	alike number(1) not null,
	constraint houselike_pk primary key(houselike_num),
	constraint house_fk1 foreign key(market_num) references amarket(market_num),
	constraint auser_fk2 foreign key(user_num) references auser(user_num)
);

create sequence houselike_seq;

create table areview(
    review_num number not null,
    areview_content clob not null,
    zipcode varchar2(5) not null,
    address1 varchar2(90) not null,
	address2 varchar2(90) not null,
	address3 varchar2(90) not null,
    reg_date date default sysdate not null,
    user_num number not null,
	constraint areview_pk primary key (review_num),
	constraint areview_fk1 foreign key (user_num) references auser (user_num)
);
create sequence areview_seq;

create table areview_rate(
    areview_rate_num number not null,
    traffic number not null,
    building number not null,
    environment number not null,
    room number not null,
    review_num number not null,
    user_num number not null,
    constraint areview_rate_pk primary key (areview_rate_num),
    constraint areview_rate_fk1 foreign key (review_num) references areview (review_num),
    constraint areview_rate_fk2 foreign key (user_num) references auser (user_num)
);
create sequence areview_rate_seq;

create table apayment(
    date_num number not null,
    startdate date not null,
    enddate date not null,
    price varchar2(50),
    market_num number not null,
    user_num number not null,
    constraint apayment_pk primary key (date_num),
	constraint apayment_fk1 foreign key (user_num) references auser (user_num),
    constraint apayment_fk2 foreign key (market_num) references amarket (market_num)
);
create sequence adate_seq;

create table arate(
    rate_num number not null,
    title varchar(30) not null,
    content clob not null,
    all_rate number(1) not null, --총 점
    accuracy_rate number(1) not null, --사진에 대한 정확성
    clean_rate number(1) not null, --청결
    ease_rate number(1) not null, --편의성 
    position_rate number(1) not null, --위치
    communication_rate number(1) not null, --커뮤니케이션
    reg_date date default sysdate not null,
    user_num number not null,
    market_num number not null,
    constraint arate_pk primary key (rate_num),
	constraint arate_fk1 foreign key (user_num) references auser (user_num),
    constraint arate_fk2 foreign key (market_num) references amarket (market_num)
);

create sequence arate_seq;

create table aincome(
    income_num number not null,
    sum_income number(20) not null, --수입 총 합계
    reg_date date not null,		--마지막 수입
    market_num number not null,
    user_num number not null,
    constraint aincome_pk primary key (income_num),
	constraint aincome_fk1 foreign key (user_num) references auser (user_num),
    constraint aincome_fk2 foreign key (market_num) references amarket (market_num)
);
create sequence aincome_seq;

















