REM   Script: HW1
REM   HW1

CREATE TABLE Employee( employee_id INTEGER NOT NULL,  name char(30),
                       office_number INTEGER NOT NULL,     floor_number INTEGER NOT NULL,
                       phone_number    char(20),     email_address  char(30),
					   PRIMARY KEY (employee_id));

CREATE TABLE Meeting( meeting_id INTEGER NOT NULL, employee_id INTEGER NOT NULL,
                      room_number INTEGER, floor_number INTEGER,
                      meeting_start_time timestamp, 
					  PRIMARY KEY (meeting_id,employee_id),
					  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id));

CREATE TABLE Notification( notification_id INTEGER NOT NULL,  employee_id INTEGER NOT NULL,
                                                notification_date char(30),     notification_type char(30),
						   FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
						   PRIMARY KEY(notification_id));

CREATE TABLE Symptom( row_id INTEGER NOT NULL,  employee_id INTEGER NOT NULL,
                      date_reported char(30), symptom_id INTEGER,
					  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
					  PRIMARY KEY(row_id));

CREATE TABLE Scan( scan_id INTEGER NOT NULL,  employee_id INTEGER NOT NULL,
                   scan_date char(30), temperature INTEGER,
				   PRIMARY KEY(scan_id),
				   FOREIGN KEY (employee_id) REFERENCES Employee(employee_id));

CREATE TABLE Test( test_id INTEGER NOT NULL,  employee_id INTEGER NOT NULL,
                   test_date char(30), test_location char(30),
				   test_result char(20), 
				   PRIMARY KEY(test_id),
				   FOREIGN KEY (employee_id) REFERENCES Employee(employee_id));

CREATE TABLE Cases( case_id INTEGER NOT NULL,  employee_id INTEGER NOT NULL,
                    case_date char(30), resolution char(20),
				    PRIMARY KEY(case_id),
				    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id));

CREATE TABLE HealthStatus( row_id INTEGER NOT NULL,  employee_id INTEGER NOT NULL,
                    	   update_date char(30), status char(30),
						   PRIMARY KEY(row_id),
						   FOREIGN KEY (employee_id) REFERENCES Employee(employee_id));

INSERT INTO Employee VALUES (100,'JOHNSON',301,3,'831-239-4487','Johnson@usc.edu');

INSERT INTO Employee VALUES (101,'JASON',701,7,'258-232-4487','Jason@usc.edu');

INSERT INTO Employee VALUES (102,'Aaron',401,4,'257-232-2317','Aaron@usc.edu');

INSERT INTO Employee VALUES (103,'Jordan',402,4,'257-232-1234','Jordan@usc.edu');

INSERT INTO Employee VALUES (104,'James',403,4,'257-232-1123','James@usc.edu');

INSERT INTO Employee VALUES (105,'Harden',708,7,'257-232-3432','Harden@usc.edu');

INSERT INTO Employee VALUES (106,'Davis',404,4,'257-232-5467','Davis@usc.edu');

INSERT INTO Meeting VALUES (001,100,301,3,16);

INSERT INTO Meeting VALUES (001,101,301,3,16);

INSERT INTO Meeting VALUES (001,102,301,3,16);

INSERT INTO Meeting VALUES (002,101,507,5,12);

INSERT INTO Meeting VALUES (002,102,507,5,12);

INSERT INTO Meeting VALUES (003,103,203,2,9);

INSERT INTO Meeting VALUES (003,101,203,2,9);

INSERT INTO Meeting VALUES (003,102,203,2,9);

INSERT INTO Notification VALUES (1956,102,'10.02.2021','mandatory');

INSERT INTO Notification VALUES (1957,101,'10.02.2021','optional');

INSERT INTO Notification VALUES (1958,100,'10.01.2021','optional');

INSERT INTO Scan VALUES (2000,100,'10.01.2021',37.5);

INSERT INTO Scan VALUES (2001,101,'10.01.2021',36);

INSERT INTO Scan VALUES (2002,102,'10.01.2021',36.5);

INSERT INTO Scan VALUES (2003,103,'10.01.2021',37.5);

INSERT INTO Scan VALUES (2004,104,'10.01.2021',36);

INSERT INTO Scan VALUES (2005,105,'10.01.2021',36.5);

INSERT INTO Scan VALUES (2006,106,'10.01.2021',38.5);

INSERT INTO Test VALUES (798,101,'10.01.2021','company','positive');

INSERT INTO Test VALUES (799,102,'10.01.2021','company','positive');

INSERT INTO Test VALUES (801,103,'10.01.2021','company','positive');

INSERT INTO Test VALUES (802,104,'10.01.2021','company','positive');

INSERT INTO Test VALUES (803,105,'10.01.2021','company','positive');

INSERT INTO Test VALUES (804,106,'10.01.2021','company','positive');

INSERT INTO Test VALUES (800,100,'10.01.2021','clinic','negative');

INSERT INTO Cases VALUES (900,100,'10.01.2021','left the company');

INSERT INTO Cases VALUES (901,101,'10.01.2021','left the company');

SELECT count(floor_number) as sickest ,floor_number FROM Employee INNER JOIN Test ON Employee.employee_id = Test.employee_id where Test.test_result = 'positive' GROUP BY floor_number ORDER BY sickest desc LIMIT 1;

