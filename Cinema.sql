CREATE TABLE Actor (
	name		VARCHAR(30) PRIMARY KEY,
	age		INT,
	address		VARCHAR(50),
	nationality	VARCHAR(20)
);

INSERT INTO Actor (name, age, address, nationality) VALUES
	('AJ Arrow', 33, 'Los Angeles CA', 'American'),
	('Bob Brown', 47, 'Chicago IL', 'Canadian'),
	('Carly Crust', 26, 'Nashville TN', 'American'),
	('Dustin Day', 29, 'New York NY', 'Australian'),
	('Evan Eel', 50, 'Atlanta GA', 'Australian'),
	('Frank Fire', 63, 'Dallas TX', 'Australian'),
	('Gary Green', 38, 'Seattle WA', 'Canadian'),
	('Harry House', 56, 'Washington DC', 'German'),
	('India Ice', 40, 'Miami FL', 'Spanish'),
	('Josie Jet', 22, 'Phoenix AZ', 'Australian'),
	('Katie Kilt', 44, 'Philadelphia PA', 'Irish'),
	('Larry Lame', 35, 'Baltimore MD', 'American'),
	('Maria Moss', 32, 'Vail CO', 'French'),
	('Neal Nice', 70, 'Raleigh NC', 'English'),
	('Oscar Oswald', 20, 'Boston MA', 'Australian'),
	('Perry Presto', 36, 'New Orleans LA', 'Italian');

CREATE TABLE Movie (
	title		VARCHAR(20) PRIMARY KEY,
	year		INT,
	budget		INT,
	director_name	VARCHAR(30),
	studio		VARCHAR(20)
);

INSERT INTO Movie (title, year, budget, director_name, studio) VALUES
	('Air', 1980, 1100000, 'Quincy Quick', 'MGM'),
	('Baker', 1991, 200000, 'Roger Rust', 'Fox'),
	('Chase', 1999, 1300000, 'Sally Salmon', 'Warner Brothers'),
	('Delta', 2002, 1400000, 'Todd Toad', 'MGM'),
	('Eskimo', 1985, 500000, 'Uma Under', 'Fox'),
	('Fire', 1986, 1600000, 'Victor Vice', 'ABC'),
	('Guard', 1992, 1700000, 'Walter Wonder', 'MGM'),
	('Hotel', 1987, 800000, 'Xavier Xier', 'Fox'),
	('In Line', 1995, 1900000, 'Yaz Yellow', 'MGM'),
	('Joker', 1997, 1000000, 'Zack Zion', 'ABC'),
	('Killers', 1992, 19000000, 'Quincy Quick', 'Fox'),
	('Losers', 1996, 10000001, 'Uma Under', 'ABC');

CREATE TABLE Appears (
	name		VARCHAR(30),
	title		VARCHAR(20),
	salary		INT
);

INSERT INTO Appears (name, title, salary) VALUES
	('AJ Arrow', 'Air', 50000),
	('AJ Arrow', 'Guard', 60000),
	('Bob Brown', 'Eskimo', 450000),
	('Carly Crust', 'Eskimo', 500001),
	('Carly Crust', 'Hotel', 150000),
	('Dustin Day', 'Hotel', 150000),
	('Evan Eel', 'Hotel', 150000),
	('Frank Fire', 'Hotel', 150000),
	('Gary Green', 'Hotel', 150000),
	('Harry House', 'Hotel', 100000),
	('India Ice', 'Baker', 230000),
	('India Ice', 'Chase', 1300000),
	('Inida Ice', 'Fire', 1590000),
	('Josie Jet', 'Killers', 500000),
	('Katie Kilt', 'Killers', 4000000),
	('Larry Lame', 'Killers', 300000),
	('Maria Moss', 'Killers', 200000),
	('Neal Nice', 'Killers', 400000),
	('Oscar Oswald', 'Kilers', 300000),
	('Perry Presto', 'Joker', 999999);

