-- Q1
-- DB Software used online website : ideone.com
-- with SQLite

CREATE TABLE Employee( employee_id INTEGER NOT NULL,
					   name char(30),
                       office_number INTEGER NOT NULL, 
                       floor_number INTEGER NOT NULL,
                       phone_number char(20), 
                       email_address  char(30),
					   PRIMARY KEY (employee_id));
 
CREATE TABLE Meeting( meeting_id INTEGER NOT NULL, 
                      room_number INTEGER, 
                      meeting_floor INTEGER,
                      meeting_start_time timestamp, 
					  PRIMARY KEY (meeting_id)
					  );
 
CREATE TABLE EmployeeMeeting( 	meeting_id INTEGER NOT NULL,
								employee_id INTEGER NOT NULL,
    							FOREIGN KEY (employee_id) REFERENCES Employee(employee_id) ON DELETE CASCADE, 
    							FOREIGN KEY (meeting_id) REFERENCES Meeting(meeting_id) ON DELETE CASCADE,
    							UNIQUE (meeting_id, employee_id)
							);
CREATE TABLE Notification( notification_id INTEGER NOT NULL,  
                           employee_id INTEGER NOT NULL,
                           notification_date date,
                           notification_type char(30),
                           meeting_id INTEGER,
                           test_id INTEGER,
						   FOREIGN KEY (employee_id) REFERENCES Employee(employee_id) ON DELETE CASCADE,
						   FOREIGN KEY (meeting_id) REFERENCES Meeting(meeting_id) ON DELETE CASCADE,
						   FOREIGN KEY (test_id) REFERENCES Test(test_id) ON DELETE CASCADE,
						   PRIMARY KEY(notification_id));
 
CREATE TABLE Symptom( row_id INTEGER NOT NULL, 
                      employee_id INTEGER NOT NULL,
                      date_reported date, 
                      symptom_id INTEGER,
					  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id) ON DELETE CASCADE,
					  PRIMARY KEY(row_id));
 
CREATE TABLE Scan( scan_id INTEGER NOT NULL,  employee_id INTEGER NOT NULL,
                   scan_date date, temperature FLOAT,
				   PRIMARY KEY(scan_id),
				   FOREIGN KEY (employee_id) REFERENCES Employee(employee_id) ON DELETE CASCADE);
 
CREATE TABLE Test( test_id INTEGER NOT NULL,  employee_id INTEGER NOT NULL,
                   test_date date, test_location char(30),
				   test_result char(20), 
				   row_id INTEGER,
				   scan_id INTEGER,
				   notification_id INTEGER,
				   FOREIGN KEY (row_id) REFERENCES Symptom(row_id) ON DELETE CASCADE,
				   FOREIGN KEY (scan_id) REFERENCES Scan(scan_id) ON DELETE CASCADE,
				   FOREIGN KEY (notification_id) REFERENCES Notification(notification_id) ON DELETE CASCADE,
				   FOREIGN KEY (employee_id) REFERENCES Employee(employee_id) ON DELETE CASCADE,
				   PRIMARY KEY(test_id));
 
CREATE TABLE Cases( case_id INTEGER NOT NULL,  employee_id INTEGER NOT NULL,
                    case_date date, resolution char(20),
                    test_id INTEGER,
				    PRIMARY KEY(case_id),
				    FOREIGN KEY (test_id) REFERENCES Test(test_id) ON DELETE CASCADE,
				    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id) ON DELETE CASCADE);
 
CREATE TABLE HealthStatus( row_idd INTEGER NOT NULL,  employee_id INTEGER NOT NULL,
                    	   update_date date, 
                    	   status char(30),
                    	   case_id INTEGER,
						   PRIMARY KEY(row_idd),
						   FOREIGN KEY (case_id) REFERENCES Cases(case_id) ON DELETE CASCADE, 
						   FOREIGN KEY (employee_id) REFERENCES Employee(employee_id) ON DELETE CASCADE );
 
INSERT INTO Employee VALUES (100,'JOHNSON',301,3,'831-239-4487','Johnson@usc.edu');
 
INSERT INTO Employee VALUES (101,'JASON',701,7,'258-232-4487','Jason@usc.edu');
 
INSERT INTO Employee VALUES (102,'Aaron',401,4,'257-232-2317','Aaron@usc.edu');
 
INSERT INTO Employee VALUES (103,'Jordan',402,4,'257-232-1234','Jordan@usc.edu');
 
INSERT INTO Employee VALUES (104,'James',403,4,'257-232-1123','James@usc.edu');
 
INSERT INTO Employee VALUES (105,'Harden',708,7,'257-232-3432','Harden@usc.edu');
 
INSERT INTO Employee VALUES (106,'Davis',404,4,'257-232-5467','Davis@usc.edu');
 
INSERT INTO Employee VALUES (107,'Lisa',801,8,'123-232-5467','Lisa@usc.edu');
 
INSERT INTO Employee VALUES (108,'Rose',209,2,'321-232-5467','Rose@usc.edu');
 
INSERT INTO Employee VALUES (109,'Jisoo',101,1,'231-232-5467','Jisoo@usc.edu');
 
INSERT INTO Employee VALUES (110,'Jenny',702,7,'257-123-5467','Jenny@usc.edu');
 
INSERT INTO Employee VALUES (111,'Kanye',1001,10,'257-232-8398','Kanye@usc.edu');
 
