-- 29/07/2022 Lect. 3

use training;

-- Foreign Key

drop table order_tbl;
create table order_tbl( orderid int primary key,custid int, productname varchar(50), city varchar(50), amount decimal(20,2),
foreign key (custid) references pk_tbl(custid));
select * from pk_tbl;
insert into order_tbl values(1, 100, 'Chocolates', 'Mumbai', 1020);
select * from order_tbl;
insert into order_tbl values(2, 101, 'Chocolates', 'Mumbai', 1020);
insert into order_tbl values(3, 102, 'Grocerry', 'Delhi', 2220);
select * from order_tbl;
insert into order_tbl values(4, 109, 'Grocerry', 'Dehradoon', 12220);
delete from pk_tbl where custid = 101;

-- On delete cascade

create table order_tbl1( orderid int primary key,custid int, productname varchar(50), city varchar(50), amount decimal(20,2),
foreign key (custid) references pk_tbl(custid) on delete cascade);
insert into order_tbl1 values(1, 100, 'Chocolates', 'Mumbai', 1020);
select * from order_tbl;
insert into order_tbl1 values(2, 101, 'Chocolates', 'Mumbai', 1020);
insert into order_tbl1 values(3, 102, 'Grocerry', 'Delhi', 2220);
select * from order_tbl1;
insert into order_tbl1 values(4, 109, 'Grocerry', 'Dehradoon', 12220);
delete from pk_tbl where custid = 101;
select * from pk_tbl;
delete from order_tbl1 where custid = 102;

-- On update cascade

show create table order_tbl2;
create table order_tbl2( orderid int primary key,custid int, productname varchar(50), city varchar(50), amount decimal(20,2),
foreign key (custid) references pk_tbl(custid) on update cascade);
select * from order_tbl;
insert into order_tbl2 values(2, 101, 'Chocolates', 'Mumbai', 1020);
insert into order_tbl2 values(3, 102, 'Grocerry', 'Delhi', 2220);
insert into order_tbl2 values(4, 107, 'Grocerry', 'Dehradoon', 12220);
insert into order_tbl2 values(1, 100, 'Grocerry + Daily needs', 'Kanpur', 5320);
insert into pk_tbl values(107, 'Virat Kohli' , 'M', 'Delhi', 20100);
select * from pk_tbl;
select * from order_tbl2;
update pk_tbl set custid = 111 where custid = 102;
delete from order_tbl where custid = 102;
select * from pk_tbl;
select * from order_tbl2;
select * from order_tbl1;
select * from order_tbl;

-- Default Constraints

create table df_tbl( custid integer primary key, custname varchar(50) not null, age int, city varchar(50) default 'Nagpur');
select * from df_tbl;
insert into df_tbl values(1001, 'Supriya', 23, 'Chennai');
insert into df_tbl values(1003, 'Riya', 25, 'Bangalore');
insert into df_tbl (custid, custname, age ) values(1000, 'Supriya', 23);

-- Check Constraints

create table ch_tbl( custid integer primary key, custname varchar(50) not null, age int check (age>0 and age <=100),
city varchar(50) default 'Nagpur');
insert into ch_tbl values(1,'Jai',45,'Chennai');
insert into ch_tbl values(2,'Veeru',43,'Bangalore');
insert into ch_tbl (custid, custname, age) values (4, 'Basanti',100);
insert into ch_tbl (custid, custname, age) values (5, 'Kalia',101);
select * from ch_tbl;

create table ch_tbl1( custid integer primary key, custname varchar(50) not null, age int check (age>0 and age <=100),
city varchar(50) check (city in ('Nagpur','Bangalore','Hyderabad','Pune')));
insert into ch_tbl1 values(42, 'MSD',38,'Pune');
select * from ch_tbl1;
insert into ch_tbl1 values(40, 'Sachin',42,'Pune');
insert into ch_tbl1 values(12, 'DK',32,'Delhi');  -- Error because city given is Bangalore, Hyderabad, Nagpur, Pune
insert into ch_tbl1 values(77, 'Rohit',34,'Nagpur');


























