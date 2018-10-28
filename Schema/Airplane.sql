CREATE TABLE Airport (
	name		VARCHAR(30),
	city		VARCHAR(30),
	country		CHAR(3),
	number_runways	INT,
	PRIMARY KEY (name)
);

INSERT INTO Airport (name, city, country, number_runways) VALUES
	('O Hare', 'Chicago', 'USA', 17),
	('Hartsfield Jackson', 'Atlanta', 'USA', 13),
	('Raleigh Durham', 'Morrisville', 'USA', 5),
	('Midway', 'Chicago', 'USA', 7),
	('LAX', 'Los Angeles', 'USA', 9),
	('Rome', 'Rome', 'ITA', 10),
	('Bertha', 'Berlin', 'GER', 12),
	('Standiford Field', 'Louisville', 'USA', 6),
	('Ronald Reagan', 'Washington D.C.', 'USA', 9),
	('Vancouver', 'Vancouver', 'CAN', 12),
	('Incheon', 'Seoul', 'KOR', 13);


CREATE TABLE Flight (
	flightid	CHAR(4),
	depart		VARCHAR(30),
	depart_time	TIME,
	arrive		VARCHAR(30),
	arrive_time	TIME,
	pid		CHAR(3),
	price		INT,
	PRIMARY KEY (flightid),
	FOREIGN KEY (depart) REFERENCES Airport(name),
	FOREIGN KEY (arrive) REFERENCES Airport(name)
);

INSERT INTO Flight (flightid, depart, depart_time, arrive, arrive_time, pid, price) VALUES
	('1111', 'O Hare', '08:00', 'Incheon', '04:00', '111', 1500),
	('2222', 'Midway', '09:00', 'Vancouver', '12:00', '222', 500),
	('3333', 'O Hare', '10:00', 'Hartsfield Jackson', '13:00', '333', 300),
	('4444', 'Hartsfield Jackson', '15:00', 'Standiford Field', '16:30', '444', 350),
	('5555', 'Midway', '11:00', 'LAX', '13:00', '555', 560),
	('6666', 'O Hare', '12:00', 'Ronald Reagan', '14:00', '666', 340),
	('7777', 'Ronald Reagan', '16:30', 'Standiford Field', '18:00', '777', 540),
	('8888', 'Rome', '08:00', 'Raleigh Durham', '09:00', '888', 1200),
	('9999', 'Midway', '12:00', 'Bertha', '09:00', '999', 999),
	('1234', 'O Hare', '07:00', 'Vancouver', '12:00', '123', 1000);

CREATE TABLE Plane (
	planeid			CHAR(3),
	type			VARCHAR(15),
	number_passengers	INT,
	radius			INT,
	payload			INT,
	max_altitude		INT,
	max_speed		INT,
	PRIMARY KEY (planeid)
);

INSERT INTO Plane (planeid, type, number_passengers, radius, payload, max_altitude, max_speed) VALUES
	('111', 'Boeing 727', 100, 100, 100, 100, 100),
	('222', 'Airbus 320', 200, 200, 200, 200, 200),
	('333', 'Boeing 727', 300, 300, 300, 300, 300),
	('444', 'Boeing 727', 100, 100, 100, 100, 100),
	('555', 'Airbus 320', 200, 200, 200, 200, 200),
	('666', 'Boeing 727', 300, 300, 300, 300, 300),
	('777', 'Boeing 727', 100, 100, 100, 100, 100),
	('888', 'Boeing 727', 200, 200, 200, 200, 200),
	('999', 'Airbus 320', 300, 300, 300, 300, 300),
	('123', 'Boeing 727', 100, 100, 100, 100, 100);