INSERT INTO Employee VALUES (112,'Smoke',507,5,'812-476-6786','Smoke@usc.edu');
 
INSERT INTO Employee VALUES (113,'Gold',501,5,'257-768-5467','Gold@usc.edu');
 
INSERT INTO Meeting VALUES (001,301,3,16);
INSERT INTO Meeting VALUES (002,507,5,12);
INSERT INTO Meeting VALUES (003,203,2,9);
 
INSERT INTO EmployeeMeeting VALUES (001,100);
INSERT INTO EmployeeMeeting VALUES (001,101);
INSERT INTO EmployeeMeeting VALUES (001,102);
INSERT INTO EmployeeMeeting VALUES (001,106);
INSERT INTO EmployeeMeeting VALUES (001,110);
INSERT INTO EmployeeMeeting VALUES (001,111);
INSERT INTO EmployeeMeeting VALUES (001,112);
 
INSERT INTO EmployeeMeeting VALUES (002,101);
INSERT INTO EmployeeMeeting VALUES (002,109);
INSERT INTO EmployeeMeeting VALUES (002,102);
INSERT INTO EmployeeMeeting VALUES (002,106);
INSERT INTO EmployeeMeeting VALUES (002,107);
INSERT INTO EmployeeMeeting VALUES (002,103);
INSERT INTO EmployeeMeeting VALUES (002,113);
 
INSERT INTO EmployeeMeeting VALUES (003,101);
INSERT INTO EmployeeMeeting VALUES (003,104);
INSERT INTO EmployeeMeeting VALUES (003,105);

INSERT INTO Notification VALUES (1900,100,'2021-10-09','mandatory',001,5005);
INSERT INTO Notification VALUES (1901,101,'2021-10-09','mandatory',001,5000);
INSERT INTO Notification VALUES (1902,102,'2021-10-09','mandatory',001,5001);
INSERT INTO Notification VALUES (1903,102,'2021-10-09','mandatory',002,5001);
INSERT INTO Notification VALUES (1904,101,'2021-10-09','mandatory',002,5000);
INSERT INTO Notification VALUES (1905,103,'2021-10-09','mandatory',002,5002);
INSERT INTO Notification VALUES (1906,104,'2021-10-09','mandatory',003,5003);
INSERT INTO Notification VALUES (1907,105,'2021-10-09','mandatory',003,5004);
 
INSERT INTO Scan VALUES (2000,100,'2021-10-07',37.5);
INSERT INTO Scan VALUES (2001,101,'2021-10-07',38);
INSERT INTO Scan VALUES (2002,102,'2021-10-07',36.5);
INSERT INTO Scan VALUES (2003,103,'2021-10-07',39);
INSERT INTO Scan VALUES (2004,104,'2021-10-07',39);
INSERT INTO Scan VALUES (2005,105,'2021-10-07',39);

INSERT INTO Symptom VALUES (10011,100,'2021-10-09',4); 
INSERT INTO Symptom VALUES (10000,101,'2021-10-09',1);
INSERT INTO Symptom VALUES (10001,102,'2021-10-09',2);
INSERT INTO Symptom VALUES (10002,103,'2021-10-09',2);
INSERT INTO Symptom VALUES (10003,104,'2021-10-09',2);
INSERT INTO Symptom VALUES (10004,105,'2021-10-09',4);
INSERT INTO Symptom VALUES (10005,106,'2021-10-09',4);
INSERT INTO Symptom VALUES (10006,107,'2021-10-09',4);
INSERT INTO Symptom VALUES (10007,108,'2021-10-09',4);
INSERT INTO Symptom VALUES (10008,109,'2021-10-09',4);
INSERT INTO Symptom VALUES (10009,110,'2021-10-09',3);
INSERT INTO Symptom VALUES (10010,111,'2021-10-09',4);
 
 
INSERT INTO Test VALUES (5000,101,'2021-10-09','company','positive',10000,2001,1901);
INSERT INTO Test VALUES (5001,102,'2021-10-09','company','positive',10001,2002,1902);
INSERT INTO Test VALUES (5002,103,'2021-10-09','company','positive',10002,2003,1905);
INSERT INTO Test VALUES (5003,104,'2021-10-09','company','positive',10003,2004,1906);
INSERT INTO Test VALUES (5004,105,'2021-10-09','company','positive',10004,2005,1907);
INSERT INTO Test VALUES (5005,100,'2021-10-09','company','negative',10011,2000,1900);
 
INSERT INTO Cases VALUES (900,101,'2021-10-09','left the company',5000);
INSERT INTO Cases VALUES (901,102,'2021-10-09','left the company',5001);
INSERT INTO Cases VALUES (902,103,'2021-10-09','left the company',5002);
INSERT INTO Cases VALUES (903,104,'2021-10-09','left the company',5003);
INSERT INTO Cases VALUES (904,105,'2021-10-09','left the company',5004);
 
INSERT INTO HealthStatus VALUES (10000,101,'2021-10-10','sick',900);
INSERT INTO HealthStatus VALUES (10001,102,'2021-10-10','sick',901);
INSERT INTO HealthStatus VALUES (10002,103,'2021-10-10','sick',902);
INSERT INTO HealthStatus VALUES (10003,104,'2021-10-10','sick',903);
INSERT INTO HealthStatus VALUES (10004,105,'2021-10-10','sick',904);