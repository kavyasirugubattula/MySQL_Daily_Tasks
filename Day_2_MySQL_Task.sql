CREATE DATABASE cdg_hyd_jfs_058;

USE cdg_hyd_jfs_058; 

CREATE TABLE employees(
	employee_id INT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_joining DATE
); 

INSERT INTO employees(employee_id,first_name,last_name,date_of_joining)
VALUES (101,'Kavya','Sirugubattula','2026-06-20');

INSERT INTO employees
VALUES (102,'Sushma','Thamatam','2026-07-08');

INSERT INTO employees(first_name,last_name)
VALUES ('Madhu','Singireddi');

SELECT * FROM employees;

-- CASE-1 Student table --

CREATE TABLE students(
	student_id INT NOT NULL AUTO_INCREMENT,
    admission_number VARCHAR(15) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(120) NOT NULL,
    phone VARCHAR(15) ,
    date_of_birth DATE NOT NULL,
    program_name VARCHAR(100) NOT NULL,
    admission_date DATE NOT NULL,
    cgpa DECIMAL(4,2) NOT NULL,
    student_status VARCHAR(15) NOT NULL DEFAULT 'Active',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `pk_student_id` PRIMARY KEY (student_id),
    CONSTRAINT `uq_admission_number` UNIQUE (admission_number),
    CONSTRAINT `uq_email` UNIQUE (email),
    CONSTRAINT `chk_cgpa` CHECK (cgpa BETWEEN 0.00 AND 10.00)
);

INSERT INTO students(student_id,admission_number,first_name,last_name,email,phone,date_of_birth,program_name,admission_date, cgpa,student_status)
VALUES (1,'0215635','Kavya','Sirugubattula','kavyasirugubattula@gmail.com','1203456897','2005-06-18','CSE','2022-10-21',8.12,'Active');

SELECT * FROM students;


-- CASE-2 Product table --

CREATE TABLE products(
	product_id INT NOT NULL auto_increment,
    sku VARCHAR(20),
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(80) NOT NULL,
    brand VARCHAR(80),
    unit_price DECIMAL(12,2) NOT NULL,
    quantity_in_stock INT UNSIGNED NOT NULL DEFAULT 0,
    reorder_level INT UNSIGNED DEFAULT 5,
    manufacture_date DATE,
    expiry_date DATE,
    product_status VARCHAR(15) DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT `uq_sku` UNIQUE (sku),
    CONSTRAINT `pk_product_id` PRIMARY KEY (product_id),
    CONSTRAINT `chk_unit_price_must_be_greater_than_0` CHECK (unit_price > 0),
    CONSTRAINT `chk_expiry_date` CHECK (
									manufacture_date IS NULL 
                                    OR expiry_date IS NULL
                                    OR expiry_date>manufacture_date)
);
DROP TABLE products;

INSERT INTO products(sku,product_name,category,brand,unit_price,quantity_in_stock,reorder_level,manufacture_date,expiry_date)
VALUES ('sku001','mouse','electronics','lenovo','2000',20,5,'2025-06-18','2050-06-18');

INSERT INTO products(sku,product_name,category,brand,unit_price,quantity_in_stock,reorder_level,manufacture_date)
VALUES ('sku001','mouse','electronics','lenovo','2000',20,5,'2025-06-18');

SELECT * FROM products;


-- CASE-3 Customer table --

CREATE TABLE customers(
	customer_id INT NOT NULL AUTO_INCREMENT,
    customer_code VARCHAR(12) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50)NOT NULL,
    email VARCHAR(120) NOT NULL,
    phone VARCHAR(15),
    date_of_birth DATE,
    city VARCHAR(80) NOT NULL,
    state VARCHAR(80) NOT NULL,
    postal_code VARCHAR(12) NOT NULL,
    customer_type VARCHAR(15) NOT NULL DEFAULT 'REGULAR',
    credit_limit DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    is_active BOOLEAN DEFAULT TRUE,
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `pk_customer_id` PRIMARY KEY (customer_id),
    CONSTRAINT `uk_customer_code` UNIQUE (customer_code),
    CONSTRAINT `uk_email` UNIQUE (email),
    CONSTRAINT `uk_phone` UNIQUE (phone),
    CONSTRAINT `uk_credit_limit_must_be_greater_than_zero` CHECK (credit_limit > 0.00)
);
    
INSERT INTO customers(customer_code,first_name,last_name,email,phone,date_of_birth,city,state,postal_code,credit_limit)
VALUES ('123','Kavya','Sirugubattula','kavya@gmail.com','2457896344','2005-06-18','Eluru','AP','534452',30000);

SELECT * FROM customers;


-- CASE-4 Books table --


