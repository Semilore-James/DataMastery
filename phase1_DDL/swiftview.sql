CREATE DATABASE Swifthaul;

use Swifthaul;

select * from cities;

-- CREATED A CUSTOMERS TABLE, DID NOT ADD A STAGING AS AT THE TIME, I DID NOT KNOW IT.
CREATE TABLE customers (
    customer_id INT NOT NULL,
    full_name VARCHAR(50) NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(100) NULL,
    registered_city_id TINYINT NOT NULL,
    signup_date DATE,
    CONSTRAINT pk_customers PRIMARY KEY (customer_id),
    CONSTRAINT fk_cities FOREIGN KEY (registered_city_id) REFERENCES dbo.cities (city_id)
);
select * from customers;
DROP TABLE customers;

-- CREATED A VEHICLES TABLE, DID NOT ADD A STAGING AS AT THE TIME, I DID NOT KNOW IT.
CREATE TABLE vehicles (
    vehicle_id INT NOT NULL, 
    vehicle_type VARCHAR(50) NOT NULL,
    plate_number VARCHAR(15) NOT NULL,
    capacity INT NOT NULL,
    CONSTRAINT pk_vehicles PRIMARY KEY (vehicle_id)
);

select * from vehicles

--- CREATED A DRIVERS TABLE, DID NOT ADD A STAGING AS AT THE TIME, I DID NOT KNOW IT.
CREATE TABLE drivers (
    driver_id INT NOT NULL,
    full_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    home_city_id TINYINT NOT NULL,
    vehicle_id INT,
    hire_date DATE, 
    active_flag BIT NOT NULL DEFAULT 1, 
    CONSTRAINT pk_drivers PRIMARY KEY (driver_id), 
    CONSTRAINT fk_vehicles FOREIGN KEY (vehicle_id) REFERENCES dbo.vehicles (vehicle_id)
);
DROP TABLE drivers;
select * from drivers;

-- CREATED A DRIVERS STAGING TABLE, CHECK DRIVERS TABLE AS REF, MY FIRST STAGING TABLE
CREATE TABLE drivers_staging (
    driver_id VARCHAR(50), 
    full_name VARCHAR(50),
    phone VARCHAR(50),
    home_city_id VARCHAR(50),
    vehicle_id VARCHAR(50),
    hire_date VARCHAR(50),
    active_flag VARCHAR(50)
);
DROP TABLE drivers_staging;
SELECT * FROM drivers_staging;

 
-- INSERTED DATA FROM DRIVERS STAGING TO DRIVER TABLE, READ COMMENTS BELOW
INSERT INTO drivers (driver_id, full_name, phone, home_city_id, vehicle_id, hire_date, active_flag)
SELECT 
    CAST (driver_id AS INT), 
    full_name, 
    phone, 
    CAST (home_city_id AS TINYINT),
    CASE WHEN vehicle_id = '' 
        OR vehicle_id IS NULL 
        THEN NULL 
        ELSE CAST(vehicle_id AS INT)
        END,
    CAST (hire_date AS DATE),
    CAST (active_flag AS BIT)
    FROM drivers_staging;

-- CREATING AN ORDER TABLE, REALIZED DRIVERS_ID HAD ADDITIONAL UNKNOWN DRIVERS, SO I CREATED A STAGING TABLE FOR ORDERS, ADDED THE REQUIRED DATA TO DRIVERS TABLE, THEN INSERTED DATA FROM ORDERS STAGING TO ORDERS TABLE.
CREATE TABLE orders (
    order_id INT NOT NULL, 
    customer_id INT NOT NULL, 
    driver_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    pickup_city_id TINYINT NOT NULL, 
    delivery_city_id TINYINT NOT NULL,
    order_date DATE, 
    delivery_date DATE, 
    distance_in_km INT NOT NULL,
    declared_value_naira DECIMAL(10,2),
    payment_method VARCHAR(20),
    delivery_status VARCHAR(20), 
    CONSTRAINT pk_orders PRIMARY KEY (order_id),
    CONSTRAINT fk_drivers FOREIGN KEY (driver_id) REFERENCES dbo.drivers (driver_id),
    CONSTRAINT fk_vehicle FOREIGN KEY (vehicle_id) REFERENCES dbo.vehicles (vehicle_id),
    CONSTRAINT fk_pickup_city FOREIGN KEY (pickup_city_id) REFERENCES dbo.cities (city_id),
    CONSTRAINT fk_delivery_city FOREIGN KEY (delivery_city_id) REFERENCES dbo.cities (city_id)

);
select * from orders;
DROP TABLE orders;

-- CREATED AN ORDERS STAGING TABLE
CREATE TABLE orders_staging ( 
    order_id VARCHAR(50), 
    customer_id VARCHAR(50), 
    driver_id VARCHAR(50),
    vehicle_id VARCHAR(50),
    pickup_city_id VARCHAR(50), 
    delivery_city_id VARCHAR(50),
    order_date VARCHAR(50), 
    delivery_date VARCHAR(50), 
    distance_in_km VARCHAR(50),
    declared_value_naira VARCHAR(50),
    payment_method VARCHAR(50),
    delivery_status VARCHAR(50)
);
SELECT * FROM orders_staging;
DROP TABLE orders_staging;

--- General cleaning for order data --- 
UPDATE orders_staging
SET delivery_status = TRIM(delivery_status);

