SET SERVEROUTPUT ON

/* drop purchase sequence */
DROP SEQUENCE purchase_seq;

/* drop move_stock sequence */
DROP SEQUENCE move_stock_seq;

/* drop PROCEDURE move_stock */
DROP PROCEDURE move_stock;

/* drop PROCEDURE purchase_item */
DROP PROCEDURE purchase_item;

/* drop PROCEDURE display_purchases_info */
DROP PROCEDURE display_purchases_info;

/* drop purchase table */
DROP TABLE purchase CASCADE CONSTRAINTS;

/* drop stock table */
DROP TABLE stock CASCADE CONSTRAINTS;

/* drop store_information table */
DROP TABLE store_information CASCADE CONSTRAINTS;

/* drop product table */
DROP TABLE product CASCADE CONSTRAINTS;

/* drop customer table */
DROP TABLE customer CASCADE CONSTRAINTS;

/* drop bank_information table */
DROP TABLE bank_information CASCADE CONSTRAINTS;

/* create sequence table */
CREATE SEQUENCE purchase_seq
    MINVALUE 0007
    START WITH 0008
    INCREMENT BY 1
    CACHE 10;
    
/* create sequence table */
CREATE SEQUENCE move_stock_seq
    MINVALUE 0007
    START WITH 0008
    INCREMENT BY 1
    CACHE 10;


/* create customer table */
CREATE TABLE customer (
    customer_id VARCHAR2(5) NOT NULL PRIMARY KEY,
    first_name VARCHAR2(20) NOT NULL,
    last_name VARCHAR2(20) NOT NULL,
    gender CHAR(1),
    street VARCHAR2(20) NOT NULL,
    town VARCHAR2(20),
    county VARCHAR2(20),
    post_code VARCHAR2(9) NOT NULL,
    phone_number VARCHAR2(11) NOT NULL,
    dob DATE NOT NULL
);

/* create bank_information table */
CREATE TABLE bank_information (
    bank_id VARCHAR2(6) NOT NULL PRIMARY KEY,
    customer_id VARCHAR2(5) NOT NULL REFERENCES customer(customer_id),
    bank_name VARCHAR2(20) NOT NULL,
    street VARCHAR2(20) NOT NULL,
    town VARCHAR2(20),
    county VARCHAR2(20),
    post_code VARCHAR2(9) NOT NULL,
    swift_code VARCHAR2(11),
    sort_code VARCHAR2(8) NOT NULL,
    account_number VARCHAR2(10) NOT NULL
);



/* create product table */
CREATE TABLE product (
    product_id VARCHAR2(6) NOT NULL PRIMARY KEY,
    description VARCHAR2(20) NOT NULL,
    name VARCHAR2(20) NOT NULL,
    type VARCHAR2(20) NOT NULL,
    product_cost number(6,2) NOT NULL
);

/* create store_information table */
CREATE TABLE store_information (
    store_id VARCHAR2(5) NOT NULL PRIMARY KEY,
    street VARCHAR2(20) NOT NULL,
    town VARCHAR2(20),
    county VARCHAR2(20),
    post_code VARCHAR2(9) NOT NULL,
    phone_number VARCHAR2(12) NOT NULL,
    manager_firstname VARCHAR2(20) NOT NULL,
    manager_lastname VARCHAR2(20) NOT NULL
);

/* create the stock table */
CREATE TABLE stock (
    stock_id VARCHAR2(6) NOT NULL PRIMARY KEY,
    store_id VARCHAR2(5) NOT NULL REFERENCES store_information(store_id),
    product_id VARCHAR2(6) NOT NULL REFERENCES product(product_id),
    quantity number(5) NOT NULL,
    date_supplied DATE NOT NULL
);

/* create purchase table */
CREATE TABLE purchase (
    purchase_id VARCHAR2(5) NOT NULL PRIMARY KEY,
    product_id VARCHAR2(6) NOT NULL REFERENCES product(product_id),
    customer_id VARCHAR2(5) NOT NULL REFERENCES customer(customer_id),
    store_id VARCHAR2(5) NOT NULL REFERENCES store_information(store_id),
    unit number(3) NOT NULL,
    total_cost number(7,2) NOT NULL,
    payment_method CHAR(1) NOT NULL,
    purchase_DATE DATE
);


