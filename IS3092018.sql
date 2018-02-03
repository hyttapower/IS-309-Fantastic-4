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

INSERT INTO adress (add_id, add_mstreet, add_ostreet, add_city, add_state, add_pcode)
VALUES ();

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

INSERT INTO accounts (acc_uname, acc_pass, acc_email, acc_fname, acc_lname, acc_type, acc_phone, acc_heardabout)
VALUES ('Morten', '001', 'hello@hotmail.com', 'Morten', 'Hansen', 'Donor', '111 222 333', 'Heard about you from facebook'), 
('Kim', '002', 'godbey@hotmail.com', 'Kim', 'Karsel', 'Project Leader', '666 555 444', 'Heard about you from in my workplace'),
('Vegar', '003', 'Whygod@hotmail.com', 'Vegar', 'Lee', 'Volunteer', '777 888 999', 'Found you true a add');

create table association(
    asso_id number generated always as identity(start with 1 increment by 1) primary key,
    asso_title varchar(59) not null,
    asso_url varchar(59) not null,
    acc_uname varchar(59) not null,
    foreign key (acc_uname) references accounts(acc_uname)
);

INSERT INTO association (asso_title, asso_url)
VALUES ('The great ones', 'http/The great ones.com'),
('The bad ones', 'http/The bad ones.com'),
('FANTASTIC4', 'http/FANTASTIC4.com');

create table projects(
    pro_id number generated always as identity(start with 1 increment by 1) primary key,
    pro_title varchar(59) not null,
    pro_subtitle varchar(59),
    pro_description varchar(599),
    pro_crdate date default sysdate,
    pro_goal int not null,
    pro_deadline date not null,
    pro_howdo varchar(59),
    pro_whydo varchar(59),
    pro_status varchar(59) not null,
    acc_uname varchar(59) not null,
    add_id int not null,
    foreign key (acc_uname) references accounts(acc_uname),
    foreign key (add_id) references address(add_id)
);

INSERT INTO projects (pro_title, pro_subtitle, pro_description, pro_crdate, pro_goals, pro_deadline, pro_howdo, pro_whydo, pro_status)
VALUES ('Park', 'Better park', 'We want to make a better park', '11.01.18', '$10.000', '11.05.18', 'Work', 'google', 'Submitted'),
('School prosject', 'IS-309', 'We want to make a great prosject so we can get a good grade', '07.02.18', '$1.000', '28.02.18', 'School', 'Teacher gave us a link', 'Open'),
('World counqest', 'Suprem leader', 'We want to make a better world', '03.002.18', '$100.000.000.000', '28.05.18', 'School', 'google', 'Underway');

create table donationlevel(
    level_id number generated always as identity(start with 1 increment by 1) primary key,
    level_amount int not null,
    level_description varchar (599),
    pro_id int not null,
    foreign key (pro_id) references projects(pro_id)
);

INSERT INTO donationlevel (level_amount, level_description)
VALUES ('$10', 'Thank you'), ('$20', 'Thank you!'), ('$30', 'Thank you!!');

create table budget(
    budget_id number generated always as identity(start with 1 increment by 1) primary key,
    budget_platfee int default 35, /* $35 */
    budget_donprocfee int default 1.03, /* 3% */
    budget_cost int not null,
    pro_id int not null,
    foreign key (pro_id) references projects(pro_id)
);

INSERT INTO bugdet (bugdet_platfee, bugdet_donprocfee, bugdet_cost)
VALUES ('$35', '3%', '$10.000'), ('$35', '3%', '$2.000'),('$35', '3%', '$5.000');

create table protype(
    type_id number generated always as identity(start with 1 increment by 1) primary key,
    type_info varchar(59)
);

INSERT INTO protype (type_info)
VALUES ('Individual'), ('Group or organization'), ('individual');

create table typeAsso (
    type_id int,
    pro_id int,
    primary key (type_id, pro_id),
    foreign key (type_id) references protype(type_id),
    foreign key (pro_id) references projects(pro_id)
);

create table focusarea(
    focus_id number generated always as identity(start with 1 increment by 1) primary key,
    focus_area varchar(59)
);

create table focusAsso (
    focus_id int,
    pro_id int,
    primary key (focus_id, pro_id),
    foreign key (focus_id) references focusarea(focus_id),
    foreign key (pro_id) references projects(pro_id)
);

create table donation(
    don_ordnr number generated always as identity(start with 1 increment by 1) primary key,
    don_date date default sysdate,
    don_dispname varchar(59),
    don_anon int default 0, /*0 = yes, 1 = no*/
    don_mail int default 0, /*0 = yes, 1 = no*/
    acc_uname varchar(59) not null,
    foreign key (acc_uname) references accounts(acc_uname)
);

create table donationcart(
    pro_id int,
    don_ordnr int,
    cart_amount int not null,
    acc_uname varchar(59),
    primary key (pro_id, don_ordnr),
    foreign key (don_ordnr) references donation(don_ordnr),
    foreign key (acc_uname) references accounts(acc_uname)
);
