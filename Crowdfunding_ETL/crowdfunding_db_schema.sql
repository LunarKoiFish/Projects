DO $$ 
DECLARE 
    r RECORD;
BEGIN 
    FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = 'public') 
    LOOP 
        EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(r.tablename) || ' CASCADE';
    END LOOP; 
END $$;



CREATE TABLE contacts(
    contact_id BIGINT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL
);

CREATE TABLE category(
    category_id VARCHAR(50) PRIMARY KEY,
    category VARCHAR(50) NOT NULL
);

CREATE TABLE subcategory(
    subcategory_id VARCHAR(50) PRIMARY KEY,
    subcategory VARCHAR(50) NOT NULL
);


CREATE TABLE campaign(
    cf_id BIGINT PRIMARY KEY,
    contact_id BIGINT NOT NULL,
	company_name VARCHAR(50) NOT NULL,
	description VARCHAR(100) NOT NULL,
	goal VARCHAR(50) NOT NULL,
	pledged VARCHAR(50) NOT NULL,
	outcome VARCHAR(50) NOT NULL,
	backers_count BIGINT NOT NULL,
	country VARCHAR(50) NOT NULL,
	currency VARCHAR(50) NOT NULL,
	launched_at VARCHAR(50) NOT NULL,
	end_date VARCHAR(50) NOT NULL,
	staff_pick VARCHAR(50) NOT NULL,
	spotlight VARCHAR(50) NOT NULL,
	category_id VARCHAR(50) NOT NULL,
	subcategory_id VARCHAR(50) NOT NULL,
	FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id),
    FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
); 


SELECT * FROM contacts;

SELECT * FROM category;

SELECT * FROM subcategory;

SELECT * FROM campaign;

