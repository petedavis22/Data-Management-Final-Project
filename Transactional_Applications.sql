/* ######################## */
/* ########  CRM  ######### */
/* ######################## */

DROP SEQUENCE general_member_id_seq;
DROP SEQUENCE business_member_id_seq;
DROP SEQUENCE credit_card_id_seq;
DROP SEQUENCE costco_user_id_seq;
DROP TABLE business_user_table;
DROP TABLE general_user_table;
CREATE SEQUENCE costco_user_id_seq
START WITH 1000001 INCREMENT BY 1
MINVALUE 1000000 MAXVALUE 9999999;
CREATE SEQUENCE general_member_id_seq
START WITH 1000000 INCREMENT BY 1
MINVALUE 1000000 MAXVALUE 9999999;
CREATE SEQUENCE business_member_id_seq
START WITH 1000000 INCREMENT BY 1
MINVALUE 1000000 MAXVALUE 9999999;
CREATE SEQUENCE credit_card_id_seq
START WITH 1000000 INCREMENT BY 1
MINVALUE 1000000 MAXVALUE 9999999;


CREATE TABLE general_user_table (
    costco_user_id              NUMBER          DEFAULT costco_user_id_seq.NEXTVAL  PRIMARY KEY,
    general_member_id           NUMBER          DEFAULT general_member_id_seq.NEXTVAL,
    first_name                  VARCHAR(30)     NOT NULL,
    last_name                   VARCHAR(30)     NOT NULL,
    date_of_birth               DATE            NOT NULL,
    phone_number                CHAR(12)        NOT NULL,
    email                       VARCHAR(50)     NOT NULL    UNIQUE,
    acct_username               VARCHAR(30)     NOT NULL,
    acct_password               VARCHAR(30)     NOT NULL,
    mailing_address             VARCHAR(100)    NOT NULL,
    city                        VARCHAR(30)     NOT NULL,
    state_name                  CHAR(2)         NOT NULL,
    country                     VARCHAR(30)     NOT NULL,
    zip                         CHAR(5)         NOT NULL,
    credit_card_id              NUMBER          DEFAULT credit_card_id_seq.NEXTVAL,
    card_number                 NUMBER          NOT NULL,
    card_type                   VARCHAR(50)     NOT NULL,
    expiration_date             DATE            NOT NULL,
    security_code               NUMBER          NOT NULL,
    billing_city                VARCHAR(50)     NOT NULL,
    billing_state               CHAR(2)         NOT NULL,
    billing_zip                 CHAR(5)         NOT NULL
);
CREATE TABLE business_user_table (
    costco_user_id              NUMBER          DEFAULT costco_user_id_seq.NEXTVAL  PRIMARY KEY,
    business_member_id          NUMBER          DEFAULT business_member_id_seq.NEXTVAL,
    first_name                  VARCHAR(30)     NOT NULL,
    last_name                   VARCHAR(30)     NOT NULL,
    date_of_birth               DATE            NOT NULL,
    phone_number                CHAR(12)        NOT NULL,
    email                       VARCHAR(50)     NOT NULL    UNIQUE,
    acct_username               VARCHAR(30)     NOT NULL,
    acct_password               VARCHAR(30)     NOT NULL,
    mailing_address             VARCHAR(100)    NOT NULL,
    city                        VARCHAR(30)     NOT NULL,
    state_name                  CHAR(2)         NOT NULL,
    country                     VARCHAR(30)     NOT NULL,
    zip                         CHAR(5)         NOT NULL,
    credit_card_id              NUMBER          DEFAULT credit_card_id_seq.NEXTVAL,
    card_number                 NUMBER          NOT NULL,
    card_type                   VARCHAR(50)     NOT NULL,
    expiration_date             DATE            NOT NULL,
    security_code               NUMBER          NOT NULL,
    billing_city                VARCHAR(50)     NOT NULL,
    billing_state               CHAR(2)         NOT NULL,
    billing_zip                 CHAR(5)         NOT NULL,
    business_name               VARCHAR(50)     NOT NULL,
    business_street             VARCHAR(100)    NOT NULL,
    business_zip                CHAR(5)         NOT NULL,
    business_city               VARCHAR(30)     NOT NULL,
    business_state              CHAR(2)         NOT NULL,
    business_email              VARCHAR(50)     NOT NULL    UNIQUE,
    business_phone              CHAR(12)        NOT NULL
);
--Insert users into general_user_table:
INSERT INTO general_user_table(first_name, last_name, date_of_birth, phone_number, email, acct_username, acct_password, mailing_address, city, state_name, country, zip, card_number, card_type, expiration_date, security_code, billing_city, billing_state, billing_zip)
VALUES ('Joe', 'Niehaus', TO_DATE('01/01/1990', 'DD/MM/YYYY'), '5342345345', 'joe@email.com', 'joe', 'lawnmower', '321 hickory', 'austin', 'TX', 'USA', '78741', 1870779127164844, 'AMEX', TO_DATE('01/01/2024','DD/MM/YYYY'), 234, 'Austin', 'TX', 78741);
INSERT INTO general_user_table(first_name, last_name, date_of_birth, phone_number, email, acct_username, acct_password, mailing_address, city, state_name, country, zip, card_number, card_type, expiration_date, security_code, billing_city, billing_state, billing_zip)
VALUES ('John', 'Newman', TO_DATE('02/02/1991', 'DD/MM/YYYY'), '3546345663', 'john@email.com', 'john', 'nothing', '234 west', 'austin', 'TX', 'USA', '78741', 1299651297163822, 'MASTERCARD', TO_DATE('02/02/2024','DD/MM/YYYY'), 235, 'Austin', 'TX', 78741);
INSERT INTO general_user_table(first_name, last_name, date_of_birth, phone_number, email, acct_username, acct_password, mailing_address, city, state_name, country, zip, card_number, card_type, expiration_date, security_code, billing_city, billing_state, billing_zip)
VALUES ('Jack', 'Sparrow', TO_DATE('03/03/1992', 'DD/MM/YYYY'), '2345234524', 'jack@email.com', 'jack', 'rum', '345 east', 'austin', 'TX', 'USA', '78741', 2099033307384861, 'VISA', TO_DATE('03/03/2024','DD/MM/YYYY'), 543, 'Austin', 'TX', 78741);
INSERT INTO general_user_table(first_name, last_name, date_of_birth, phone_number, email, acct_username, acct_password, mailing_address, city, state_name, country, zip, card_number, card_type, expiration_date, security_code, billing_city, billing_state, billing_zip)
VALUES ('Christian', 'Lee', TO_DATE('04/04/1993', 'DD/MM/YYYY'), '5787654456', 'christian@email.com', 'christian', 'beer', '124 north', 'austin', 'TX', 'USA', '78741', 1229817149036205, 'AMEX', TO_DATE('04/04/2024','DD/MM/YYYY'), 243, 'Austin', 'TX', 78741);
INSERT INTO general_user_table(first_name, last_name, date_of_birth, phone_number, email, acct_username, acct_password, mailing_address, city, state_name, country, zip, card_number, card_type, expiration_date, security_code, billing_city, billing_state, billing_zip)
VALUES ('Christ', 'Almighty', TO_DATE('05/05/1994', 'DD/MM/YYYY'), '3868386635', 'christ@email.com', 'jesus', 'wine', '763 dean keeton', 'austin', 'TX', 'USA', '78741', 1421862339481545, 'AMEX', TO_DATE('05/05/2024','DD/MM/YYYY'), 687, 'Austin', 'TX', 78741);
INSERT INTO general_user_table(first_name, last_name, date_of_birth, phone_number, email, acct_username, acct_password, mailing_address, city, state_name, country, zip, card_number, card_type, expiration_date, security_code, billing_city, billing_state, billing_zip)
VALUES ('Matthew', 'Streichler', TO_DATE('06/06/1995', 'DD/MM/YYYY'), '8067844567', 'strike@email.com', 'strike', 'soccer', '654 mlk', 'austin', 'TX', 'USA', '78741', 1421916444582234, 'VISA', TO_DATE('06/06/2024','DD/MM/YYYY'), 897, 'Austin', 'TX', 78741);
INSERT INTO general_user_table(first_name, last_name, date_of_birth, phone_number, email, acct_username, acct_password, mailing_address, city, state_name, country, zip, card_number, card_type, expiration_date, security_code, billing_city, billing_state, billing_zip)
VALUES ('Mona', 'Lisa', TO_DATE('07/07/1996', 'DD/MM/YYYY'), '2456325467', 'mona@email.com', 'mona', 'painting', '657 manor', 'austin', 'TX', 'USA', '78741', 1678343277176177, 'MASTERCARD', TO_DATE('07/07/2024','DD/MM/YYYY'), 465, 'Austin', 'TX', 78741);
INSERT INTO general_user_table(first_name, last_name, date_of_birth, phone_number, email, acct_username, acct_password, mailing_address, city, state_name, country, zip, card_number, card_type, expiration_date, security_code, billing_city, billing_state, billing_zip)
VALUES ('Mike', 'Jackson', TO_DATE('08/08/1997', 'DD/MM/YYYY'), '6383586356', 'mike@email.com', 'mike', 'singing', '685 first', 'austin', 'TX', 'USA', '78741', 1948035792112575, 'AMEX', TO_DATE('08/08/2024','DD/MM/YYYY'), 345, 'Austin', 'TX', 78741);
INSERT INTO general_user_table(first_name, last_name, date_of_birth, phone_number, email, acct_username, acct_password, mailing_address, city, state_name, country, zip, card_number, card_type, expiration_date, security_code, billing_city, billing_state, billing_zip)
VALUES ('Pete', 'Davis', TO_DATE('09/09/1998', 'DD/MM/YYYY'), '1235617436', 'pete@email.com', 'pete', 'golf', '976 lamar', 'austin', 'TX', 'USA', '78741', 1499728192356417, 'VISA', TO_DATE('09/09/2024','DD/MM/YYYY'), 867, 'Austin', 'TX', 78741);
INSERT INTO general_user_table(first_name, last_name, date_of_birth, phone_number, email, acct_username, acct_password, mailing_address, city, state_name, country, zip, card_number, card_type, expiration_date, security_code, billing_city, billing_state, billing_zip)
VALUES ('Pistol', 'Maravich', TO_DATE('10/10/1999', 'DD/MM/YYYY'), '3573568652', 'pistol@email.com', 'pistol', 'bball', '455 congress', 'austin', 'TX', 'USA', '78741', 1175929133238428, 'VISA', TO_DATE('01/11/2024','DD/MM/YYYY'), 456, 'Austin', 'TX', 78741);
--Insert businesses into business_user_table:
INSERT INTO business_user_table(first_name, last_name, date_of_birth, phone_number, email, acct_username, acct_password, mailing_address, city, state_name, country, zip, card_number, card_type, expiration_date, security_code, billing_city, billing_state, billing_zip, business_name, business_street, business_zip, business_city, business_state, business_email, business_phone)
VALUES ('Joe', 'Niehaus', TO_DATE('01/01/1990', 'DD/MM/YYYY'), '5342345345', 'joe@email.com', 'joe', 'lawnmower', '321 hickory', 'austin', 'TX', 'USA', '78741', 1870779127164844, 'AMEX', TO_DATE('01/01/2024','DD/MM/YYYY'), 234, 'Austin', 'TX', 78741, 'Jacks Rum Co', '5432 Jones', 78741, 'Austin', 'TX','jrumco@biz.com', 7980987654);
INSERT INTO business_user_table(first_name, last_name, date_of_birth, phone_number, email, acct_username, acct_password, mailing_address, city, state_name, country, zip, card_number, card_type, expiration_date, security_code, billing_city, billing_state, billing_zip, business_name, business_street, business_zip, business_city, business_state, business_email, business_phone)
VALUES ('Christian', 'Lee', TO_DATE('04/04/1993', 'DD/MM/YYYY'), '5787654456', 'christian@email.com', 'christian', 'beer', '124 north', 'austin', 'TX', 'USA', '78741', 1229817149036205, 'AMEX', TO_DATE('04/04/2024','DD/MM/YYYY'), 243, 'Austin', 'TX', 78741, 'Water2Wine', '5123 Jesus', 78741, 'Austin', 'TX','water2wine@biz.com', 1243553547);
INSERT INTO business_user_table(first_name, last_name, date_of_birth, phone_number, email, acct_username, acct_password, mailing_address, city, state_name, country, zip, card_number, card_type, expiration_date, security_code, billing_city, billing_state, billing_zip, business_name, business_street, business_zip, business_city, business_state, business_email, business_phone)
VALUES ('Matthew', 'Streichler', TO_DATE('06/06/1995', 'DD/MM/YYYY'), '8067844567', 'strike@email.com', 'strike', 'soccer', '654 mlk', 'austin', 'TX', 'USA', '78741', 1421916444582234, 'VISA', TO_DATE('06/06/2024','DD/MM/YYYY'), 897, 'Austin', 'TX', 78741, 'Mikes Records', '112 Congress', 78741, 'Austin', 'TX','recordshop@biz.com', 1235235543);
INSERT INTO business_user_table(first_name, last_name, date_of_birth, phone_number, email, acct_username, acct_password, mailing_address, city, state_name, country, zip, card_number, card_type, expiration_date, security_code, billing_city, billing_state, billing_zip, business_name, business_street, business_zip, business_city, business_state, business_email, business_phone)
VALUES ('Pete', 'Davis', TO_DATE('09/09/1998', 'DD/MM/YYYY'), '1235617436', 'pete@email.com', 'pete', 'golf', '976 lamar', 'austin', 'TX', 'USA', '78741', 1499728192356417, 'VISA', TO_DATE('09/09/2024','DD/MM/YYYY'), 867, 'Austin', 'TX', 78741, 'Austin Golf Club', '423 Lakeway', 78741, 'Austin', 'TX','agc@biz.com', 8567883456);
INSERT INTO business_user_table(first_name, last_name, date_of_birth, phone_number, email, acct_username, acct_password, mailing_address, city, state_name, country, zip, card_number, card_type, expiration_date, security_code, billing_city, billing_state, billing_zip, business_name, business_street, business_zip, business_city, business_state, business_email, business_phone)
VALUES ('Mike', 'Jackson', TO_DATE('08/08/1997', 'DD/MM/YYYY'), '6383586356', 'mike@email.com', 'mike', 'singing', '685 first', 'austin', 'TX', 'USA', '78741', 1948035792112575, 'AMEX', TO_DATE('08/08/2024','DD/MM/YYYY'), 345, 'Austin', 'TX', 78741, 'Pistols Gym', '3245 Riverside', 78741, 'Austin', 'TX','gymrats@biz.com', 1234552645);



