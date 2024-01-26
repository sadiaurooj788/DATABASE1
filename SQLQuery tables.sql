create database Army
use Army
CREATE TABLE  branch (branchNo VARCHAR (20) NOT NULL PRIMARY KEY,
street VARCHAR(20),
city VARCHAR (20),
postcode VARCHAR (20)
);
INSERT INTO branch VALUES ('B006','22Deer RD','london','SW1');
INSERT INTO branch VALUES ('B005','16ARGY','aberdeen','AB2');
INSERT INTO branch VALUES ('B003','163 main st','Glasgow','G11');
INSERT INTO branch VALUES ('B004','32 manse','Bristol','BS99');
INSERT INTO branch VALUES ('B002','56 clover','london','NW10');
INSERT INTO branch VALUES ('B009','55 clover','LAHORE','NW1');
INSERT INTO branch VALUES ('B007','163 main st','Glasgow','G11');

SELECT * FROM branch;

create table staff1 
(staffNo varchar (20) not null primary key, 
fName varchar (20),
iName varchar (20),
posstion varchar (20),
gander varchar(20),
DOB VARCHAR (20),
salary varchar (20),
branchNo varchar(20) foreign key references branch(branchNo)null
);
insert into staff1 values ('SL21','John','white','manager','M','1-oct','30000','B007');
insert into staff1 values ('SG37','Ann','Beech','Assistant','F','10-NOV','12000','B003');
insert into staff1 values ('SG14','David','Ford','Supervisor','M','24-MAR','18000','B003');
insert into staff1 values ('SA9','Marry','Howe','Assistant','F','19-FEB','90000','B007');
insert into staff1 values ('SG5','Susan','Brand','Manager','F','3-jun','24000','B003');
insert into staff1 values ('SL41','Julie','Lee','Assistant','F','13-jun','9000','B005');
insert into staff1 values ('SL42','Julie','Lee','Assistant','F','13-jun','9000','B005');

select *from staff1;


create table PropertyForRent(propertyNo varchar(20) primary key not null,
street varchar (20),
city varchar (20),
postcode varchar (20),
kind varchar(20), 
rooms varchar(20),
rent varchar(20),
ownerNo varchar(20) foreign key references privateOwner(ownerNo)null ,
staffNo varchar(20) foreign key references staff1 (staffNo)null ,
branchNo varchar(20) foreign key references branch(branchNo)null);
insert into PropertyForRent values('PA14','16Holhead','Aberdeen','AB75SU','House','6','650','CO46','SA9','B007');
insert into PropertyForRent values('PL94','6Argyll St','Landon','NW2','Flat','4','400','CO87','SL41','B005');
insert into PropertyForRent values('PG36','2Manor RD','Glasgow','G324QX','Flat','3','375','CO93','SG37','B003');
insert into PropertyForRent values('PG21','18Dale RD','Glasgow','G12','House','5','600','CO87','SG37','B003');
insert into PropertyForRent values('PG16','5Nover Dr','Glasgow','G129AX','Flat','4','450','CO93','SG14','B003');
SELECT *FROM PropertyForRent;
create table client(clientNo varchar(20) primary key not null,
fName varchar(20),
lName varchar(20), telNo varchar(20),
preftype varchar(20),maxRent varchar(20));
insert into client values('CR76','John','Kay','1122','Flat','425');
insert into client values('CR56','Aline','stewart','2211','Flat','350');
insert into client values('CR74','Mike','Ritchie','3344','House','750');
insert into client values('CR62','Mary','Tregear','4433','Flat','600');
select *from client;
create table privateOwner(ownerNo varchar(20) primary key not null,
fName varchar (20), 
lName varchar(20),
address varchar(50),
tellNo varchar(20));
insert into privateOwner values('CO46','Joe','Koegh','2 Fergus Dr','7788');
insert into privateOwner values('CO87','Carol','Farrel','6 Achray St','8877');
insert into privateOwner values('CO40','Tina','Murphy',' 63 Well St','9966');
insert into privateOwner values('CO93','Tony','Shaw','12 Park PI','6699');
SELECT * FROM privateOwner;


create table viewing1 (clientNo varchar(20) Foreign key references client(clientNo) null,
propertyNo varchar(20) Foreign key references PropertyForRent(propertyNo) null,viewData varchar(20),comment varchar (20));

insert into viewing1 values('CR56','PA14','24-MAY-04','too small');
insert into viewing1 values('CR76','PL94','20-APR-04','too REMOTE');
insert into viewing1 values('CR62','PA14','14-MAY-04','no DINING ROOM');
insert into viewing1 values('CR56','PG36','28-APR-04','');

select *from viewing1;



create table Registration(clientNo varchar(20) foreign key references client(clientNo)null ,
branchNo varchar(20) foreign key references branch (branchNo)null, 
staffNo varchar(20) foreign key references staff1(staffNo)null, dateJoined varchar (20));

insert into Registration values ('CR76','B006','SL41','2-JUN');
insert into Registration values('CR56','B005','SG37','11-APR');
insert into Registration values('CR74','B003','SG14','16-NOV');
insert into Registration values('CR62','B002','SG5','7-MAR');
SELECT *FROM Registration;

select* from branch;
select branchNo from branch;
select branchNo from branch where branchNo ='B002' ;
select branchNo,street,city,postcode from branch where branchNo ='B002' ;
select branchNo,street,city,postcode from branch;
create domain branchNo AS varchar (20) CHECK (value IN (select branchNo from branch));























