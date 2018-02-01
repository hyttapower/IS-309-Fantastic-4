create database ioby;

drop table accounts;
create table accounts(
acc_uname varchar(59),
acc_pass varchar(59),
acc_email varchar(59),
acc_fname varchar(59),
acc_lname varchar(59),
acc_type varchar(59), 
acc_phone int,
constraint accounts_PK primary key(acc_uname)
);

select * from accounts;

drop table address;
create table address(
add_id int,
add_mstreet varchar(59) not null,
add_ostreet varchar(59),
add_city varchar(59),
add_state varchar(59),
add_pcode int,
add_location varchar(59),
add_locdesc varchar (599),
constraint address_PK primary key(add_id)
);

drop table projects;
create table projects(
pro_id int,
pro_title varchar(59),
pro_subtitle varchar(59),
pro_description varchar(599),
pro_crdate date,
pro_goal int,
pro_deadline date,
pro_howdo varchar(59),
pro_whydo varchar(59),
pro_focusarea varchar(59),
pro_status varchar(59),
pro_type varchar(59),
pro_heardabout varchar(59),
constraint projects_PK primary key(pro_id)
);

select * from projects;

create table association(
asso_id int,
asso_title varchar(59),
asso_url varchar(59),
constraint association_PK primary key (asso_id)
);

create table budget(
budget_id int,
budget_platfee int,
budget_donprocfee int,
budget_cost int,
constraint budget_PK primary key (budget_id)
);

drop table focusarea;
create table focusarea(
focus_id int,
focus_area varchar(59),
constraint focusarea_PK primary key (focus_id)
);

create table protype(
type_id int,
type_info varchar(599),
constraint protype_PK primary key (type_id)
);

create table donationlevel(
level_id int,
level_amount int,
level_description varchar (599),
constraint donationlevel_PK primary key (level_id)
);

create table donation(
don_ordnr int,
don_date date,
don_dispname varchar(59),
don_nn int, /*0 = yes, 1 = no*/
don_mail int, /*0 = yes, 1 = no*/
constraint donation_PK primary key (don_ordnr)
);

create table donationcart(
pro_id int,
don_ordnr int,
cart_amount int
);







