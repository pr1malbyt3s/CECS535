/* 1. Create database titled a0will31CECSProject. */
CREATE DATABASE a0will31CECSProject;
USE a0will31CECSProject;

/* 2. Insert tables into databse. */
CREATE TABLE HOTEL (
	hotelid			INT		AUTO_INCREMENT		PRIMARY KEY,
	number			INT,
	street			VARCHAR(30),
	city			VARCHAR(20),
	zip			INT,
	`manager-name`		VARCHAR(20),
	`number-rooms`		INT,
	`has-pool`		BOOL,
	`has-bar`		BOOL,
	`has-restaurant`	BOOL
);

CREATE TABLE ROOM (
	type			VARCHAR(10)	PRIMARY KEY,
	occupancy		INT,
	`number-beds`		INT,
	`type-beds`		VARCHAR(5),
	price			INT	
);

CREATE TABLE ROOMHOTEL (
	hotelid			INT,
	`room-type`		VARCHAR(10),
	number			INT,
	PRIMARY KEY(hotelid,`room-type`),
	FOREIGN KEY(hotelid) REFERENCES HOTEL(hotelid),
        FOREIGN KEY(`room-type`) REFERENCES ROOM(type)
);

CREATE TABLE CUSTOMER (
	`cust-id`		INT	AUTO_INCREMENT		PRIMARY KEY,
	name			VARCHAR(20),
	street			VARCHAR(30),
	city			VARCHAR(20),
	zip			INT,
	status			VARCHAR(8)	
);

CREATE TABLE RESERVATION (
	hotelid			INT,
	`cust-id`		INT,
	`room-type`		VARCHAR(10),
	`begin-date`		DATE,
	`end-date`		DATE,
	`credit-card-number`	CHAR(16),
	`exp-date`		DATE,
	PRIMARY KEY(hotelid,`cust-id`),
	FOREIGN KEY(`cust-id`) REFERENCES CUSTOMER(`cust-id`),
	FOREIGN KEY(`room-type`) REFERENCES ROOM(type),
	FOREIGN KEY(hotelid) REFERENCES HOTEL(hotelid)
);

/* 3. Create a trigger to ensure that all values in the tuple are as described. If not, the insertion will be rejected */
DELIMITER $$
CREATE TRIGGER verify_room_insertion BEFORE INSERT ON ROOM
FOR EACH ROW
	BEGIN
		IF (new.type NOT LIKE 'regular' OR new.type NOT LIKE 'extra' OR new.type NOT LIKE 'suite' OR new.type NOT LIKE 'business' OR new.type NOT LIKE 'luxury' OR new.type NOT LIKE 'family') THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Attempted INSERT does not match valid room type';
		END IF;
	END $$
DELIMITER ;

/* 4. Insert at least five tuples into each relation. */


/* 5. Create the CUSTPROFILE table. */

/* 6. Create the FAVORITE view. */
