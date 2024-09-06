create Database VisitorManagement;
use VisitorManagement;

-- ***********************************************************************************************************************************************************

-- Table to maintain Details of visitor.
create table Visitor_details
					(
                    visitor_number int null,
                     -- Details Required From Visitor for registration
					 visitor_name varchar(20) not null,constraint chk_visitor_name check(visitor_name regexp '^[A-Za-z. ]+$'),  -- check name format
					 visitor_email varchar(30) not null unique key CHECK (visitor_email LIKE '%@%.%'),   -- check email format
					 mobile_number varchar(10) not null unique key,CONSTRAINT chk_mobile_number CHECK (mobile_number REGEXP '^[0-9]{10}$'), -- check mobile number format
					 visitor_age int check(visitor_age>18),  -- check age>18
					 visitor_gender char(12)
                    );
                    
-- Table to maintain Login Details to Fix Appointment
create table Login_details
					(
                     visitor_ID int not null,    -- unique id which auto increments for each record(visitor)
					 visitor_password varchar(10) not null  -- sample passwords are to be considered through java code
                     );
                    
-- Table to maintain Staff details
create table Staff_details
					(
                    visitor_number int,
                    staff_id int primary key,    -- id for each staff member
					staff_name varchar(20) not null,constraint chk_staff_name check(staff_name regexp '^[A-Za-z. ]+$'), -- check staff name format
                    staff_department varchar(20),	-- Department which staff member belongs to
                    staff_Position varchar(20)     -- Position which Staff member has attained to
				   );
                   
-- Table to maintain Staff Schedule
create table Staff_schedule
						(
                        staff_id int null, -- to refer as foreign key for Staff_details
                        staff_name varchar(20), -- to use when combining
                        schedule_dates date not null,   -- to filter based on dates
                        slot_A Boolean not null,		-- timeslot 1 in mentioned date - 0 is empty,1 is reserved
                        slot_B Boolean not null			-- timeslot 2 in mentioned date - 0 is empty,1 is reserved
                        );

-- Table to maintain Appointment Status and will be used while joining tables                    
-- Table to store appointment status
CREATE TABLE Appointment_Status (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    visitor_name VARCHAR(50) NOT NULL,
    visitor_email VARCHAR(50) NOT NULL,
    mobile_number VARCHAR(15) NOT NULL,
    staff_name VARCHAR(50) NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_slot VARCHAR(10) NOT NULL,
    status ENUM('PENDING', 'APPROVED', 'REJECTED', 'RESCHEDULED') DEFAULT 'PENDING',
    UNIQUE KEY (visitor_email, mobile_number, appointment_date, appointment_slot)
);

                        
-- **********************************************************************************************************************************************************

-- Describing Tables
Desc table Visitor_details;
Desc table Login_details;
Desc table Staff_details;
Desc table Staff_schedule;
Desc table Appointment_status;
-- **********************************************************************************************************************************************************

-- Insertion Of Data into Login_details
insert into Login_details values (122334,'Asbpass1');
insert into Login_details values (223344,'Asbpass2');
insert into Login_details values (233445,'Asbpass3');
insert into Login_details values (334455,'Asbpass4');
insert into Login_details values (344556,'Asbpass5');
insert into Login_details values (445566,'Asbpass6');
insert into Login_details values (455667,'Asbpass7');
insert into Login_details values (556677,'Asbpass8');
insert into Login_details values (566778,'Asbpass9');
insert into Login_details values (667788,'Asbpass10');

-- Insertion of data into Staff_details
insert into Staff_details(staff_id,staff_name,staff_department,staff_position) values(1001,'Mrs.Aparna','DBMS','Professor');
insert into Staff_details(staff_id,staff_name,staff_department,staff_position) values(9021,'Mr.Narasimlu','JAVA','Professor');
insert into Staff_details(staff_id,staff_name,staff_department,staff_position) values(3068,'Mrs.Priyanka','OS','Professor');
insert into Staff_details(staff_id,staff_name,staff_department,staff_position) values(5702,'Mr.Anil','Management','HOD');
insert into Staff_details(staff_id,staff_name,staff_department,staff_position) values(7834,'Mr.Maheshwar Dutta','Management','Principal');

-- Insertion into Staff_schedule for staff member 'Mrs.Aparna'
insert into Staff_schedule values(1001,'Mrs.Aparna','2023-07-28','1','0');
insert into Staff_schedule values(1001,'Mrs.Aparna','2023-07-29','0','0');
insert into Staff_schedule values(1001,'Mrs.Aparna','2023-07-30','0','1');
insert into Staff_schedule values(1001,'Mrs.Aparna','2023-07-31','1','1');

-- Insertion into Staff_schedule for staff member 'Mr.Narasimlu'
insert into Staff_schedule values(9021,'Mr.Narasimlu','2023-07-28','0','0');
insert into Staff_schedule values(9021,'Mr.Narasimlu','2023-07-29','1','0');
insert into Staff_schedule values(9021,'Mr.Narasimlu','2023-07-30','1','1');
insert into Staff_schedule values(9021,'Mr.Narasimlu','2023-07-31','0','0');

-- Insertion into Staff_schedule for staff member 'Mrs.Priyanka'
insert into Staff_schedule values(3068,'Mrs.Priyanka','2023-07-28','0','1');
insert into Staff_schedule values(3068,'Mrs.Priyanka','2023-07-29','1','1');
insert into Staff_schedule values(3068,'Mrs.Priyanka','2023-07-30','1','0');
insert into Staff_schedule values(3068,'Mrs.Priyanka','2023-07-31','0','0');

-- Insertion into Staff_schedule for staff member 'Mr.Anil'
insert into Staff_schedule values(5702,'Mr.Anil','2023-07-28','1','1');
insert into Staff_schedule values(5702,'Mr.Anil','2023-07-29','0','1');
insert into Staff_schedule values(5702,'Mr.Anil','2023-07-30','1','0');
insert into Staff_schedule values(5702,'Mr.Anil','2023-07-31','0','1');

-- Insertion into Staff_schedule for staff member 'Mr.Maheshwar Dutta'
insert into Staff_schedule values(7834,'Mr.Maheshwar Dutta','2023-07-28','1','1');
insert into Staff_schedule values(7834,'Mr.Maheshwar Dutta','2023-07-29','1','0');
insert into Staff_schedule values(7834,'Mr.Maheshwar Dutta','2023-07-30','1','0');
insert into Staff_schedule values(7834,'Mr.Maheshwar Dutta','2023-07-31','1','1');
-- **********************************************************************************************************************************************************

-- Displaying Tables
select * from visitor_details;
select * from Login_details;
select * from Staff_details;
select * from Staff_schedule;
select * from Appointment_status;
-- ******************************************************************************************************************************************
