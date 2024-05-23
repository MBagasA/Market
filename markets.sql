create table users
(
	user_id Int not null primary key,
	Name Varchar,
	Age Int,
	Gender Varchar,
	Country Varchar
);


create table product 
(
	Product_id Int not null primary key,
	Product_name Varchar,
	Price numeric
);


insert into users (user_id,Name,Age,Gender,Country)
values
	(1, 'Karen Bristol', 25, 'Female', 'Turkey'),
	(2, 'Charles Ross',  28, 'Male',   'Kenya'),
	(3, 'Wisley Jack',   24, 'Male',   'Ukraine'),
	(4, 'James Brown',   35, 'Male',   'Spain'),
	(5, 'Gregory',       40, 'Male',   'Belgium'),
	(6, 'Jennifer',      52, 'Female', 'Brazil'),
	(7, 'Cheryl Lane',   30, 'Female', 'Thailand'),
	(8, 'Kim Escamilla', 29, 'Female', 'Thailand'),
	(9, 'Myrtle Anthony',27, 'Female', 'Poland'),
	(10,'Lorraine',      32, 'Male',   'Singapore'),
	
	(11, 'John Glass',   33, 'Male',   'Macao'),
	(12, 'Thomas Owens', 34, 'Male',   'Poland'),
	(13, 'James',        40, 'Male',   'Poland'),
	(14, 'Renata Kelly', 42, 'Female', 'Swiss'),
	(15, 'Crumbley',     41, 'Female',  'Spain');
	
	
	
	insert into product (product_id,product_name,price)
	values
	(1,	'Batik', 250000),
	(2, 'Kemeja Putih', 150000),
	(3, 'Kemeja Biru', 200000),
	(4, 'Celana Hitam',150000),
	(5, 'Celana Grey', 300000),
	(6, 'Kemeja hitam',250000),
	(7, 'Kemeja grey', 350000),
	(8, 'Kaos hitam',   60000),
	(9, 'Kaos grey',    40000),
	(10,'kaos putih',   30000),
	(11,'Kemeja flanel',150000),
	(12,'Kaos Panjang',  70000),
	(13,'Jaket putih',  400000),
	(14,'Jaket hitam',  500000),
	(15,'Sweter',       300000);
	

--COUNTRY SPAIN
select user_id,Name,Age,Gender,Country
from users
where country ='Spain'
order by user_id 

--mencari umur kurang dari 30
select user_id, name, age, product_name from users  
left join product on product_id = user_id
where age <30;

--mencari product kaos putih
select product_id, product_name,price
from product
where product_name ='kaos putih';

--mencari data warga thailand dan berusia kurang dari sama dengan 30
select user_id,name,product_name,country,age from users 
left join product on product_id = user_id
where country ='Thailand' and age <=30;

--MENCARI GENDER LAKI LAKI yang membeli kaos putih

select user_id, name,gender,age,product_name from users 
inner join product on product_id = user_id
where gender = 'Male'and product_name = 'kaos putih';

select user_id,name, gender,product_name,price from users 
inner join product on product_id = user_id
where price <=100000 and gender ='Female';

--menggabungkan dan mencari harga antara 100000 dan 300000 dan gender male

select user_id, name,gender, product_id, product_name, price from users 
inner join product on product_id = user_id
where price between 100000 and 300000 and gender ='Male';

--Mencari umur kurang dari sama dengan 35 dan harga lebih dari sama dengan 100000

select user_id,name,gender,age,product_name,price from users 
inner join product on product_id = user_id
where age <=35 and gender ='Male' and price >=100000

--mencari 3 harga termahal

select user_id,name, product_name,gender,max (price)as most_expensive from users 
inner join product on product_id = user_id
group by user_id, name, gender, product_name
order by most_expensive desc
limit 3;

--Update Item
update product 
set product_name =
case product_id 
	when 3 then 'Kemeja putih'
	when 5 then 'Kaos putih'
	when 9 then 'Batik'
	when 10 then 'Batik'
end 
where product_id IN (3,5,9,10);

--mencari kategori batik
select user_id, name, product_id, product_name, price from users 
inner join product on product_id = user_id
where product_name ='Batik'