/* ######################## */
/* ######## Sales ######### */
/* ######################## */
DROP SEQUENCE instore_id_seq;
DROP SEQUENCE online_id_seq;
/* DROP TABLES */
DROP TABLE instore_order;
DROP TABLE online_order;
/* CREATE SEQUENCES */
CREATE SEQUENCE instore_id_seq
START WITH 1000000 INCREMENT BY 2
MINVALUE 1000000 MAXVALUE 9999999;
CREATE SEQUENCE online_id_seq
START WITH 1000001 INCREMENT BY 2
MINVALUE 1000000 MAXVALUE 9999999;
/* CREATE TABLES */
CREATE TABLE instore_order (
    order_id                    NUMBER          DEFAULT instore_id_seq.NEXTVAL    PRIMARY KEY,
    inventory_id                NUMBER          NOT NULL,
    item_name                   VARCHAR(100)    NOT NULL,
    item_price                  NUMBER          NOT NULL,
    item_quantity               NUMBER          NOT NULL,
    date_of_purch               DATE            DEFAULT SYSDATE,
    credit_card_id              NUMBER(7)       NOT NULL
);
CREATE TABLE online_order (
    order_id                    NUMBER          DEFAULT online_id_seq.NEXTVAL    PRIMARY KEY,
    inventory_id                NUMBER          NOT NULL,
    item_name                   VARCHAR(100)    NOT NULL,
    item_price                  NUMBER          NOT NULL,
    item_quantity               NUMBER          NOT NULL,
    date_of_purch               DATE            DEFAULT SYSDATE,
    credit_card_id              NUMBER(7)       NOT NULL
);
/* Seed data */
--INSERT orders into instore_order;
--INSERT orders into instore_order;
INSERT INTO instore_order(inventory_id, item_name, item_price, item_quantity, date_of_purch, credit_card_id)
VALUES (1000004,'Hotdogs (pack of 8)',4.99,3,TO_DATE('08/08/2020', 'DD/MM/YYYY'),1000002);
INSERT INTO instore_order(inventory_id, item_name, item_price, item_quantity, date_of_purch, credit_card_id)
VALUES (1000002,'Hotdog Buns (pack of 6)',2.95,4,TO_DATE('14/08/2020', 'DD/MM/YYYY'),1000001);
INSERT INTO instore_order(inventory_id, item_name, item_price, item_quantity, date_of_purch, credit_card_id)
VALUES (1000003,'Free Range Whole Organic Turkey (17lb)',119.99,1,TO_DATE('16/08/2020', 'DD/MM/YYYY'),1000009);
INSERT INTO instore_order(inventory_id, item_name, item_price, item_quantity, date_of_purch, credit_card_id)
VALUES (1000004,'Hotdogs (pack of 8)',4.99,15,TO_DATE('27/08/2020', 'DD/MM/YYYY'),1000006);
INSERT INTO instore_order(inventory_id, item_name, item_price, item_quantity, date_of_purch, credit_card_id)
VALUES (1000000,'Whole Bean Coffee (5 lb)',41.99,1,TO_DATE('04/09/2020', 'DD/MM/YYYY'),1000005);
--INSERT orders into online_order;
INSERT INTO online_order(inventory_id, item_name, item_price, item_quantity, date_of_purch, credit_card_id)
VALUES (1000001,'6-Person Hot Tub',2999.99,1,TO_DATE('06/08/2020', 'DD/MM/YYYY'),1000007);
INSERT INTO online_order(inventory_id, item_name, item_price, item_quantity, date_of_purch, credit_card_id)
VALUES (1000000,'Dual Stage Snow Blower',1199.99,4,TO_DATE('10/08/2020', 'DD/MM/YYYY'),1000007);
INSERT INTO online_order(inventory_id, item_name, item_price, item_quantity, date_of_purch, credit_card_id)
VALUES (1000002,'26" Beach Cruiser Bicycle',249.99,2,TO_DATE('14/08/2020', 'DD/MM/YYYY'),1000006);
INSERT INTO online_order(inventory_id, item_name, item_price, item_quantity, date_of_purch, credit_card_id)
VALUES (1000003,'Split King Memory Foam Mattress w/ Base',3499.99,1,TO_DATE('28/08/2020', 'DD/MM/YYYY'),1000007);
INSERT INTO online_order(inventory_id, item_name, item_price, item_quantity, date_of_purch, credit_card_id)
VALUES (1000000,'Bulgarian Sturgeon Caviar (2 oz)',69.95,3,TO_DATE('01/09/2020', 'DD/MM/YYYY'),1000004);



