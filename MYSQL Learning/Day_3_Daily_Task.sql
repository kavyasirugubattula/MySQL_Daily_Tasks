---- Case - 1 Student table ----

INSERT INTO students(admission_number,first_name,last_name,email,phone,date_of_birth,program_name,admission_date, cgpa,student_status)
VALUES ('STU26C001','Ananya','Rao','ananya.rao@example.test','9876501001','2007-04-18','BSC Compter Science','2026-07-01',8.40,'Active');

INSERT INTO students(admission_number,first_name,last_name,email,date_of_birth,program_name,admission_date, cgpa,student_status)
VALUES ('STU26C002','Vivaan','Sharma','vivaan.sharma@example.test','2006-12-09','BCom','2026-07-01',7.75,'Active');

INSERT INTO students(admission_number,first_name,last_name,email,phone,date_of_birth,program_name,admission_date, cgpa,student_status)
VALUES ('STU26C003','Diya','Nair','diya.nair@example.test','9876501003','2007-04-18','BA Economics','2026-07-01',9.10,'Active');

INSERT INTO students(admission_number,first_name,last_name,email,phone,date_of_birth,program_name,admission_date, cgpa,student_status)
VALUES ('STU26C004','Kabir','singh','kabir.singh@example.test','9876501001','2007-04-18','BSC Compter Science','2026-07-01',6.85,'Suspended');

INSERT INTO students(admission_number,first_name,last_name,email,phone,date_of_birth,program_name,admission_date, cgpa,student_status)
VALUES ('STU26C005','Tara','Bose','tara.bose@example.test','9876501001','2007-04-18','BA History','2026-07-01',5.90,'Dropped');

INSERT INTO students(admission_number,first_name,last_name,email,phone,date_of_birth,program_name,admission_date, cgpa,student_status)
VALUES ('STU26C006','Tara','Bose','tara.bose@example.test','9876501001','2007-04-18','BA History','2026-07-01',5.90,'Dropped');

/* ---- Error occured when trying to add the same email address Error Code:1062. Duplicate entry 'tara.bose@example.test' for key 'students_uq_email' ----- */

INSERT INTO students(admission_number,first_name,last_name,email,phone,date_of_birth,program_name,admission_date, cgpa,student_status)
VALUES ('STU26C007','Tara','Bose','tara1@example.test','9876501001','2007-04-18','BA History','2026-07-01',9.90,'Transferred');

/* --- Check constraint 'chk_cgpa' is voilated ---- */

/* Updating Queries */

UPDATE students 
SET cgpa= 8.50 
WHERE admission_number='STU26C001';

UPDATE students 
SET cgpa = cgpa+0.20 
WHERE program_name='BSC Computer Science' AND student_status = 'Active' AND cgpa<=10.00;

UPDATE students
SET student_status='Active'
WHERE admission_number='STU26C004';

UPDATE students
SET program_name='BCom Finance'
WHERE program_name = 'BCom';

UPDATE students 
SET email = 'kabir.singh@example.test' 
WHERE admission_number='STU26C003';

/* Error Code:1062. Duplicate entry 'kabir.singh@example.test' for key 'students.-uq_email' */

/* Deleting Queries */

DELETE FROM students 
WHERE student_status='Dropped';

INSERT INTO students(admission_number,first_name,last_name,email,phone,date_of_birth,program_name,admission_date, cgpa,student_status)
VALUES ('STU-TEMP-001','Kavya','siru','kavya@example.test','9876501001','2007-04-18','BA History','2026-07-01',9.90,'Active');

DELETE FROM students
WHERE admission_number='STU-TEMP-001'; 

SELECT * FROM students;


------- CASE -2 Product Table -------

INSERT INTO products(sku,product_name,category,brand,unit_price,quantity_in_stock,reorder_level)
VALUES ('SKU001','USB-C Cable','Accessories','TechLine',399.00,50,10);

INSERT INTO products(sku, product_name, category, brand, unit_price, quantity_in_stock,reorder_level, manufacture_date, expiry_date, product_status)
VALUES('SKU-KBD-002', 'Wireless Keyboard', 'Accessories', 'KeyPro',1499.00, 8, 5, '2026-01-18', NULL, NULL),
('SKU-JCE-003', 'Orange Juice', 'Beverages', 'FreshDrop',120.00, 0, 20, '2026-01-18', '2026-12-01', 'Out of Stock');

INSERT INTO products(sku, product_name, category, brand, unit_price, quantity_in_stock,reorder_level, manufacture_date, expiry_date, product_status)
VALUES('SKU-NTB-004', 'A5 Notebook', 'Stationary', 'PaperNest',75.00, 120, 25, NULL, NULL, NULL),
('SKU-OLD-005', 'Legacy Adapter', 'Accessories', 'WireMax',299.00, 0, 0, NULL, NULL, 'Discontinued');

INSERT INTO products(sku, product_name, category, brand, unit_price, quantity_in_stock, reorder_level)
VALUES('SKU-NEG-006', 'Negative Price Product', 'Accessories', 'TestBrand',-100.00, 10, 5);

/* Check constraint 'chk_unit_price_must_be_greater_than_0' is violated */

INSERT INTO products(sku, product_name, category, brand, unit_price, quantity_in_stock,reorder_level, manufacture_date, expiry_date)
VALUES('SKU-DATE-007', 'Expired Product', 'Beverages', 'TestBrand',100.00, 10, 5, '2026-06-01', '2026-05-01');

/* Check constraint 'chk_expiry_date' is violated */

/* Updating queries */

SET SQL_SAFE_UPDATES = 0;

SELECT * FROM products;

UPDATE products
SET quantity_in_stock = quantity_in_stock+60,product_status='Active'
WHERE category='Beverages';

UPDATE products
SET unit_price = ROUND(unit_price * 1.05, 2)
WHERE category = 'Accessories';

UPDATE products
SET brand = null
WHERE product_name = 'A5 Notebook';

UPDATE products 
SET reorder_level = 15
WHERE product_status='Active' AND quantity_in_stock<10;

UPDATE products
SET quantity_in_stock=-1;
/* Out of range value for column 'quantity_in_stock' */


/*- Deleting Queries - */

DELETE FROM products
WHERE sku='SKU-OLD-005';

INSERT INTO products(sku, product_name, category, brand, unit_price, quantity_in_stock, reorder_level)
VALUES('SKU-NEG-999', 'Negative Price Product', 'Accessories', 'TestBrand',100.00, 10, 5);

DELETE FROM products
WHERE sku='SKU-OLD-999';


------- CASE -3 Customer Table -------