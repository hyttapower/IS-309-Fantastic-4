drop table typeasso;
drop table focusasso;

drop table budget;
drop table donationlevel;

drop table association;
drop table donationcart;
drop table donation;

drop table protype;
drop table focusarea;

drop table projects;
drop table accounts;
drop table address;

create table address(
    add_id number generated always as identity(start with 1 increment by 1) primary key,
    add_mstreet varchar(59) not null,
    add_ostreet varchar(59),
    add_city varchar(59) not null,
    add_state varchar(59) not null,
    add_pcode int not null
);

INSERT INTO address (add_mstreet, add_ostreet, add_city, add_state, add_pcode)
VALUES ('Bla road 56', 'Blæ road 100', 'Oslo', 'Norway', '5050'); 

INSERT INTO address (add_mstreet, add_ostreet, add_city, add_state, add_pcode)
VALUES ('Ola street', 'Bob street', 'Tromsø', 'Norway', '6060');

INSERT INTO address (add_mstreet, add_ostreet, add_city, add_state, add_pcode)
VALUES ('Sky street', 'Blæ road 1300', 'Bodø', 'Norway', '8080');

create table accounts(
    acc_uname varchar(59) primary key,
    acc_pass varchar(59) not null,
    acc_email varchar(59) not null,
    acc_fname varchar(59),
    acc_lname varchar(59),
    acc_type varchar(59) not null, 
    acc_phone int,
    acc_heardabout varchar(99),
    add_id int,
    foreign key (add_id) references address(add_id)
);

INSERT INTO accounts (acc_uname, acc_pass, acc_email, acc_fname, acc_lname, acc_type, acc_phone, acc_heardabout, add_id) /*acc_type, private og bussnies*/
VALUES ('Morten', 'ost', 'hello@hotmail.com', 'Morten', 'Hansen', 'Private', 111222333, 'Heard about you from facebook', 1);

INSERT INTO accounts (acc_uname, acc_pass, acc_email, acc_fname, acc_lname, acc_type, acc_phone, acc_heardabout, add_id)
VALUES ('Kim', 'brød', 'godbey@hotmail.com', 'Kim', 'Karsel', 'Business', 666555444, 'Heard about you from in my workplace', 2);

INSERT INTO accounts (acc_uname, acc_pass, acc_email, acc_fname, acc_lname, acc_type, acc_phone, acc_heardabout, add_id)
VALUES ('Vegar', 'kneip', 'Whygod@hotmail.com', 'Vegar', 'Lee', 'Private', 777888999, 'Found you true a add', 3);

create table association(
    asso_id number generated always as identity(start with 1 increment by 1) primary key,
    asso_title varchar(59) not null,
    asso_url varchar(59) not null,
    acc_uname varchar(59) not null,
    foreign key (acc_uname) references accounts(acc_uname)
);

INSERT INTO association (asso_title, asso_url, acc_uname)
VALUES ('The great ones', 'http/The great ones.com', 'Morten');

INSERT INTO association (asso_title, asso_url, acc_uname)
VALUES('The bad ones', 'http/The bad ones.com', 'Kim');

INSERT INTO association (asso_title, asso_url, acc_uname)
VALUES ('FANTASTIC4', 'http/FANTASTIC4.com', 'Vegar');

create table projects(
    pro_id number generated always as identity(start with 1 increment by 1) primary key,
    pro_title varchar(59) not null,
    pro_subtitle varchar(59),
    pro_description varchar(599),
    pro_crdate date default sysdate,
    pro_goal int not null,
    pro_deadline VARCHAR(59) not null,
    pro_howdo varchar(59),
    pro_whydo varchar(59),
    pro_status varchar(59) not null,
    acc_uname varchar(59) not null,
    add_id int not null,
    foreign key (acc_uname) references accounts(acc_uname),
    foreign key (add_id) references address(add_id)
);

INSERT INTO projects (pro_title, pro_subtitle, pro_description, pro_goal, pro_deadline, pro_howdo, pro_whydo, pro_status, acc_uname, add_id)
VALUES ('Park', 'Better park', 'We want to make a better park', 10000, '11.05.18', 'Work', 'google', 'Submitted', 'Morten', 1);

INSERT INTO projects (pro_title, pro_subtitle, pro_description, pro_goal, pro_deadline, pro_howdo, pro_whydo, pro_status, acc_uname, add_id)
VALUES ('School prosject', 'IS-309', 'We want to make a great prosject so we can get a good grade', 
1000, '28.02.18', 'School', 'Teacher gave us a link', 'Open', 'Kim', 2);