CREATE TABLE books(
	book_id INT NOT NULL AUTO_INCREMENT,
    isbn  CHAR(13) NOT NULL,
    title VARCHAR(200) NOT NULL,
    author_name VARCHAR(120) NOT NULL,
    genre VARCHAR(60) NOT NULL,
    publisher VARCHAR(120),
    publication_year SMALLINT NOT NULL,
    page_count SMALLINT NOT NULL,
    book_format VARCHAR(20) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    copies_available INT NOT NULL,
    language VARCHAR(40) NOT NULL DEFAULT 'English',
    added_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `pk_book_id` PRIMARY KEY(book_id),
    CONSTRAINT `uk_isbn` UNIQUE (isbn),
    CONSTRAINT `chk_page_count_greater_than_0` CHECK (page_count>0),
    CONSTRAINT `chk_price_non_negative` CHECK (price>=0),
    CONSTRAINT `chk_copies_available_non_negative` CHECK (copies_available>=0),
    CONSTRAINT `chk_publication_year_between_1000_to_2100` CHECK (publication_year BETWEEN 1000 AND 2100)
);

INSERT INTO books
(isbn, title, author_name, genre, publisher, publication_year, page_count, book_format, price, copies_available)
VALUES
('9780134685991', 'Effective Java', 'Joshua Bloch', 'Programming',
 'Pearson', 2018, 416, 'Paperback', 650.00, 10);
 
 
 -- CASE-5 Patients table --
 
 
 CREATE TABLE patients(
	patient_id INT NOT NULL AUTO_INCREMENT,
    patient_number VARCHAR(15) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_joining DATE NOT NULL,
    biological_sex VARCHAR(20) NOT NULL,
    blood_group VARCHAR(20),
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(120),
    emergency_contact_name VARCHAR(100) NOT NULL,
    emergency_contact_phone VARCHAR(15) NOT NULL,
    allergies TEXT,
    patient_status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    registered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `pk_patient_id` PRIMARY KEY (patient_id),
    CONSTRAINT `uk_patient_number` UNIQUE (patient_number),
    CONSTRAINT `chk_biological_sex` CHECK (biological_sex IN ('FEMALE', 'MALE', 'INTERSEX', 'NOT_DISCLOSED')),
    CONSTRAINT `chk_blood_group` CHECK (blood_group IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
    CONSTRAINT `chk_patient_status` CHECK (patient_status IN ('ACTIVE', 'INACTIVE', 'DECEASED'))
);

INSERT INTO patients
(patient_number, first_name, last_name, date_of_joining, biological_sex,
 blood_group, phone, email, emergency_contact_name,
 emergency_contact_phone, allergies)
VALUES
('PAT001', 'Kavya', 'Sirugubattula', '2026-09-24', 'FEMALE',
 'O+', '9876543210', 'kavya@gmail.com', 'Ravi Kumar',
 '9876501234', 'Peanuts');
 
 SELECT * FROM patients;


-- CASE-6 Bank account table --


CREATE TABLE bank_accounts(
	account_id INT NOT NULL AUTO_INCREMENT,
    account_number CHAR(12) NOT NULL,
    account_holder_name VARCHAR(120),
    account_type VARCHAR(20),
    balance DECIMAL(15,2) DEFAULT 0.00,
    currency_code CHAR(3) DEFAULT 'INR',
    branch_name VARCHAR(100),
    opened_date DATE,
    interest_rate DECIMAL(5,2) DEFAULT 0.00,
    overdraft_limit DECIMAL(12,2) DEFAULT 0.00,
    account_status VARCHAR(20) DEFAULT 'ACTIVE',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT `pk_account_id` PRIMARY KEY (account_id),
    CONSTRAINT chk_overdraft_limit_non_negative CHECK (overdraft_limit >= 0.00),
    CONSTRAINT chk_balance_non_negative CHECK (balance >= 0.00),
    CONSTRAINT chk_interest_rate CHECK (interest_rate BETWEEN 0.00 AND 100.00),
    CONSTRAINT `uk_account_number` UNIQUE (account_number)
);


-- CASE-7 Vehicle table --


CREATE TABLE vehicles(
	vehicle_id INT NOT NULL AUTO_INCREMENT,
    registration_number VARCHAR(20) NOT NULL,
    owner_name VARCHAR(120)NOT NULL,
    manufacturer VARCHAR(80) NOT NULL,
    model VARCHAR(80)NOT NULL,
    vehicle_type VARCHAR(20) NOT NULL,
    fuel_type VARCHAR(20) NOT NULL,
    purchase_date DATE,
    color VARCHAR(40) NOT NULL,
    odometer_km INT NOT NULL DEFAULT 0,
    insurance_expiry DATE,
    vehicle_status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT `pk_vehicle_id` PRIMARY KEY (vehicle_id),
    CONSTRAINT `uk_registration_number` UNIQUE (registration_number),
    CONSTRAINT `chk_odometer_non_negative` CHECK (odometer_km>=0),
    CONSTRAINT `chk_vehicle_type` CHECK (vehicle_type IN ('CAR','MOTORCYCLE','TRUCK','VAN','BUS')),
    CONSTRAINT `chk_vehicle_status` CHECK (vehicle_status IN ('ACTIVE','IN_SERVICE','SOLD','SCRAPPED')),
    CONSTRAINT `chk_fuel_type` CHECK (fuel_type IN ('PETROL','DIESEL','ELECTRIC','HYBRID','CNG'))
);
  
  
  -- CASE-8 Hotel rooms table --
  
    
CREATE TABLE hotel_rooms(
	room_id INT NOT NULL AUTO_INCREMENT,
    room_number VARCHAR(10) NOT NULL,
    room_type VARCHAR(20) NOT NULL,
    floor_number SMALLINT NOT NULL,
    bed_count TINYINT NOT NULL,
    max_occupancy TINYINT NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    availability_status VARCHAR(20)NOT NULL,
    has_air_conditioning BOOLEAN NOT NULL DEFAULT TRUE,
    smoking_allowed BOOLEAN NOT NULL DEFAULT FALSE,
    notes VARCHAR(225),
    created_at TIMESTAMP NOT NULL,
    update_at TIMESTAMP NOT NULL,
    CONSTRAINT `pk_room_id` PRIMARY KEY (room_id),
    CONSTRAINT `uk_room_nummber` UNIQUE (room_number),
    CONSTRAINT `chk_room_type` CHECK (room_type IN ('SINGLE','DOUBLE','DELUXE','SUITE')),
    CONSTRAINT `chk_bed_count` CHECK (bed_count >= 1),
    CONSTRAINT `chk_max_occupancy` CHECK (max_occupancy >= 1),
    CONSTRAINT `chk_price_per_night` CHECK (price_per_night > 0),
    CONSTRAINT `chk_availability_status` CHECK (availability_status IN ('AVAILABLE','RESERVED','OCCUPIED','MAINTENANCE'))
);
    
    
    
    -- CASE-9 Movies table --
    
    
CREATE TABLE movies(
	movie_id INT NOT NULL AUTO_INCREMENT,
    movie_code VARCHAR(12) NOT NULL,
    title VARCHAR(200) NOT NULL,
    genre VARCHAR(60) NOT NULL, 
    original_language VARCHAR(40) NOT NULL,
    release_date DATE,
    duration_minutes SMALLINT NOT NULL,
    director_name VARCHAR(120)NOT NULL,
    age_certificate VARCHAR(20) NOT NULL DEFAULT 'UNRATED',
    audience_rating DECIMAL(3,1),
    production_budget DECIMAL(15,2),
    catalog_status VARCHAR(20) NOT NULL DEFAULT 'UPCOMING',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT `pk_movie_id` PRIMARY KEY (movie_id),
    CONSTRAINT `uk_movie_code` UNIQUE (movie_code),
    CONSTRAINT `chk-duration_minutes_greater_than_0` CHECK (duration_minutes>0),
    CONSTRAINT `chk_audience_rating` CHECK (audience_rating IS NULL OR audience_rating BETWEEN 0.0 AND 10.0),
    CONSTRAINT `chk_production_budget` CHECK (production_budget>=0),
    CONSTRAINT `chk_age_certificate` CHECK (age_certificate IN ('ALL_AGES','PARENTAL_GUIDANCE','ADULT','UNRATED')),
    CONSTRAINT `chk_catlog_status` CHECK (catalog_status IN ('UPCOMING','RELEASED','ARCHIVED'))
    );
    
    
    -- CASE -10 Support tickets table --
    
    
CREATE TABLE support_tickets(
	ticket_id INT NOT NULL AUTO_INCREMENT,
    ticket_number VARCHAR(20) NOT NULL,
    requester_name VARCHAR(120) NOT NULL,
    requester_email VARCHAR(120) NOT NULL,
    subject VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(20) NOT NULL,
    priority VARCHAR(20) NOT NULL DEFAULT 'MEDIUM',
    ticket_status VARCHAR(20) NOT NULL DEFAULT 'OPEN',
    assigned_agent VARCHAR(120),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    resolved_at TIMESTAMP NULL,
    last_updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_ticket_id PRIMARY KEY (ticket_id),
    CONSTRAINT uk_ticket_number UNIQUE (ticket_number),
    CONSTRAINT chk_category CHECK (category IN ('BILLING','TECHNICAL','ACCOUNT','GENERAL')),
    CONSTRAINT chk_priority CHECK (priority IN ('LOW','MEDIUM','HIGH','CRITICAL')),
    CONSTRAINT chk_ticket_status CHECK (ticket_status IN ('OPEN','IN_PROGRESS','RESOLVED','CLOSED')),
    CONSTRAINT chk_resolved_at CHECK (resolved_at IS NULL OR resolved_at >= created_at)
);
    
    
    
    
    
    