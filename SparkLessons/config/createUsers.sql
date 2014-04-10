Drop table users;

CREATE TABLE users (
userid varchar (20),
password varchar(20),
email varchar(100),
firstname varchar (50),
lastname varchar (50),  
masteraccount varchar (10),
realmid varchar (20),
accountnumber varchar(20),
loginid varchar(50));

insert into users (userid, password, email, firstname, lastname, masteraccount, realmid, accountnumber, loginid)
values ();

select userid, password, email, firstname, lastname, masteraccount, realmid, accountnumber, loginid from users;