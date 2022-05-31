CREATE TABLE Employee( employee_id integer,  name text,
                       office_number integer,     floor_number integer,
                       phone_number    text,     email_address  text,
					   PRIMARY KEY (employee_id));
					   
CREATE TABLE Meeting( meeting_id integer, employee_id integer,
                      room_number integer, floor_number integer,
                      meeting_start_time integer, 
					  PRIMARY KEY (meeting_id,employee_id),
					  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id));
					  
CREATE TABLE Notification( notification_id          integer,  employee_id    integer,
                           notification_date text,     notification_type integer,
						   FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
						   PRIMARY KEY(notification_id));
						   
CREATE TABLE Symptom( row_id integer,  employee_id integer,
                      date_reported text, symptom_id integer,
					  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
					  PRIMARY KEY(row_id));
					  
CREATE TABLE Scan( scan_id integer,  employee_id integer,
                   scan_date text, temperature integer,
				   PRIMARY KEY(scan_id),
				   FOREIGN KEY (employee_id) REFERENCES Employee(employee_id));	
				   
CREATE TABLE Test( test_id integer,  employee_id integer,
                   test_date text, test_location text,
				   test_result text, 
				   PRIMARY KEY(test_id),
				   FOREIGN KEY (employee_id) REFERENCES Employee(employee_id));	
				   
CREATE TABLE Cases( case_id integer,  employee_id integer,
                    case_date text, resolution text,
				    PRIMARY KEY(case_id),
				    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id));		
					
CREATE TABLE HealthStatus( row_id integer,  employee_id integer,
                    	   update_date text, status text,
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