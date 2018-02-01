drop table accounts;
drop table address;
drop table projects;
drop table association;
drop table budget;
drop table donation;
drop table donationcart;
drop table donationlevel;
drop table focusarea;
drop table projects;
drop table protype;

create table accounts(
acc_uname varchar(59) primary key,
acc_pass varchar(59),
acc_email varchar(59),
acc_fname varchar(59),
acc_lname varchar(59),
acc_type varchar(59), 
acc_phone int,
acc_heardabout varchar(59)
);

create table association(
asso_id number generated always as identity(start with 1 increment by 1) primary key,
asso_title varchar(59),
asso_url varchar(59)
);

create table projects(
pro_id number generated always as identity(start with 1 increment by 1) primary key,
pro_title varchar(59),
pro_subtitle varchar(59),
pro_description varchar(599),
pro_crdate date,
pro_goal int,
pro_deadline date,
pro_howdo varchar(59),
pro_whydo varchar(59),
pro_status varchar(59)
);

create table donationlevel(
level_id number generated always as identity(start with 1 increment by 1) primary key,
level_amount int,
level_description varchar (599)
);

create table budget(
budget_id number generated always as identity(start with 1 increment by 1) primary key,
budget_platfee int default 35, /* $35 */
budget_donprocfee int default 1.03, /* 3% */
budget_cost int
);

create table address(
add_id number generated always as identity(start with 1 increment by 1) primary key,
add_mstreet varchar(59) not null,
add_ostreet varchar(59),
add_city varchar(59),
add_state varchar(59),
add_pcode int
);

create table protype(
type_id number generated always as identity(start with 1 increment by 1) primary key,
type_info varchar(59)
);

create table focusarea(
focus_id number generated always as identity(start with 1 increment by 1) primary key,
focus_area varchar(59)
);

create table donation(
don_ordnr number generated always as identity(start with 1 increment by 1) primary key,
don_date date default sysdate,
don_dispname varchar(59),
don_nn int, /*0 = yes, 1 = no*/
don_mail int /*0 = yes, 1 = no*/
);

create table donationcart(
pro_id int,
don_ordnr int,
cart_amount int,
primary key (pro_id, don_ordnr)
);