/* insert to customer table */
INSERT INTO customer
VALUES('00001', 'Oluwafemi', 'Adeleke', 'M', '12 Victoria Rd', 'London', 'Greater London', 'EC1V 2NX', '07890123456', '20-Aug-1985');
INSERT INTO customer
VALUES('00002', 'Chinedu', 'Okoro', 'M', '34 High St', 'Manchester', 'Greater Manchester', 'M1 1AA', '07700987654', '15-Mar-1990');
INSERT INTO customer
VALUES('00003', 'Chinwe', 'Eze', 'F', '56 Park Ave', 'Birmingham', 'West Midlands', 'B1 1BB', '07911234567', '10-Jul-1988');
INSERT INTO customer
VALUES('00004', 'Ayomide', 'Adekunle', 'F', '78 King St', 'Leeds', 'West Yorkshire', 'LS1 1AA', '07555876543', '25-Nov-1992');
INSERT INTO customer
VALUES('00005', 'Ifeoluwa', 'Adegbola', 'F', '90 Queens Rd', 'Glasgow', 'Glasgow City', 'G1 1AA', '07444345678', '30-May-1987');
INSERT INTO customer
VALUES('00006', 'Olamide', 'Okafor', 'M', '45 Park Lane', 'Edinburgh', 'City Of Edinburgh', 'EH1 1AA', '07333654321', '05-Feb-1995');
INSERT INTO customer
VALUES('00007', 'Ngozi', 'Anyanwu', 'F', '23 Oxford St', 'Bristol', 'Bristol', 'BS1 1AA', '07666987654', '15-Aug-1998');



/* insert data into bank_information table */
INSERT INTO bank_information
VALUES('B00001', '00001', 'Barclays Bank Uk', '10 Downing St', 'London', 'Greater London', 'SW1A 2AA', 'BBUKGB22', '11223344', '9988776655');
INSERT INTO bank_information
VALUES('B00002', '00002', 'Hsbc Uk', '20 High St', 'Manchester', 'Greater Manchester', 'M1 1AA', 'HBUKGB22', '22334455', '5544332211');
INSERT INTO bank_information
VALUES('B00003', '00003', 'Lloyds Bank Uk', '30 Park Ave', 'Birmingham', 'West Midlands', 'B1 1BB', 'LBUKGB22', '33445566', '1122334455');
INSERT INTO bank_information
VALUES('B00004', '00004', 'Natwest Uk', '40 King St', 'Leeds', 'West Yorkshire', 'LS1 1AA', 'NBUKGB22', '44556677', '2211334455');
INSERT INTO bank_information
VALUES('B00005', '00005', 'Santander Uk', '50 Queens Rd', 'Glasgow', 'Glasgow City', 'G1 1AA', 'SUBKGB22', '55667788', '5544112233');
INSERT INTO bank_information
VALUES('B00006', '00006', 'Nationwide Building', '60 Park Lane', 'Edinburgh', 'City Of Edinburgh', 'EH1 1AA', 'NBBSGB22', '66778899', '1122334455');
INSERT INTO bank_information
VALUES('B00007', '00007', 'Royal Bank Scotland', '70 Oxford St', 'Bristol', 'Bristol', 'BS1 1AA', 'RBOSGB22', '77889900', '2233445566');


/* insert data into product table */
INSERT INTO product
VALUES('Eq0001', 'Garden Fork', 'Wilkinson Sword', 'Equipment', 150.00);
INSERT INTO product
VALUES('Pl0001', 'Mint Plant', 'Peppermint', 'Plant', 120.40);
INSERT INTO product
VALUES('Eq0002', 'Leaf Blower', 'Worx Wg509', 'Equipment', 180.90);
INSERT INTO product
VALUES('Pl0002', 'Daisy Seeds', 'English Daisy', 'Plant', 100.60);
INSERT INTO product
VALUES('Eq0003', 'Garden Trowel', 'Fiskars Ergo', 'Equipment', 290.10);
INSERT INTO product
VALUES('Pl0003', 'Rosemary Plant', 'Tuscan Blue', 'Plant', 200.52);
INSERT INTO product
VALUES('Eq0004', 'Garden Gloves', 'Pine Tree', 'Equipment', 99.99);

/* insert data into store_information table */
INSERT INTO store_information
VALUES('St001', '10 Downing St', 'London', 'Greater London', 'SW1A 2AA', '01234567890', 'Mark', 'Johnson');
INSERT INTO store_information
VALUES('St002', '20 High St', 'Manchester', 'Greater Manchester', 'M1 1AA', '07890123456', 'Sarah', 'Williams');
INSERT INTO store_information
VALUES('St003', '30 Park Ave', 'Birmingham', 'West Midlands', 'B1 1BB', '07777555555', 'David', 'Smith');
INSERT INTO store_information
VALUES('St004', '40 King St', 'Leeds', 'West Yorkshire', 'LS1 1AA', '09876543210', 'Emma', 'Taylor');
INSERT INTO store_information
VALUES('St005', '50 Queens Rd', 'Glasgow', 'Glasgow City', 'G1 1AA', '06543210987', 'Nathan', 'Clark');
INSERT INTO store_information
VALUES('St006', '60 Park Lane', 'Edinburgh', 'City Of Edinburgh', 'EH1 1AA', '01234567890', 'Olivia', 'Brown');
INSERT INTO store_information
VALUES('St007', '70 Oxford St', 'Bristol', 'Bristol', 'BS1 1AA', '08765432109', 'William', 'Walker');

