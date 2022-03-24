Create database Handson2

use Handson2

create table Salesman
(
   SalesmanId numeric(5) primary key,
   S_Name varchar(13),
   City varchar(15),
   Commission decimal(5,2)

)

insert into Salesman values(5001,'James Hoog','New York',0.15),(5002,'Nail Knite','Paris',0.13),(5005,'Pit Alex','London',0.11),
                           (5006,'Mc Lyon','Paris',0.14),(5007,'Paul Adam','Rome',0.13),(5003,'Lauson Hen','San Jose',0.12)
select * from Salesman


create table Customer
(
  customer_id numeric(5) primary key,
  cust_name varchar(30),
  city varchar(15),
  grade numeric(3),
  salesman_id numeric(5) references Salesman(SalesmanId)
)

 insert into Customer values(3002,'Nick Rimando','New York',100,5001)
 insert into Customer values(3007,'Brad Davis','New York',200,5001)
 insert into Customer values(3005,'Graham Zusi','California',200,5002)
 insert into Customer values(3008,'Julian Green','London',300,5002)
 insert into Customer values(3004,'Fabian Johnson','Paris',300,5006)
 insert into Customer values(3009,'Geoff Cameron','Berlin',100,5003)
 insert into Customer values(3003,'Jozy Altidor','Moscow',200,5007)
 insert into Customer(customer_id,cust_name,city,salesman_id)  values(3001,'Brad Guzan','London',5005)

select * from Customer

create table Orders
(
  ord_no numeric(10),
  purch_amt  decimal(8,2),
  ord_date  date,
  customer_id numeric(5)  references Customer(customer_id),
  salesman_id numeric(5)  references Salesman(SalesmanId)
 )
 insert into Orders(ord_no,purch_amt,ord_date,customer_id,salesman_id) values(70001,150.5,'2012-10-05',3005,5002),(70009,270.65,'2012-09-10',3001,5005),
                   (70002,65.26,'2012-10-05',3002,5001),(70004,110.5,'2012-08-17',3009,5003),(70007,948.5,'2012-09-10',3005,5002),
				   (70005,2400.6,'2012-07-27',3007,5001),(70008,5760,'2012-09-10',3002,5001),(70010,1983.43,'2012-10-10',3004,5006),
				   (70003,2480.4,'2012-10-10',3009,5003),(70012,250.45,'2012-06-27',3008,5002),(70011,75.29,'2012-08-17',3003,5007),(70013,3045.6,'2012-04-25',3002,5001)

select * from Orders

--(1)
select ord_date,salesman_id,ord_no,purch_amt from Orders

--(2)
select SalesmanId from Salesman

--(3)
select S_Name, City from Salesman where City = 'Paris'

--(4)
select ord_no, ord_date, purch_amt from Orders where salesman_id = 5001

--(5)
 
select customer_id,cust_name,city,grade, salesman_id from Customer where city = 'New York' AND grade >100;

--(6)
select SalesmanId,S_Name,City,Commission from Salesman where Commission>0.10 AND Commission<0.12;

--(7)
select Sum(purch_amt) as 'Total_purch_amt' from Orders

--(8)
select Avg(purch_amt) as 'Avg_purch_amt' from Orders

--(9)
select Count(SalesmanId) as 'No._of_ Salespeople' from Salesman

--(10)
select customer_id,Sum(purch_amt) as 'Max_purch_amt' from Orders group by customer_id

--(11)
select ord_date,Sum(purch_amt) as 'Highest_purch_amt' from Orders group by ord_date

--(12)
select salesman_id,purch_amt from Orders where ord_date = '2012-08-17'

--(13)
select city from Customer group by city
select cust_name,S_Name from customer inner join Salesman 
on Customer.city = Salesman.City

--(14)
select ord_no,purch_amt,customer_id from Orders where purch_amt>=500 AND purch_amt<=2000;

--(15)
select S_Name,City,Commission from Salesman where Commission > 0.12

--(16)
select * from Customer order by customer_id asc