/* ######################## */
/* ########  SCM  ######### */
/* ######################## */
DROP SEQUENCE vendor_id_seq;
DROP SEQUENCE invoice_id_seq;
DROP SEQUENCE inventory_id_seq;
DROP SEQUENCE costco_scm_id_seq;
/* DROP TABLES */
DROP TABLE vendor_invoice_table;
DROP TABLE costco_inventory_table;
/* CREATE SEQUENCES */
CREATE SEQUENCE vendor_id_seq
START WITH 1000000 INCREMENT BY 1
MINVALUE 1000000 MAXVALUE 9999999;
CREATE SEQUENCE invoice_id_seq
START WITH 1000000 INCREMENT BY 1
MINVALUE 1000000 MAXVALUE 9999999;
CREATE SEQUENCE inventory_id_seq
START WITH 1000000 INCREMENT BY 1
MINVALUE 1000000 MAXVALUE 9999999;
CREATE SEQUENCE costco_scm_id_seq
START WITH 1000000 INCREMENT BY 1
MINVALUE 1000000 MAXVALUE 9999999;
/* CREATE TABLES */
CREATE TABLE vendor_invoice_table (
    costco_scm_id               NUMBER          DEFAULT costco_scm_id_seq.NEXTVAL   PRIMARY KEY,
    vendor_id                   NUMBER          DEFAULT vendor_id_seq.NEXTVAL,
    vendor_name                 VARCHAR(30)     NOT NULL,
    street                      VARCHAR(100)    NOT NULL,
    city                        VARCHAR(30)     NOT NULL,
    state_name                  CHAR(2)         NOT NULL,
    country                     VARCHAR(30)     NOT NULL,
    zip                         CHAR(5)         NOT NULL,
    phone_number                CHAR(12)        NOT NULL,
    invoice_id                  NUMBER          DEFAULT invoice_id_seq.NEXTVAL,
    invoice_number              NUMBER          NOT NULL,
    invoice_date                DATE            NOT NULL,
    invoice_total               NUMBER          NOT NULL,
    invoice_due_date            DATE            NOT NULL,
    payment_date                DATE            NOT NULL
);
CREATE TABLE costco_inventory_table (
    costco_scm_id               NUMBER          DEFAULT costco_scm_id_seq.NEXTVAL   PRIMARY KEY,
    inventory_id                NUMBER          DEFAULT inventory_id_seq.NEXTVAL,
    vendor_id                   NUMBER          DEFAULT vendor_id_seq.NEXTVAL,
    item                        VARCHAR(50)     NOT NULL,
    cost_p_unit                 NUMBER          NOT NULL,
    quantity                    NUMBER          NOT NULL,
    low_threshold               NUMBER          NOT NULL
);