/* insert data into the stock table */
INSERT INTO stock 
VALUES ('Sk0001', 'St001', 'Eq0001', 20, '15-Mar-2024');
INSERT INTO stock 
VALUES ('Sk0002', 'St002', 'Pl0001', 5, '16-Mar-2024');
INSERT INTO stock 
VALUES ('Sk0003', 'St003', 'Eq0002', 6, '17-Mar-2024');
INSERT INTO stock 
VALUES ('Sk0004', 'St004', 'Pl0002', 50, '18-Mar-2024');
INSERT INTO stock 
VALUES ('Sk0005', 'St005', 'Eq0003', 50, '19-Mar-2024');
INSERT INTO stock 
VALUES ('Sk0006', 'St006', 'Pl0003', 60, '20-Mar-2024');
INSERT INTO stock 
VALUES ('Sk0007', 'St007', 'Eq0004', 70, '21-Mar-2024');

/* insert data into purchase table */
INSERT INTO purchase
VALUES('P0001', 'Eq0001', '00001', 'St001', 1, 160.00, 'B', '15-May-2024');
INSERT INTO purchase
VALUES('P0002', 'Pl0001', '00002', 'St002', 1, 130.20, 'A', '16-Mar-2024');
INSERT INTO purchase
VALUES('P0003', 'Eq0002', '00003', 'St003', 1, 90.30, 'B', '17-Apr-2024');
INSERT INTO purchase
VALUES('P0004', 'Pl0002', '00004', 'St004', 1, 180.21, 'C', '27-Mar-2024');
INSERT INTO purchase
VALUES('P0005', 'Eq0003', '00005', 'St005', 1, 1500, 'A', '19-May-2024');
INSERT INTO purchase
VALUES('P0006', 'Pl0003', '00006', 'St006', 1, 200.20, 'C', '29-Mar-2024');
INSERT INTO purchase
VALUES('P0007', 'Eq0004', '00007', 'St007', 2, 199.98, 'B', '28-Mar-2024');

COMMIT;



/************************************* This is a transaction procedure code **************************************/


CREATE OR REPLACE PROCEDURE purchase_item (
    input_customer_id customer.customer_id%TYPE,
    input_store_id store_information.store_id%TYPE,
    input_product_id stock.product_id%TYPE,
    input_quantity stock.quantity%TYPE,
    input_payment_method purchase.payment_method%TYPE
) AS
    store_exists INTEGER; /* Variable to store the return value from the store exists count */
    customer_exists INTEGER; /* Variable to store the return value from the the customer exists count */
    product_exists INTEGER; /* Variable to to store the return value from the product exists count */
    purchase_method CHAR(1);/* Variable to to store the return value from the purchase method count */
    store_unit_cost product.product_cost%TYPE;
    store_stock_quantity stock.quantity%TYPE; /* Variable to to store the return value from the stock quantity check */
    store_total_cost purchase.total_cost%TYPE;/* Variable to to store the total cost of the purchase */
    upper_payment_method purchase.payment_method%TYPE; /* Variable to store the uppercase payment method */
BEGIN
    upper_payment_method := UPPER(Trim(input_payment_method)); --This convert the inputed payment method to a upperCase and trim white spaces
    
/* Check if the store exists */
    SELECT COUNT(*) INTO store_exists
    FROM store_information
    WHERE store_id = input_store_id;
    
    IF store_exists = 0 THEN
/* Store does not exist */
        DBMS_OUTPUT.PUT_LINE('Store does not exist.');
        RETURN;
    END IF;

/* Check if the customer exists */
    SELECT COUNT(*) INTO customer_exists
    FROM customer
    WHERE customer_id = input_customer_id;

/* Customer does not exist */   
    IF customer_exists = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Customer does not exist.');
        RETURN;
    END IF;

/* Check if the product exists */
    SELECT COUNT(*) INTO product_exists
    FROM stock
    WHERE product_id = input_product_id;

 /* Product does not exist */  
    IF product_exists = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Product does not exist.');
        RETURN;
    END IF;

