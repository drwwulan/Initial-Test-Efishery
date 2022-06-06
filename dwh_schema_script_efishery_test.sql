create table public.dim_customers(
	id int primary key,
	name varchar
);

create table public.dim_products(
	id int primary key,
	name varchar
);

create table public.fact_orders(
	order_line_number varchar primary key,
	order_number varchar,
	order_date date,
	customer_id int,
	product_id int,
	quantity int,
	usd_amount decimal
);

create table public.fact_transactions(
	invoice_number varchar primary key,
	invoice_date date,
	order_number varchar,
	order_date date,
	customer_id int,
	payment_number varchar,
	payment_date date
);

alter table public.fact_orders add foreign key (customer_id) references dim_customers (id);
alter table public.fact_orders add foreign key (product_id) references dim_products (id);
alter table public.fact_transactions add foreign key (customer_id) references dim_customers (id);

insert into dim_customers values(22601, 'Aini');
insert into dim_customers values(22602, 'Robby');
insert into dim_customers values(22603, 'Sandy');

insert into dim_products values(111, 'Jam dinding');
insert into dim_products values(112, 'Meja belajar');
insert into dim_products values(113, 'Rak buku');

insert into fact_orders values('ORD06220001-01', 'ORD06220001', '2022-01-01', 22601, 112, 1, 15.00);
insert into fact_orders values('ORD06220001-02', 'ORD06220001', '2022-01-01', 22601, 113, 1, 8.00);
insert into fact_orders values('ORD06220003-01', 'ORD06220003', '2022-01-02', 22603, 113, 1, 8.00);
insert into fact_orders values('ORD06220004-01', 'ORD06220004', '2022-01-03', 22602, 111, 2, 10.00);
insert into fact_orders values('ORD06220005-01', 'ORD06220005', '2022-01-03', 22601, 111, 1, 5.00);

insert into fact_transactions values('INV5001', '2022-01-02', 'ORD06220001', '2022-01-01', 22601, 'PYM3001', '2022-01-05');
insert into fact_transactions values('INV5008', '2022-01-03', 'ORD06220003', '2022-01-02', 22603, 'PYM3003', '2022-01-06');
insert into fact_transactions values('INV5011', '2022-01-04', 'ORD06220004', '2022-01-03', 22602, 'PYM3008', '2022-01-07');
insert into fact_transactions values('INV5017', '2022-01-04', 'ORD06220005', '2022-01-03', 22601, 'PYM3010', '2022-01-08');
