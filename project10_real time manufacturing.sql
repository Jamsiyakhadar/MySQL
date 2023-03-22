create database manufacturing;
use manufacturing;

CREATE TABLE region (
    region_id VARCHAR(25) PRIMARY KEY,
    region_name CHAR(50) NOT NULL
);

insert into region values('r001','tvm'),('r002','london'),('r003','newyork');
CREATE TABLE countries (
    country_id VARCHAR(25) PRIMARY KEY,
    country_name CHAR(25),
    region_id CHAR(50),
    FOREIGN KEY (region_id)
        REFERENCES region (region_id)
);

insert into countries values ('c99','india','r001'),('c88','uk','r002'),('c77','usa','r003');

CREATE TABLE locations (
    loc_id INT PRIMARY KEY,
    address CHAR(50),
    postal_code INT,
    city CHAR(50),
    state CHAR(50),
    country_id VARCHAR(25),
    FOREIGN KEY (country_id)
        REFERENCES countries (country_id)
);

insert into locations values (101,'tvm',695024,'tvm','kerala','c99'),(102,'london',98562,'chemsford','london','c88'),
(103,'newyork',5555,'newyork','newyork','c77');

CREATE TABLE warehouse (
    ware_id INT PRIMARY KEY,
    ware_name CHAR(25),
    loc_id INT,
    FOREIGN KEY (loc_id)
        REFERENCES locations (loc_id)
);

insert into warehouse values (200,'tvm central',101),(201,'manchester',102),(202,'newyork city',103);

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    fisrst_name CHAR(50),
    last_name CHAR(50),
    email VARCHAR(25),
    phone BIGINT,
    hire_date DATE,
    manager_id INT,
    job_title VARCHAR(50)
);

insert into employee values (303,'julie', 'luther','julie.luth.com',9874567814,'2003-05-30',900,'assistant'),
(301,'david','abraham','david@.com',8529367412,'1995-05-30',901,'warehouse lead');

CREATE TABLE products_category (
    cat_id INT PRIMARY KEY,
    cat_name CHAR(50)
);
drop table products;


insert into products_category values (400,'luxury watches'), (402,'luxury perfumes'),(403,'jewellery');

CREATE TABLE prodcuts (
    product_id VARCHAR(15) PRIMARY KEY,
    product_name CHAR(50),
    descriptions CHAR(50),
    standard_cost VARCHAR(50),
    list_price INT,
    cate_id INT,
    FOREIGN KEY (cate_id)
        REFERENCES products_category (cat_id)
);

insert into prodcuts values ('p09','fossil','watch','1200000 for 10',120000,400),('p08','hugho boss','perfume',
'100000 for 20',5000,402),
('p10','necklace','jewellery','1000000 for 5',250000,403);

CREATE TABLE cutomers (
    cust_id INT PRIMARY KEY,
    full_name CHAR(25),
    address CHAR(25),
    website CHAR(25),
    credit_limit FLOAT
);

insert into cutomers values (5000,'kennedy f','tvm','online.com',100000.00),
(5001,'kennenth k','london','www.com',2500000.00),(5002,'lorance', 'newyork','abc.com',500000.00);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    cust_id INT,
    FOREIGN KEY (cust_id)
        REFERENCES cutomers (cust_id),
    statuss CHAR(15),
    saleman_id INT,
    order_date DATE
);

insert into orders values (600,5000,'active',7000,'2022-05-30'),(601,5001,'active',7001,'2022-09-09'),(602,5002,
'active',7002,'2022-11-01');

CREATE TABLE order_items (
    order_id INT PRIMARY KEY,
    item_id INT,
    prod_id VARCHAR(15),
    FOREIGN KEY (prod_id)
        REFERENCES prodcuts (product_id),
    quantity INT NOT NULL,
    unit VARCHAR(15)
);

insert into order_items values( 80001, 9900,'p09',10,'10000 per item'),(80002,9990,'p08',20,'5000 per item'),
(80003,9999,'p10',5,'250000 per item');

CREATE TABLE inventories (
    prod_id VARCHAR(15),
    FOREIGN KEY (prod_id)
        REFERENCES prodcuts (product_id),
    ware_id INT,
    FOREIGN KEY (ware_id)
        REFERENCES warehouse (ware_id),
    quantity INT
);

insert into inventories values('p09',200,10),('p08',201,20),('p10',202,5);

CREATE TABLE contacts (
    contact_id INT PRIMARY KEY,
    first_name CHAR(25),
    last_name CHAR(20),
    email CHAR(20),
    phone BIGINT,
    cust_id INT,
    FOREIGN KEY (cust_id)
        REFERENCES cutomers (cust_id)
);

insert into contacts values (458,'julie','ken','kjulh@.com',900458322,5002);

select * from countries;

select * from region;

SELECT 
    c.country_id, c.country_name, c.region_id, r.region_name
FROM
    countries c
        LEFT JOIN
    region r ON c.region_id = r.region_id
WHERE
    country_name = 'india';

SELECT 
    city
FROM
    locations
WHERE
    loc_id = 101;

SELECT 
    l.city, l.country_id, r.region_name, c.country_name
FROM
    locations l
        JOIN
    countries c ON l.country_id = c.country_id
        JOIN
    region r ON r.region_id = c.region_id;
    
    select * from warehouse;
    
    SELECT 
    r.region_id, r.region_name, c.country_name, l.city
FROM
    region r
        JOIN
    countries c ON r.region_id = c.region_id
        JOIN
    locations l ON l.country_id = c.country_id;
    
    
    -- end --
    
    

CREATE TABLE contacts (
    contact_id INT PRIMARY KEY,
    first_name CHAR(25),
    last_name CHAR(20),
    email CHAR(20),
    phone BIGINT,
    cust_id INT,
    FOREIGN KEY (cust_id)
        REFERENCES cutomers (cust_id)
);

insert into contacts values (458,'julie','ken','kjulh@.com',900458322,5002);
