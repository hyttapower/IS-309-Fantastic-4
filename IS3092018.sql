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
add_id int auto increment,
add_mstreet varchar(59) not null,
add_ostreet varchar(59),
add_city varchar(59),
add_state varchar(59),
add_pcode int,
add_location varchar(59),
add_locdesc varchar (599),
constraint address_PK primary key(add_id)
);

create table projects(
pro_id int auto increment,
pro_title varchar(59),
pro_subtitle varchar(59),

);