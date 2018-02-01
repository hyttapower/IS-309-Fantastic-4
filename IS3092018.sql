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