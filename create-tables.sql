CREATE TABLE Users (
  user_id serial,
  first_name varchar(255),
  last_name varchar(255),
  email varchar(255),
  PRIMARY KEY (user_id)
);

CREATE TABLE Manufacturers (
  company_id serial,
  company_name varchar(255),
  contact_name varchar(255),
  contact_email varchar(255),
  contact_number varchar(255),
  PRIMARY KEY (company_id)
);

CREATE TABLE Customers (
  customer_id serial,
  company_name varchar(255),
  contact_name varchar(255),
  contact_email varchar(255),
  contact_number varchar(255),
  PRIMARY KEY (customer_id)
);

INSERT INTO Customers 
(company_name, contact_name, contact_email, contact_number) 
VALUES ('Bubly', 'Gerald Grover', 'Gerald.Grover@gmail.com', '888-123-4567' ) returning *;

UPDATE Customers SET 
contact_number = '888-321-7654'
WHERE customer_id =  1;

DELETE FROM Customers
WHERE Customer_id = 1 returning *

CREATE TABLE Items (
  item_id serial,
  name varchar(255),
  description varchar(255),
  PRIMARY KEY (item_id)
);

CREATE TABLE PurchaseOrders (
  po_id serial,
  user_id integer,
  manufacturer_id integer,
  item_id integer,
  quantity integer,
  date_order varchar(255),
  date_received varchar(255),
  PRIMARY KEY (po_id),
  FOREIGN KEY (user_id) REFERENCES Users (user_id),
  FOREIGN KEY (manufacturer_id) REFERENCES Manufacturers (company_id)
);

CREATE TABLE SalesOrders (
  so_id serial,
  user_id integer,
  customer_id integer,
  item_id integer,
  quantity integer,
  date_order varchar(255),
  date_received varchar(255),
  PRIMARY KEY (so_id),
  FOREIGN KEY (user_id) REFERENCES Users (user_id),
  FOREIGN KEY (customer_id) REFERENCES Customers (customer_id)
);
