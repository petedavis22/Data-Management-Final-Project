/* ######################## */
/* #### Data Warehouse #### */
/* ######################## */

/* DROP TABLES */
DROP TABLE order_table_dw;
DROP TABLE costco_inventory_table_dw;
DROP TABLE invoice_table_dw;
DROP TABLE vendor_table_dw;
DROP TABLE credit_card_dw;
DROP TABLE business_membership_dw;
DROP TABLE general_membership_dw;
DROP TABLE costco_user_table_dw;

/* CREATE TABLES */
/* *** CRM *** */
CREATE TABLE costco_user_table_dw AS (
    SELECT costco_user_id, first_name, last_name, date_of_birth, phone_number, email, acct_username, acct_password, mailing_address, city, state_name, country, 'General' AS DataSource
    FROM general_user_table
    UNION
    SELECT costco_user_id, first_name, last_name, date_of_birth, phone_number, email, acct_username, acct_password, mailing_address, city, state_name, country, 'Business' AS DataSource
    FROM business_user_table
);
ALTER TABLE costco_user_table_dw
ADD CONSTRAINT costco_user_id_pk_dw1 PRIMARY KEY (costco_user_id);

CREATE TABLE general_membership_dw AS (
    SELECT general_member_id, costco_user_id
    FROM general_user_table
);
ALTER TABLE general_membership_dw
ADD CONSTRAINT general_member_id_pk_dw1 PRIMARY KEY (general_member_id)
ADD CONSTRAINT costco_user_id_fk1_dw FOREIGN KEY (costco_user_id) REFERENCES costco_user_table_dw (costco_user_id);


CREATE TABLE business_membership_dw AS (
    SELECT business_member_id, costco_user_id, business_name, business_street, business_zip, business_city, business_state, business_email, business_phone
    FROM business_user_table
);
ALTER TABLE business_membership_dw
ADD CONSTRAINT business_member_id_pk_dw PRIMARY KEY (business_member_id)
ADD CONSTRAINT costco_user_id_fk_dw FOREIGN KEY (costco_user_id) REFERENCES costco_user_table_dw (costco_user_id);


CREATE TABLE credit_card_dw AS (
    SELECT credit_card_id, costco_user_id, card_number, card_type, expiration_date, security_code, billing_city, billing_state, billing_zip, 'General' AS data_source
    FROM general_user_table
    UNION
    SELECT credit_card_id, costco_user_id, card_number, card_type, expiration_date, security_code, billing_city, billing_state, billing_zip, 'Business' AS data_source
    FROM business_user_table
);
ALTER TABLE credit_card_dw
ADD CONSTRAINT credit_card_id_pk_dw PRIMARY KEY (credit_card_id)
ADD CONSTRAINT costco_user_id_fk_dw1 FOREIGN KEY (costco_user_id) REFERENCES costco_user_table_dw (costco_user_id);

/* *** SCM *** */
CREATE TABLE vendor_table_dw AS (
    SELECT vendor_id, vendor_name, street, city, state_name, country, zip, phone_number
    FROM vendor_invoice_table
);
ALTER TABLE vendor_table_dw
ADD CONSTRAINT vendor_id_pk_dw PRIMARY KEY (vendor_id);


CREATE TABLE invoice_table_dw AS (
    SELECT invoice_id, vendor_id, invoice_number, invoice_date, invoice_total, invoice_due_date, payment_date
    FROM vendor_invoice_table
);
ALTER TABLE invoice_table_dw
ADD CONSTRAINT invoice_id_pk_dw PRIMARY KEY (invoice_id)
ADD CONSTRAINT vendor_id_fk_dw1 FOREIGN KEY (vendor_id) REFERENCES vendor_table_dw (vendor_id);


CREATE TABLE costco_inventory_table_dw AS (
    SELECT inventory_id, vendor_id, item, cost_p_unit, quantity, low_threshold
    FROM costco_inventory_table
);
ALTER TABLE costco_inventory_table_dw
ADD CONSTRAINT inventory_id_pk_dw PRIMARY KEY (inventory_id)
ADD CONSTRAINT vendor_id_fk_dw2 FOREIGN KEY (vendor_id) REFERENCES vendor_table_dw (vendor_id);



CREATE TABLE order_table_dw AS (
    SELECT order_id, inventory_id, item_name, item_price, item_quantity, date_of_purch, credit_card_id, 'instore' AS data_source
    FROM instore_order
    UNION
    SELECT order_id, inventory_id, item_name, item_price, item_quantity, date_of_purch, credit_card_id, 'online' AS data_source
    FROM online_order
);
ALTER TABLE order_table_dw
ADD CONSTRAINT order_id PRIMARY KEY (order_id, data_source)
ADD CONSTRAINT cc_id_fk_dw FOREIGN KEY (credit_card_id) REFERENCES credit_card_dw (credit_card_id)
ADD CONSTRAINT inventory_id_fk_dw FOREIGN KEY (inventory_id) REFERENCES costco_inventory_table_dw (inventory_id);





/*

CREATE INDEX idx_user_gen_mem
ON general_membership_dw (costco_user_id);
CREATE INDEX idx_gen_mem_biz
ON business_membership_dw (general_member_id);
CREATE INDEX idx_user_cc
ON credit_card_dw (costco_user_id);
CREATE INDEX idx_vendor_invoice
ON invoice_table_dw (vendor_id);
CREATE INDEX idx_vendor_inventory
ON costco_inventory_table_dw (vendor_id);

*/



