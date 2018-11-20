/* 1. Create database titled a0will31CECSProject. */
CREATE DATABASE a0will31CECSProject;
USE a0will31CECSProject;

/* 2. Insert tables into databse. */
CREATE TABLE HOTEL (
	hotelid			INT		AUTO_INCREMENT		PRIMARY KEY,
	number			INT,
	street			VARCHAR(30),
	city			VARCHAR(20),
	zip				INT,
	`manager-name`	VARCHAR(20),
	`number-rooms`	INT,
	`has-pool`		BOOL,
	`has-bar`		BOOL,
	`has-restaurant`	BOOL
);

CREATE TABLE ROOM (
	type			VARCHAR(10)	PRIMARY KEY,
	occupancy		INT,
	`number-beds`	INT,
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
	number			INT,
	street			VARCHAR(30),
	city			VARCHAR(20),
	zip				INT,
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
	PRIMARY KEY(`cust-id`, `begin-date`),
	FOREIGN KEY(`cust-id`) REFERENCES CUSTOMER(`cust-id`),
	FOREIGN KEY(`room-type`) REFERENCES ROOM(type),
	FOREIGN KEY(hotelid) REFERENCES HOTEL(hotelid),
	FOREIGN KEY(hotelid,`room-type`) REFERENCES ROOMHOTEL(hotelid,`room-type`)
);

/* 3. Create a trigger to ensure that all values in the tuple are as described. If not, the insertion will be rejected */
DELIMITER $$
CREATE TRIGGER verify_room_insertion BEFORE INSERT ON ROOM
FOR EACH ROW
	BEGIN
		IF (new.type NOT LIKE 'regular' AND new.type NOT LIKE 'extra' AND new.type NOT LIKE 'suite' AND new.type NOT LIKE 'business' AND new.type NOT LIKE 'luxury' AND new.type NOT LIKE 'family') THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Attempted type INSERT does not match valid room type.';
		END IF;
		IF (new.occupancy < 1 OR new.occupancy > 5) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Attempted occupancy INSERT does not match valid number.';
		END IF;
		IF (new.`number-beds` < 1 OR new.`number-beds` > 3) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Attempted number-beds INSERT does not match valid number.';
		END IF;
		IF (new.`type-beds` NOT LIKE 'queen' AND new.`type-beds` NOT LIKE 'king' AND new.`type-beds` NOT LIKE 'full') THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Attempted type-beds INSERT does not match valid bed type.';
		END IF;
		IF (new.price < 0) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Attempted price INSERT is not a positive number.';
		END IF;
	END $$
DELIMITER ;

/* 4. Insert at least five tuples into each relation. */
INSERT INTO HOTEL VALUES
	(0, 7006, 'Peppermill Road', 'Augusta', 30909, 'Bob Costas', 48, TRUE, FALSE, FALSE),
	(0, 9343, 'Glenwood Avenue', 'Raleigh', 27606, 'Anne Fristoe', 62, TRUE, TRUE, TRUE),
	(0, 1800, 'Rocket Highway', 'Huntsville', 54807, 'Wes Cheplin', 53, FALSE, FALSE, FALSE),
	(0, 6401, 'Maiden Drive', 'Hickory', 63004, 'Ross Johnson', 30, FALSE, TRUE, TRUE),
	(0, 378, 'Richmond Hills Road', 'Cleveland', 18425, 'Elyse Beavers', 40, TRUE, FALSE, TRUE);	

INSERT INTO ROOM VALUES
	('regular', 1, 1, 'full', 100),
	('extra', 2, 2, 'full', 110),
	('suite', 3, 2, 'queen', 120),
	('business', 4, 2, 'king', 140),
	('luxury', 5, 3, 'king', 160),
	('family', 5, 3, 'queen', 175);

INSERT INTO ROOMHOTEL VALUES
	(1, 'regular', 28),
	(1, 'suite', 10),
	(1, 'extra', 10),
	(2, 'family', 2),
	(2, 'regular', 20),
	(2, 'extra', 20),
	(2, 'suite', 10),
	(2, 'business', 5),
	(2, 'luxury', 5),
	(3, 'extra', 23),
	(3, 'suite', 20),
	(3, 'business', 10),
	(4, 'regular', 10),
	(4, 'extra', 10),
	(4, 'suite', 10),
	(5, 'suite', 20),
	(5, 'business', 10),
	(5, 'luxury', 5),
	(5, 'family', 5);

INSERT INTO CUSTOMER VALUES
	(0, 'Drew Carey', 13, 'Hollywood Boulevard', 'Beverly Hills', 90210, 'gold'),
	(0, 'Allison Turner', 17, 'Miami Boulevard', 'Miami', 33101, 'silver'),
	(0, 'John Stugotz', 505, '5th Avenue', 'New York', 10453, 'business'),
	(0, 'Roy Bellamy', 431, 'Firefox Road', 'Nashville', 37027, 'gold'),
	(0, 'Lee Gore', 7423, 'Exuma Drive', 'Grovetown', 30905, 'silver'),
	(0, 'John Cena', 444, 'Invisible Lane', 'Detroit', 48127, 'business');