UPDATE orders_staging
SET delivery_status = 'Delivered'
WHERE LOWER(delivery_status) IN (
    'delivered', 'dlvrd', 'del.', 'delvered'
);

UPDATE orders_staging
SET delivery_status = 'Pending'
WHERE LOWER(delivery_status) IN (
    'pending'
);

UPDATE orders_staging
SET delivery_status = 'Failed'
WHERE LOWER(delivery_status) IN (
    'failed', 'faild'
);

UPDATE orders_staging
SET delivery_status = 'In Transit'
WHERE LOWER(delivery_status) IN (
    'in transit', 'in-transit'
);

UPDATE orders_staging
SET delivery_status = 'Returned'
WHERE LOWER(delivery_status) IN (
    'returned', 'retund'
);

UPDATE orders_staging
SET delivery_status = NULL
WHERE delivery_status LIKE '%[0-9]%'
   OR delivery_status LIKE '%,%';

--- end of delivery status update

---INSERT INTO orders table 
INSERT INTO orders (order_id,
                    customer_id,
                    driver_id,
                    vehicle_id,
                    pickup_city_id,
                    delivery_city_id,
                    order_date,
                    delivery_date,
                    distance_in_km,
                    declared_value_naira,
                    payment_method,
                    delivery_status )
SELECT
TRY_CAST(order_id AS INT), 
TRY_CAST(customer_id AS INT), 
TRY_CAST(driver_id AS INT),
TRY_CAST(vehicle_id AS INT),
TRY_CAST(pickup_city_id AS TINYINT), 
TRY_CAST(delivery_city_id AS TINYINT),
TRY_CAST(order_date AS DATE), 
CASE 
    WHEN delivery_date = '' OR delivery_date IS NULL 
    THEN NULL
    ELSE TRY_CAST(delivery_date AS DATE)
END,
ABS(TRY_CAST(distance_in_km AS DECIMAL(10,2))),
TRY_CAST(declared_value_naira AS DECIMAL(10,2)),
payment_method,
delivery_status 
FROM orders_staging;

SELECT * FROM orders;


---INSERTING UNKNOWN DRIVERS INTO THE DRIVERS TABLE
INSERT INTO drivers (driver_id, full_name, phone, home_city_id, vehicle_id, hire_date, active_flag)
VALUES 
(999,  'd_id_uknown', 'N/A', 1, NULL, NULL, 0),
(1000, 'd_id_uknown', 'N/A', 1, NULL, NULL, 0),
(1001, 'd_id_uknown', 'N/A', 1, NULL, NULL, 0);


/* CREATE A PAYMENT RECORDS TABLE AND A STAGING TABLE BELOW IT
*/

CREATE TABLE payment_records(
    payment_id INT NOT NULL,
    order_id INT NOT NULL,
    amount_collected_naira DECIMAL(10,2) NOT NULL,
    payment_type VARCHAR (20) NOT NULL,
    collected_by_driver_id INT NOT NULL,
    collection_timestamp DATETIME NOT NULL,
    CONSTRAINT pk_payment PRIMARY KEY (payment_id),
    CONSTRAINT fk_driver FOREIGN KEY (collected_by_driver_id) REFERENCES dbo.drivers (driver_id),
    CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES dbo.orders (order_id)
);

CREATE TABLE payment_records_staging (
    payment_id VARCHAR(50),
    order_id VARCHAR(50),
    amount_collected_naira VARCHAR(50),
    payment_type VARCHAR (20),
    collected_by_driver_id VARCHAR(50),
    collection_timestamp VARCHAR(50)
);

INSERT INTO payment_records (payment_id, 
                             order_id,
                             amount_collected_naira,
                             payment_type,
                             collected_by_driver_id,
                             collection_timestamp)
SELECT 
    TRY_CAST(payment_id AS INT),
    TRY_CAST(order_id AS INT),
    ABS(TRY_CAST(amount_collected_naira AS DECIMAL(10,2))),
    payment_type,
    TRY_CAST(collected_by_driver_id AS INT),
    TRY_CAST(collection_timestamp AS DATETIME)
    FROM payment_records_staging;

    SELECT * FROM payment_records;
    SELECT * FROM payment_records_staging;


-- CREATING A TABLE FOR WAREHOUSE SCANS 
CREATE TABLE warehouse_scans (
    scan_id INT NOT NULL,
    order_id INT NOT NULL,
    scan_type VARCHAR(50) NOT NULL,
    scan_timestamp DATETIME NOT NULL,
    staff_id INT NOT NULL,
    CONSTRAINT pk_warehouse_scans PRIMARY KEY (scan_id),
    CONSTRAINT fk_order_scan FOREIGN KEY (order_id) REFERENCES dbo.orders (order_id)
);

CREATE TABLE warehouse_scans_staging (
    scan_id VARCHAR(50),
    order_id VARCHAR(50),
    scan_type VARCHAR(50),
    scan_timestamp VARCHAR(50),
    staff_id VARCHAR(50)
);

INSERT INTO warehouse_scans (scan_id, 
                             order_id,
                             scan_type,
                             scan_timestamp,
                             staff_id)
SELECT 
    TRY_CAST(scan_id AS INT),
    TRY_CAST(order_id AS INT),
    scan_type,
    TRY_CAST(scan_timestamp AS DATETIME),
    TRY_CAST(staff_id AS INT)
    FROM warehouse_scans_staging;

SELECT * FROM warehouse_scans;
SELECT * FROM warehouse_scans_staging;
