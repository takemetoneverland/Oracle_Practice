
/* Drop Tables */

DROP TABLE DELIVERIES CASCADE CONSTRAINTS;
DROP TABLE ORDER_DETAILS CASCADE CONSTRAINTS;
DROP TABLE PAYMENTS CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE MEMBERS CASCADE CONSTRAINTS;
DROP TABLE PRODUCTS CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE DELIVERIES
(
	o_number number(10) NOT NULL,
	u_id varchar2(30) NOT NULL,
	d_name varchar2(30),
	d_phone varchar2(30),
	d_address varchar2(200),
	d_msg varchar2(200),
	d_company varchar2(30),
	d_status varchar2(30),
	PRIMARY KEY (o_number)
);


CREATE TABLE MEMBERS
(
	u_id varchar2(30) NOT NULL,
	u_name varchar2(30) NOT NULL,
	u_phone varchar2(30),
	u_pw varchar2(30) NOT NULL,
	u_address varchar2(200),
	PRIMARY KEY (u_id)
);


CREATE TABLE ORDERS
(
	o_number number(10) NOT NULL,
	u_id varchar2(30) NOT NULL,
	regdate date DEFAULT SYSDATE,
	total_price number(10),
	PRIMARY KEY (o_number)
);


CREATE TABLE ORDER_DETAILS
(
	o_number number(10) NOT NULL,
	p_num number(10) NOT NULL,
	detail_name varchar2(30),
	detail_count number(10),
	detail_price number(10),
	PRIMARY KEY (o_number, p_num)
);


CREATE TABLE PAYMENTS
(
	o_number number(10) NOT NULL,
	u_id varchar2(30) NOT NULL,
	p_way varchar2(30),
	p_status varchar2(30),
	PRIMARY KEY (o_number)
);


CREATE TABLE PRODUCTS
(
	p_num number(10) NOT NULL,
	p_name varchar2(30) NOT NULL,
	p_info varchar2(200),
	p_price number(10) NOT NULL,
	p_count number(10),
	p_img_loca varchar2(100),
	PRIMARY KEY (p_num)
);



/* Create Foreign Keys */

ALTER TABLE DELIVERIES
	ADD FOREIGN KEY (u_id)
	REFERENCES MEMBERS (u_id)
;


ALTER TABLE ORDERS
	ADD FOREIGN KEY (u_id)
	REFERENCES MEMBERS (u_id)
;


ALTER TABLE PAYMENTS
	ADD FOREIGN KEY (u_id)
	REFERENCES MEMBERS (u_id)
;


ALTER TABLE DELIVERIES
	ADD FOREIGN KEY (o_number)
	REFERENCES ORDERS (o_number)
;


ALTER TABLE ORDER_DETAILS
	ADD FOREIGN KEY (o_number)
	REFERENCES ORDERS (o_number)
;


ALTER TABLE PAYMENTS
	ADD FOREIGN KEY (o_number)
	REFERENCES ORDERS (o_number)
;


ALTER TABLE ORDER_DETAILS
	ADD FOREIGN KEY (p_num)
	REFERENCES PRODUCTS (p_num)
;