--Insert vendors into vendor_table;
INSERT INTO vendor_invoice_table(vendor_name, street, city, state_name, country, zip, phone_number, invoice_number, invoice_total, invoice_date, invoice_due_date, payment_date)
VALUES ('jasons seafood', '45th', 'Austin', 'TX', 'USA', 78741, 1486403433, 4210, 20580, sysdate-30, sysdate+30, sysdate+30);
INSERT INTO vendor_invoice_table(vendor_name, street, city, state_name, country, zip, phone_number, invoice_number, invoice_total, invoice_date, invoice_due_date, payment_date)
VALUES ('jordans bikeshop', '51st', 'Austin', 'TX', 'USA', 78741, 5798196626, 817891, 13198.5, sysdate-20, sysdate+30, sysdate);
INSERT INTO vendor_invoice_table(vendor_name, street, city, state_name, country, zip, phone_number, invoice_number, invoice_total, invoice_date, invoice_due_date, payment_date)
VALUES ('joshs surfshop', '32nd', 'Austin', 'TX', 'USA', 78741, 1178391986, 377, 2527.8, sysdate-17, sysdate+30, sysdate+30);
INSERT INTO vendor_invoice_table(vendor_name, street, city, state_name, country, zip, phone_number, invoice_number, invoice_total, invoice_date, invoice_due_date, payment_date)
VALUES ('joes gunshop', 'lamar', 'Austin', 'TX', 'USA', 78741, 3815606998, 982, 36015, sysdate-6, sysdate+30, sysdate+30);
INSERT INTO vendor_invoice_table(vendor_name, street, city, state_name, country, zip, phone_number, invoice_number, invoice_total, invoice_date, invoice_due_date, payment_date)
VALUES ('matts games', 'congress', 'Austin', 'TX', 'USA', 78741, 6886036772, 100772, 1035.15, sysdate-12, sysdate+30, sysdate);
INSERT INTO vendor_invoice_table(vendor_name, street, city, state_name, country, zip, phone_number, invoice_number, invoice_total, invoice_date, invoice_due_date, payment_date)
VALUES ('peters bagels', 'ben white', 'Austin', 'TX', 'USA', 78741, 2983413591, 88709, 3210, sysdate-22, sysdate+30, sysdate+30);
INSERT INTO vendor_invoice_table(vendor_name, street, city, state_name, country, zip, phone_number, invoice_number, invoice_total, invoice_date, invoice_due_date, payment_date)
VALUES ('Tejs Books', '38th', 'Austin', 'TX', 'USA', 78741, 6770909118, 56, 20401.98, sysdate-40, sysdate+30, sysdate);
INSERT INTO vendor_invoice_table(vendor_name, street, city, state_name, country, zip, phone_number, invoice_number, invoice_total, invoice_date, invoice_due_date, payment_date)
VALUES ('Bens Beauty Supplies', 'tom green', 'Austin', 'TX', 'USA', 78741, 8850856384, 10044, 312, sysdate-2, sysdate+30, sysdate+30);
INSERT INTO vendor_invoice_table(vendor_name, street, city, state_name, country, zip, phone_number, invoice_number, invoice_total, invoice_date, invoice_due_date, payment_date)
VALUES ('Dians Home Supplies', '50th', 'Austin', 'TX', 'USA', 78741, 8854465352, 118753, 6300.03, sysdate-3, sysdate+30, sysdate);
INSERT INTO vendor_invoice_table(vendor_name, street, city, state_name, country, zip, phone_number, invoice_number, invoice_total, invoice_date, invoice_due_date, payment_date)
VALUES ('Davids Paper Products', 'frontage', 'Austin', 'TX', 'USA', 78741, 2746135000, 4605, 11009.90, sysdate-7, sysdate+30, sysdate+30);
--Insert inventory into costco_inventory_table;
INSERT INTO costco_inventory_table(vendor_id, item, cost_p_unit, quantity, low_threshold)
VALUES (1000000, 'Bulgarian Sturgeon Caviar', 51.45, 400, 15);
INSERT INTO costco_inventory_table(vendor_id, item, cost_p_unit, quantity, low_threshold)
VALUES (1000001, 'Beach Cruiser Bicycle', 175.98, 75, 10);
INSERT INTO costco_inventory_table(vendor_id, item, cost_p_unit, quantity, low_threshold)
VALUES (1000002, '9ft Foam Long Board', 210.65, 12, 2);
INSERT INTO costco_inventory_table(vendor_id, item, cost_p_unit, quantity, low_threshold)
VALUES (1000003, 'Case Target Ammo', 120.05, 300, 100);
INSERT INTO costco_inventory_table(vendor_id, item, cost_p_unit, quantity, low_threshold)
VALUES (1000004, 'Hand Painted Collegiate Cornhole Set', 69.01, 15, 1);
INSERT INTO costco_inventory_table(vendor_id, item, cost_p_unit, quantity, low_threshold)
VALUES (1000005, 'Stay-Fresh Everything Bagels (half-dozen)', 3.21, 1000, 0);
INSERT INTO costco_inventory_table(vendor_id, item, cost_p_unit, quantity, low_threshold)
VALUES (1000006, 'Vintage Encyclopedia Set', 10200.99, 2, 0);
INSERT INTO costco_inventory_table(vendor_id, item, cost_p_unit, quantity, low_threshold)
VALUES (1000007, '12-pack Masks', 2.08, 450, 100);
INSERT INTO costco_inventory_table(vendor_id, item, cost_p_unit, quantity, low_threshold)
VALUES (1000008, '6-Person Hot Tub', 2100.01, 3, 0);
INSERT INTO costco_inventory_table(vendor_id, item, cost_p_unit, quantity, low_threshold)
VALUES (1000009, 'Photo Printer Paper (pallet)', 1100.99, 10, 5);






