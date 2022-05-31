NingHao He
ninghaoh@usc.edu

The ER diagram depicts a conceptual database design for a company covid 19 tracking system which is used to alerts employees as soon as possible if there is anyone got contracted

Entities & attributes:

Employee: 
For employee, I will have a unique employee ID to keep track of every employees in the company, so I will set employeeID to Primary key

There are a couple of attributes that employees have. Every employee will need to register with their cellphone number, and they will have a testing id which monitor their health condition. One employee also will have 0 or multiple meeting in different rooms. Finally, employee will have a working floor number to keep track their daily working place.

Rooms:
A composite primary key which are room number and start time. With those two information, we can easily keep track of meeting and those who are attending meeting. ONE Room might have 0 or even multiple meetings happen.

Meeting:
For meeting, we will also have unique meeting number, each meeting will be assigned to a room number. Meeting will have meeting name and their department name.

Building Floor:
One building floor will have many employee or even 0 (highly impossible). And it also keep employees testing id, in order to alert others if there is anyone got contracted on the same floor.

Temperature:
Temperature is designed to make testing system kick in. If any employee has abnormal temperature, they will be notified, and a testing ID will keep track of their temperature.

Testing System:
An unique testing id which is primary key will be given to each employee. It will record an employee health status, his test result, and his testing location.

Contact tracing:
Its composite primary key will keep track employees' testing id and their room number. It has m*m relationship with testing system and rooms, since we want to repeatedly contact all positive testing employee in order to keep everyone safe.