/* Check the stock quantity in the store */
    SELECT quantity INTO store_stock_quantity
    FROM stock
    WHERE store_id = input_store_id AND product_id = input_product_id;

 /* Insufficient stock */
    IF store_stock_quantity < input_quantity THEN
        DBMS_OUTPUT.PUT_LINE('Insufficient stock.');
        RETURN;    
    END IF;
    
/* Purchase method is wrong */
    IF upper_payment_method NOT IN ('A', 'B', 'C') THEN
        DBMS_OUTPUT.PUT_LINE('Purchase method is wrong. Input, A= Debit Card, B= Credit Card, C= Cheque');
        RETURN;
    END IF;

    /* Get the unit cost of the product */
    SELECT product_cost INTO store_unit_cost
    FROM product
    WHERE product_id = input_product_id;
    
    /* Calculate total cost */
    store_total_cost := store_unit_cost * input_quantity;

    /* Update the stock */
    UPDATE stock
    SET quantity = quantity - input_quantity
    WHERE store_id = input_store_id AND product_id = input_product_id;

    /* Insert into the purchase table */
    INSERT INTO purchase 
    VALUES('P' || LPAD(purchase_seq.NEXTVAL, 4, '0'), input_product_id, input_customer_id, input_store_id, input_quantity, store_total_cost, upper_payment_method, SYSDATE);

    /* Display purchase success message */
    DBMS_OUTPUT.PUT_LINE('Order successful.');

    COMMIT;
END;
/


/*************************************Testing purchase procedure*************************************/

    /* Valid purchase */
EXECUTE purchase_item('00001', 'St001', 'Eq0001', 2, 'a');

EXECUTE purchase_item('00001', 'St001', 'Eq0001', 2, 'B');

    /* Invalid (Customer does not exist.) */
EXECUTE purchase_item('005001', 'St001', 'Eq0001', 2, 'A');

    /* Invalid (Store does not exist) */
EXECUTE purchase_item('00001', 'St0041', 'Eq0001', 2, 'A');

    /* Invalid (Product does not exist) */
EXECUTE purchase_item('00001', 'St001', 'Eq0081', 2, 'A');

    /* Invalid (Insufficient stock) */
EXECUTE purchase_item('00001', 'St001', 'Eq0001', 90, 'A');

   /* Invalid Payment method */
EXECUTE purchase_item('00001', 'St001', 'Eq0001', 2, 'F');


/************************************* Display Purchase Procedure*************************************/

CREATE OR REPLACE PROCEDURE display_purchases_info (
    input_store_id store_information.store_id%TYPE,
    start_date purchase.purchase_DATE%TYPE,
    end_date purchase.purchase_DATE%TYPE
) AS
    CURSOR purchase_cursor IS
        SELECT purchase.purchase_id,
               purchase.purchase_date,
               purchase.unit,
               purchase.total_cost,
               purchase.payment_method,
               customer.first_name || ' ' || customer.last_name AS customer_name,
               product.description,
               product.name,
               product.product_cost
        FROM purchase
        JOIN customer ON purchase.customer_id = customer.customer_id
        JOIN product ON purchase.product_id = product.product_id
        WHERE purchase.store_id = input_store_id
        AND purchase.purchase_date BETWEEN start_date AND end_date;
        
    purchase_record purchase_cursor%ROWTYPE;
    store_exists INTEGER; -- Declare the variable to hold the count
BEGIN

/* Check if the store exists */
    SELECT COUNT(*) INTO store_exists
    FROM store_information
    WHERE store_id = input_store_id;
    
    IF store_exists = 0 THEN
/* Store does not exist */
        DBMS_OUTPUT.PUT_LINE('Store does not exist.');
        RETURN;
    END IF;
    
    -- Check if end_date comes before start_date
    IF end_date < start_date THEN
        DBMS_OUTPUT.PUT_LINE('End date cannot come before start date.');
        RETURN;
    END IF;

    OPEN purchase_cursor;
    LOOP
        FETCH purchase_cursor INTO purchase_record;
        EXIT WHEN purchase_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(
            'Purchase ID: ' || purchase_record.purchase_id || ', ' ||
            'Purchase Date: ' || TO_CHAR(purchase_record.purchase_date, 'DD-MON-YYYY') || ', ' ||
            'Customer Name: ' || purchase_record.customer_name || ', ' ||
            'Item Name: ' || purchase_record.name || ', ' ||
            'Item Description: ' || purchase_record.description || ', ' ||
            'Unit: ' || purchase_record.unit || ', ' ||
            'Total Cost: ' || purchase_record.total_cost || ', ' ||
            'Payment Method: ' || purchase_record.payment_method || ', ' ||
            'Product Cost: ' || purchase_record.product_cost
        );
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(purchase_cursor%ROWCOUNT || ' rows retrieved.');

    CLOSE purchase_cursor;
