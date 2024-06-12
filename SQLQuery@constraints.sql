create database DB1
use DB1
create table DB1(id int,designation varchar(50),gender char(7)) --Not Null
alter table DB1 alter column id int not null
insert into DB1 values(101,'cleaner','Male')
insert into DB1 values(null,'cleaner','Male')
insert into DB1 values('','cleaner','Male')
select * from DB1
create table DB2(id int,designation varchar(50),gender char(7)) --Unique constraint
alter table DB2 add constraint id_unique unique(id)
insert into DB2 values(101,'cleaner','Male')
insert into DB2 values(null,'cleaner','Male')
insert into DB2 values('','cleaner','Male')
insert into DB2 values(101,'Manager','Male')

create table DB3(id int,designation varchar(50),gender char(7)) --Check constraint
alter table DB3 add constraint ck_unique check(id>20)
insert into DB3 values(101,'cleaner','Male')
insert into DB3 values(null,'cleaner','Male') --Allows Null Values
insert into DB3 values('','cleaner','Male') --Invalid condition
insert into DB3 values(101,'Manager','Male') --Allows duplicate values
insert into DB3 values(10,'Manager','Male') --Invalid condition as the id < check value

create table DB4(id int,designation varchar(50),gender char(7)) --unique & default constraints should not be applied on same table
alter table DB4 add constraint default_Con default 200 for id
alter table DB4 add constraint default_Cons unique(id)
insert into DB4(designation,gender) values('cleaner','Male') --valid
insert into DB4 values(null,'cleaner','Male')     --valid
insert into DB4 values('','cleaner','Male')    --valid
insert into DB4 values(null,'cleaner','Male') --Invalid if both constraints are applied / valid if default constraint is applied
select * from DB4
insert into DB4 values(30,'cleaner','Male') --valid
insert into DB4(designation,gender) values('cleaner','Male') --Invalid if both constraints are applied / valid if default constraint is applied
truncate table DB4

--primary Key constraint
create table DB5(id int primary key,designation varchar(50),gender char(7))
insert into DB5 values(1,'Manager','Male')  --valid
insert into DB5 values(Null,'Manager','Male') --Invalid
insert into DB5 values('','Manager','Male') --valid
select * from DB5 where id=3
insert into DB5 values('','Manager','Male') --duplicate it will not allow
insert into DB5 values(3,'Cleaner','Female') 
alter table DB5 alter column designation varchar(50) not null
alter table DB5 alter column gender varchar(50) not null
alter table DB5 add constraint prim_key primary key(designation) --to proven 
create table DB6(id int,designation varchar(50),gender char(7))
alter table DB6 add constraint for_key foreign key(id) references DB5(id) --Foreign key constraint
alter table DB6 add constraint for_key primary key(id)
insert into DB6 values('','Manager','Male')
insert into DB6 values('','Manager','Male') --valid duplicate are allowed in the Foreign key constraint
select * from DB6 where id=3
insert into DB6 values(2,'Manager','Male') --invalid as the id=2 is not in the DB5 parent table
insert into DB6 values(3,'HOD','Female') 
insert into DB6 values(NULL,'Manager','Male') --Valid
--case i--where the foreign key in the child table is primary key
create table DB7(id int primary key,designation varchar(50),gender char(7))
alter table DB7 add constraint for_keys foreign key(id) references DB5(id)
insert into DB7 values('','Manager','Male') --valid
insert into DB7 values('','Manager','Male') --invalid as it voilates the primary key constraint
insert into DB7 values(NULL,'Manager','Male') --invalid as it voilates the primary key constraint
insert into DB7 values(102,'Manager','Male')  --invalid the parent table is not having the id=102
insert into DB7 values(3,'Manager','Male')  --valid it satified both the primary and foreign key constraints
alter table DB7 add constraint fore_key foreign key(gender) references DB5(gender) --the referening should be primary key in parent table