INSERT INTO RESERVATION VALUES
	(1, 1, 'regular', '2018-11-13', '2018-11-14', '1234432156788765', '2020-06-30'),
	(2, 1, 'extra', '2018-11-20', '2018-11-23', '1234432156788765', '2020-06-30'),
	(2, 2, 'suite', '2018-11-13', '2018-11-15', '1111222233334444', '2019-03-30'),
	(3, 2, 'extra', '2018-12-05', '2018-12-15', '1111222233334444', '2019-03-30'),
	(3, 3, 'business', '2019-01-01', '2019-01-02', '3434121256567878', '2021-05-31'),
	(4, 3, 'extra', '2019-01-02', '2019-01-03', '3434121256567878', '2021-05-31'),
	(4, 4, 'suite', '2018-10-31', '2018-11-03', '9876543223456789', '2018-12-31'),
	(1, 4, 'extra', '2018-10-05', '2018-10-10', '9876543223456789', '2018-12-31'),
	(5, 5, 'luxury', '2018-07-04', '2018-07-14', '1111333355557777', '2019-02-15'),
	(3, 5, 'suite', '2018-08-04', '2018-08-14', '1111333355557777', '2019-02-15'),
	(3, 5, 'suite', '2018-07-17', '2018-07-18', '1111333355557777', '2019-02-15'),
	(2, 6, 'family', '2018-09-01', '2018-09-03', '2222444466668888', '2020-09-30'),
	(5, 6, 'family', '2018-07-04', '2018-07-14', '2222444466668888', '2020-09-30');

/* 5. Create the CUSTPROFILE table and create a trigger for insertions and updates on RESERVATION. */
CREATE TABLE CUSTPROFILE SELECT `cust-id`, MAX(`begin-date`) AS `latest-stay`, SUM(DATEDIFF(`end-date`,`begin-date`) * ROOM.price) AS total
FROM RESERVATION AS R1
JOIN ROOM ON ROOM.type=R1.`room-type`
GROUP BY `cust-id`
ORDER BY `cust-id`;

DELIMITER $$
CREATE TRIGGER reservation_insert AFTER INSERT ON RESERVATION
FOR EACH ROW
	BEGIN
		UPDATE CUSTPROFILE
		SET `latest-stay` = (SELECT MAX(`begin-date`) FROM RESERVATION WHERE new.`cust-id` = `cust-id`)
		WHERE new.`cust-id` = `cust-id`;
		UPDATE CUSTPROFILE
		JOIN ROOM ON ROOM.type=new.`room-type`
		SET total = (SELECT SUM((DATEDIFF(`end-date`,`begin-date`) * ROOM.price)) FROM RESERVATION WHERE new.`cust-id` = `cust-id`)
		WHERE new.`cust-id` = `cust-id`;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER reservation_update AFTER UPDATE ON RESERVATION
FOR EACH ROW
	BEGIN
		UPDATE CUSTPROFILE
		SET `latest-stay` = (SELECT MAX(`begin-date`) FROM RESERVATION WHERE new.`cust-id` = `cust-id`)
		WHERE new.`cust-id` = `cust-id`;
		UPDATE CUSTPROFILE
		JOIN ROOM ON ROOM.type=new.`room-type`
		SET total = (SELECT SUM((DATEDIFF(`end-date`,`begin-date`) * ROOM.price)) FROM RESERVATION WHERE new.`cust-id` = `cust-id`)
		WHERE new.`cust-id` = `cust-id`;
END$$
DELIMITER ;

/* 6. Create the FAVORITE view. */
CREATE VIEW FAVORITE AS
SELECT *
FROM 
	(SELECT `cust-id`, hotelid, SUM(DATEDIFF(`end-date`,`begin-date`)) AS night_sum
	FROM RESERVATION
	GROUP BY `cust-id`, hotelid
	) AS R1;
	/*GROUP BY `cust-id`,hotelid);*/
	
	
/*SELECT R1.`cust-id`, R1.hotelid, SUM(DATEDIFF(R1.`end-date`,R1.`begin-date`))
FROM RESERVATION AS R1
JOIN RESERVATION AS R2 
WHERE R2.`cust-id`=R1.`cust-id` AND R2.hotelid=R1.hotelid
GROUP BY R1.`cust-id`,R1.hotelid;

SELECT `cust-id`, MAX(night_sum)
FROM
(
SELECT `cust-id`, hotelid, SUM(DATEDIFF(`end-date`,`begin-date`)) AS night_sum
FROM RESERVATION
GROUP BY `cust-id`, hotelid
) AS R1
GROUP BY `cust-id`;*/