END;
/


/*************************************Testing Display purchase*************************************/

    /* Valid Display purchases*/
EXECUTE display_purchases_info('St001', '01-MAR-2024', '31-AUG-2024');

    /* Store Does not Exist*/
EXECUTE display_purchases_info('St01', '01-MAR-2024', '31-AUG-2024');

    /* Valid Display purchases with no trasaction on given date*/
EXECUTE display_purchases_info('St002', '01-MAY-2024', '31-MAY-2024');

    /* Invalid date*/
EXECUTE display_purchases_info('St002', '01-MAY-2024', '31-MAY-2023');



/************************************* This procedure moves stock from one store to another *************************************/

CREATE OR REPLACE PROCEDURE move_stock (
    source_product_id stock.product_id%TYPE,                /* stock to move*/
    source_store_id store_information.store_id%TYPE,    /* Request store*/
    destination_store_id store_information.store_id%TYPE, /* Destination store*/
    quantity_to_move stock.quantity%TYPE                /* Quantity of stock to move*/
) IS
    current_source_quantity stock.quantity%TYPE;        /* Current quantity of stock in the source store*/
    existing_destination_stock_id stock.stock_id%TYPE;  /* Existing stock in the destination store*/
    new_destination_stock_id stock.stock_id%TYPE;       /* destination store*/
    store_count INTEGER; /* Variable to store the count of stores*/
    product_count INTEGER; /* Variable to store the count of products in stock*/
BEGIN
    EXECUTE IMMEDIATE 'ALTER SESSION DISABLE PARALLEL DML';
    
    /* Check if the stock exists in the source store */
    SELECT COUNT(*) INTO store_count
    FROM store_information
    WHERE store_id IN (source_store_id, destination_store_id);

    IF store_count < 2 THEN
        DBMS_OUTPUT.PUT_LINE('One or both stores do not exist.');
        RETURN;
    END IF;
    
    /* Check if the product exists in stock*/
    SELECT COUNT(*) INTO product_count
    FROM stock
    WHERE product_id = source_product_id;

    IF product_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Product ' || source_product_id || ' does not exist.');
        RETURN;
    END IF;
    
   /* Check if there's enough quantity in store requested */
    SELECT quantity
    INTO current_source_quantity
    FROM stock
    WHERE product_id = source_product_id
      AND store_id = source_store_id;
    

    /* Raise an exception if there's not enough stock to move*/
    IF current_source_quantity < quantity_to_move THEN
        RAISE_APPLICATION_ERROR(-20001, 'Not enough stock in the source store');
        RETURN;
    END IF;
    
    /* Deduct the quantity from the source store*/
    UPDATE stock
    SET quantity = quantity - quantity_to_move
    WHERE product_id = source_product_id
      AND store_id = source_store_id;

    DBMS_OUTPUT.PUT_LINE('Quantity deducted from the source store.');

    BEGIN
        SELECT stock_id
        INTO existing_destination_stock_id
        FROM stock
        WHERE product_id = source_product_id
          AND store_id = destination_store_id;
        
        /*update quantity destination store*/
        UPDATE stock
        SET quantity = quantity + quantity_to_move
        WHERE stock_id = existing_destination_stock_id;
        
        DBMS_OUTPUT.PUT_LINE('Stock found in the destination store and updated.');

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            /* If no stock record is found in the destination store, insert a new record*/
            new_destination_stock_id := 'Sk' || LPAD(move_stock_seq.NEXTVAL, 4, '0');  
            
            INSERT INTO stock (stock_id, store_id, product_id, quantity, date_supplied)
            VALUES (
                new_destination_stock_id,
                destination_store_id,
                source_product_id,
                quantity_to_move,
                SYSDATE
            );

            DBMS_OUTPUT.PUT_LINE('Stock not found in the destination store. New stock record inserted.');
    END;
    
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        ROLLBACK;
END;
/


/* Valid Stock Move */
EXECUTE move_stock('Eq0004', 'St007', 'St006', 2);

/* Invalid Product Move */
EXECUTE move_stock('Eq004', 'St007', 'St006', 2);

/* Invalid Request store Move */
EXECUTE move_stock('Eq0004', 'St07', 'St006', 2);

/* Invalid Desitnation store Move */
EXECUTE move_stock('Eq0004', 'St007', 'St06', 2);

/* Invalid Desitnation Quantity Request Move */
EXECUTE move_stock('Eq0004', 'St007', 'St006', 100);