INSERT INTO projects (pro_title, pro_subtitle, pro_description, pro_goal, pro_deadline, pro_howdo, pro_whydo, pro_status, acc_uname, add_id)
VALUES ('World counqest', 'Suprem leader', 'We want to make a better world', 100000000000, '28.05.18', 'School', 'google', 'Underway', 'Vegar', 3);

create table donationlevel(
    level_id number generated always as identity(start with 1 increment by 1) primary key,
    level_amount int not null,
    level_description varchar (599),
    pro_id int not null,
    foreign key (pro_id) references projects(pro_id)
);

INSERT INTO donationlevel (level_amount, level_description, pro_id)
VALUES (10, 'Thank you', 1);

INSERT INTO donationlevel (level_amount, level_description, pro_id)
VALUES (20, 'Thank you!', 2);

INSERT INTO donationlevel (level_amount, level_description, pro_id)
VALUES (30, 'Thank you!!', 3);

create table budget(
    budget_id number generated always as identity(start with 1 increment by 1) primary key,
    budget_platfee int default 35, /* $35 */
    budget_donprocfee int default 1.03, /* 3% = 1,03*/
    budget_cost int not null,
    pro_id int not null unique,
    foreign key (pro_id) references projects(pro_id)
);

INSERT INTO budget (budget_platfee, budget_donprocfee, budget_cost, pro_id)
VALUES (35, 3, 10000, 1); 

INSERT INTO budget (budget_platfee, budget_donprocfee, budget_cost, pro_id)
VALUES(35, 3, 2000, 2);

INSERT INTO budget (budget_platfee, budget_donprocfee, budget_cost, pro_id)
VALUES(35, 3, 5000, 3);

create table protype(
    type_id number generated always as identity(start with 1 increment by 1) primary key,
    type_info varchar(59)
);

INSERT INTO protype (type_info)
VALUES ('Type1'); 

INSERT INTO protype (type_info)
VALUES('Type2'); 

INSERT INTO protype (type_info)
VALUES('Type3');

create table typeAsso (
    type_id int,
    pro_id int,
    primary key (type_id, pro_id),
    foreign key (type_id) references protype(type_id),
    foreign key (pro_id) references projects(pro_id)
);

INSERT INTO typeAsso (type_id, pro_id)
VALUES (1, 3); 

INSERT INTO typeAsso (type_id, pro_id)
VALUES(2, 1); 

INSERT INTO typeAsso (type_id, pro_id)
VALUES(3, 2);

create table focusarea(
    focus_id number generated always as identity(start with 1 increment by 1) primary key,
    focus_area varchar(59)
);

INSERT INTO focusarea (focus_area)
VALUES ('Public Health');

INSERT INTO focusarea (focus_area)
VALUES('Sharing'); 

INSERT INTO focusarea (focus_area)
VALUES('School');

create table focusAsso (
    focus_id int,
    pro_id int,
    primary key (focus_id, pro_id),
    foreign key (focus_id) references focusarea(focus_id),
    foreign key (pro_id) references projects(pro_id)
);

INSERT INTO focusAsso (focus_id, pro_id)
VALUES (1, 2);

INSERT INTO focusAsso (focus_id, pro_id)
VALUES(2, 1); 

INSERT INTO focusAsso (focus_id, pro_id)
VALUES(3, 3);

create table donation(
    don_ordnr number generated always as identity(start with 1 increment by 1) primary key,
    don_date date default sysdate,
    don_dispname varchar(59),
    don_anon int default 0, /*1 = yes, 0 = no*/
    don_mail int default 0, /*1 = yes, 0 = no*/
    acc_uname varchar(59) not null,
    foreign key (acc_uname) references accounts(acc_uname)
);

INSERT INTO donation (don_dispname, don_anon, don_mail, acc_uname)
VALUES ('Yoda', '1', '1', 'Morten'); 

INSERT INTO donation ( don_dispname, don_anon, don_mail, acc_uname)
VALUES ('Duck', '0', '0', 'Kim'); 

INSERT INTO donation (don_dispname, don_anon, don_mail, acc_uname)
VALUES ('Beja', '1', '1', 'Vegar');

create table donationcart(
    pro_id int,
    don_ordnr int,
    cart_amount int not null,
    acc_uname varchar(59),
    primary key (pro_id, don_ordnr),
    foreign key (don_ordnr) references donation(don_ordnr),
    foreign key (acc_uname) references accounts(acc_uname)
);

INSERT INTO donationcart (pro_id, don_ordnr, cart_amount, acc_uname)
VALUES ('001', '100', '$20', 'Morten'), ('002', '200', '$50', 'Kim'), ('003', '300', '$30', 'Vegar');
