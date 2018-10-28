CREATE TABLE Book (
        isbn            CHAR(6),
        title		VARCHAR(30),
        genre		VARCHAR(20),
        publisher	VARCHAR(20),
        price		INT
);

INSERT INTO Book (isbn, title, genre, publisher, price) VALUES
	('111111', 'Chemistry', 'Science', 'McGraw Hill', 100),
	('222222', 'Accounting', 'Business', 'Pearson', 150),
	('333333', 'Lincoln', 'Biography', 'Amazon', 125),
	('444444', 'Ghost Fleet', 'Fiction', 'Penguin', 50),
	('555555', 'Black Jack', 'Business', 'Independent', 25),
	('666666', 'Physics', 'Science', 'Pearson', 35),
	('777777', 'Finance', 'Business', 'McGraw Hill', 76),
	('888888', 'Linux', 'Science', 'Independent', 87),
	('999999', 'Patton', 'Biography', 'Penguin', 105),
	('111222', 'Neerali', 'Biography', 'Independent', 20),
	('222333', 'Taxes', 'Business', 'Penguin', 300);

CREATE TABLE Author (
	name		VARCHAR(30),
	address		VARCHAR(30),
	age		INT,
	salary		INT
);

INSERT INTO Author (name, address, age, salary) VALUES
	('AJ Arrow', 'Los Angeles CA', 33, 50000),
	('Bob Brown', 'Chicago IL', 47, 60000),
	('Carly Crust', 'Nashville TN', 26, 70000),
	('Dustin Day', 'New York NY', 29, 33000),
	('Evan Eel', 'Atlanta GA', 50, 65000),
	('Frank Fire', 'Dallas TX', 63, 120000),
	('Gary Green', 'Seattle WA', 38, 80000),
	('Harry House', 'Washington DC', 56, 105000),
	('India Ice', 'Miami FL', 40, 88000),
	('Josie Jet', 'Phoenix AZ', 22, 52000),
	('Neal Nice', 'Raleigh NC', 70, 102000);

CREATE TABLE Writes (
	isbn		CHAR(6),
	writer		VARCHAR(30),
	year_written	INT
);

INSERT INTO Writes (isbn, writer, year_written) VALUES
	('111111', 'AJ Arrow', 1995),
	('222222', 'Bob Brown', 1996),
	('333333', 'Carly Crust', 2000),
	('444444', 'Dustin Day', 1997),
	('444444', 'Evan Eel', 1997),
	('555555', 'Evan Eel', 1998),
	('555555', 'Frank Fire', 1998),
	('666666', 'Frank Fire', 1995),
	('777777', 'Gary Green', 1997),
	('888888', 'Harry House', 1996),
	('999999', 'India Ice', 1998),
	('999999', 'Josie Jet', 1998),
	('111222', 'Neal Nice', 1997),
	('222333', 'Neal Nice', 1998);

CREATE TABLE Sales (
	isbn		CHAR(6),
	year_sold	INT,
	number_sold	INT
);

INSERT INTO Sales (isbn, year_sold, number_sold) VALUES
	('111111', 1995, 50),
	('111111', 1996, 76),
	('111111', 1997, 87),
	('111111', 1998, 675),
	('111111', 1999, 74),
	('111111', 2000, 42),
	('222222', 1996, 80),
	('222222', 1997, 96),
	('222222', 1998, 1000),
	('222222', 1999, 999),
	('222222', 2000, 1200),
	('333333', 2000, 1199),
	('444444', 1997, 4300),
	('444444', 1998, 3700),
	('444444', 1999, 1001),
	('444444', 2000, 999),
	('555555', 1998, 6500),
	('555555', 1999, 3499),
	('555555', 2000, 1),
	('666666', 1995, 75),
	('666666', 1996, 999),
	('666666', 1997, 434),
	('666666', 1998, 564),
	('666666', 1999, 538),
	('666666', 2000, 430),
	('777777', 1997, 1000),
	('777777', 1998, 500),
	('777777', 1999, 500),
	('777777', 2000, 7999),
	('888888', 1996, 999),
	('888888', 1997, 999),
	('888888', 1998, 999),
	('888888', 1999, 999),
	('888888', 2000, 999),
	('999999', 1998, 9000),
	('999999', 1999, 501),
	('999999', 2000, 500),
	('111222', 1997, 560),
	('111222', 1998, 540),
	('111222', 1999, 550),
	('111222', 2000, 600),
	('222333', 1998, 700),
	('222333', 1999, 600),
	('222333', 2000, 500);