/*
***** ETL ******
CREATE OR REPLACE PROCEDURE user_etl_proc AS
*/

BEGIN

    -- insert vendor_table_dw
    INSERT INTO vendor_table_dw (vendor_id, vendor_name, street, city, state_name, country, zip, phone_number)
    SELECT vendor_id, vendor_name, street, city, state_name, country, zip, phone_number
    FROM vendor_invoice_table
    WHERE NOT EXISTS (Select vendor_id From vendor_table_dw WHERE vendor_table_dw.vendor_id = vendor_invoice_table.vendor_id);
    
    -- update vendor_table_dw with vendor_invoice_table
    MERGE INTO vendor_table_dw vdw
    USING vendor_invoice_table vt
    ON (vdw.vendor_id = vt.vendor_id)
    WHEN MATCHED THEN
        UPDATE SET
            vdw.vendor_name = vt.vendor_name,
            vdw.street = vt.street,
            vdw.city = vt.city,
            vdw.state_name = vt.state_name,
            vdw.country = vt.country,
            vdw.zip = vt.zip,
            vdw.phone_number = vt.phone_number;
            
    -- insert vendor_table_dw
    INSERT INTO invoice_table_dw (invoice_id, vendor_id, invoice_number, invoice_date, invoice_total, invoice_due_date, payment_date)
    SELECT invoice_id, vendor_id, invoice_number, invoice_date, invoice_total, invoice_due_date, payment_date
    FROM vendor_invoice_table
    WHERE NOT EXISTS (Select invoice_id From invoice_table_dw WHERE invoice_table_dw.invoice_id = vendor_invoice_table.invoice_id);
    
    -- update vendor_table_dw with vendor_invoice_table
    MERGE INTO invoice_table_dw idw
    USING vendor_invoice_table vt
    ON (idw.invoice_id = vt.invoice_id)
    WHEN MATCHED THEN
        UPDATE SET
            idw.vendor_id = vt.vendor_id,
            idw.invoice_number = vt.invoice_number,
            idw.invoice_date = vt.invoice_date,
            idw.invoice_total = vt.invoice_total,
            idw.invoice_due_date = vt.invoice_due_date,
            idw.payment_date = vt.payment_date;
            
    -- insert costco_inventory_table_dw
    INSERT INTO costco_inventory_table_dw (inventory_id, vendor_id, item, cost_p_unit, quantity, low_threshold)
    SELECT inventory_id, vendor_id, item, cost_p_unit, quantity, low_threshold
    FROM costco_inventory_table
    WHERE NOT EXISTS (Select inventory_id From costco_inventory_table_dw WHERE costco_inventory_table_dw.inventory_id = costco_inventory_table.inventory_id);
    
    -- update costco_inventory_table_dw with costco_inventory_table
    MERGE INTO costco_inventory_table_dw cidw
    USING costco_inventory_table cit
    ON (cidw.inventory_id = cit.inventory_id)
    WHEN MATCHED THEN
        UPDATE SET
            cidw.vendor_id = cit.vendor_id,
            cidw.item = cit.item,
            cidw.cost_p_unit = cit.cost_p_unit,
            cidw.quantity = cit.quantity,
            cidw.low_threshold = cit.low_threshold;
            
    -- insert order_table_dw
    INSERT INTO order_table_dw (order_id, inventory_id, item_name, item_price, item_quantity, date_of_purch, credit_card_id, data_source)
    SELECT order_id, inventory_id, item_name, item_price, item_quantity, date_of_purch, credit_card_id, 'instore' AS data_source
    FROM instore_order
    WHERE NOT EXISTS (Select order_id From order_table_dw WHERE order_table_dw.order_id = instore_order.order_id);
    
    -- update order_table_dw with instore_order
    MERGE INTO order_table_dw odw
    USING instore_order i
    ON (odw.order_id = i.instore_order AND odw.data_source = i.data_source)
    WHEN MATCHED THEN
        UPDATE SET
            odw.inventory_id = i.inventory_id,
            odw.item_name = i.item_name,
            odw.item_price = i.item_price,
            odw.item_quantity = i.item_quantity,
            odw.date_of_purch = i.date_of_purch,
            odw.item_quantity = i.item_quantity,
            odw.date_of_purch = i.date_of_purch,
            odw.credit_card_id = i.credit_card_id;
            
    -- insert order_table_dw
    INSERT INTO order_table_dw (order_id, inventory_id, item_name, item_price, item_quantity, date_of_purch, credit_card_id, data_source)
    SELECT order_id, inventory_id, item_name, item_price, item_quantity, date_of_purch, credit_card_id, 'instore' AS data_source
    FROM online_order
    WHERE NOT EXISTS (Select order_id From order_table_dw WHERE order_table_dw.order_id = online_order.order_id);
    
    -- update order_table_dw with online_order
    MERGE INTO order_table_dw odw
    USING online_order o
    ON (odw.order_id = o.instore_order AND odw.data_source = o.data_source)
    WHEN MATCHED THEN
        UPDATE SET
            odw.inventory_id = o.inventory_id,
            odw.item_name = o.item_name,
            odw.item_price = o.item_price,
            odw.item_quantity = o.item_quantity,
            odw.date_of_purch = o.date_of_purch,
            odw.item_quantity = o.item_quantity,
            odw.date_of_purch = o.date_of_purch,
            odw.credit_card_id = o.credit_card_id;    
            
END;








