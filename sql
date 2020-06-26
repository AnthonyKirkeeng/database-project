postgres=# CREATE TABLE Users (
postgres(#   user_id serial,
postgres(#   first_name varchar(255),
postgres(#   last_name varchar(255),
postgres(#   email varchar(255),
postgres(#   PRIMARY KEY (user_id)
postgres(# );
CREATE TABLE
postgres=# CREATE TABLE Manufacturers (
postgres(#   company_id serial,
postgres(#   company_name varchar(255),
postgres(#   contact_name varchar(255),
postgres(#   contact_email varchar(255),
postgres(#   contact_number varchar(255),
postgres(#   PRIMARY KEY (company_id)
postgres(# );
CREATE TABLE
postgres=# CREATE TABLE Customers (
postgres(#   customer_id serial,
postgres(#   company_name varchar(255),
postgres(#   contact_name varchar(255),
postgres(#   contact_email varchar(255),
postgres(#   contact_number varchar(255),
postgres(#   PRIMARY KEY (customer_id)
postgres(# );
CREATE TABLE
postgres=#
postgres=# CREATE TABLE Items (
postgres(#   item_id serial,
postgres(#   name varchar(255),
postgres(#   description varchar(255),
postgres(#   PRIMARY KEY (item_id)
postgres(# );
CREATE TABLE
postgres=#
postgres=# CREATE TABLE PurchaseOrders (
postgres(#   po_id serial,
postgres(#   user_id integer,
postgres(#   manufacturer_id integer,
postgres(#   item_id integer,
postgres(#   quantity integer,
postgres(#   date_order varchar(255),
postgres(#   date_received varchar(255),
postgres(#   PRIMARY KEY (po_id)
postgres(#   FOREIGN KEY (user_id) REFERENCES Users (user_id),
postgres(#   FOREIGN KEY (manufacturer_id) REFERENCES Manufacturers (company_id)
postgres(# );
