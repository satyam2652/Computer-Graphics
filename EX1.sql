create table CUSTOMERS
(
cust_id int unique, 
cust_name varchar(20), 
address_id int primary key
);

SELECT * FROM CUSTOMERS

INSERT INTO CUSTOMERS VALUES(101,'JOHN',301)
INSERT INTO CUSTOMERS VALUES(102,'JAMES',302)

CREATE TABLE ADDRESS
(
address_id int unique foreign key references CUSTOMERS(address_id),
address varchar(40)
);

insert into ADDRESS values(301,'Marcela Goa')
insert into ADDRESS values(302,'Porvorim Goa')

create table ORDERS
(
order_id int primary key,
customer_id int foreign key references CUSTOMERS(cust_id),
order_date date,
amount decimal
)

INSERT INTO ORDERS values(1001,101,'10/07/2020',5000)
INSERT INTO ORDERS values(1002,101,'10/07/2020',6000)

create table ITEMS
(
item_id int primary key, 
item_name varchar(50), 
item_desc varchar(40)
);

insert into ITEMS values(555,'bf','idlli');
insert into ITEMS values(666,'l','meals');
insert into ITEMS values(777,'d','fish');

create table ITEMS_ORDERS
(
order_id int foreign key references ORDERS(order_id),
item_id int foreign key references ITEMS(item_id)
);

insert into ITEMS_ORDERS values(1001,77