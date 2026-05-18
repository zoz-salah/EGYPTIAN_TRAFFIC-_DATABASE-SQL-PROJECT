CREATE TABLE TRAFFIC_OFFICER (
    officer_id   NUMBER PRIMARY KEY,
    code_elzabet VARCHAR2(20) UNIQUE NOT NULL,
    full_name    VARCHAR2(100) NOT NULL,
    rank         VARCHAR2(50) NOT NULL,
    governorate  VARCHAR2(50) NOT NULL,
    phone        VARCHAR2(20)
);     


CREATE TABLE OWNER (
    owner_id    NUMBER PRIMARY KEY,
    national_id VARCHAR2(14) UNIQUE NOT NULL,
    full_name   VARCHAR2(100) NOT NULL,
    phone       VARCHAR2(20),
    address     VARCHAR2(200),
    governorate VARCHAR2(50) NOT NULL,
    birth_date  DATE NOT NULL,
    gender      VARCHAR2(10) NOT NULL,
    CONSTRAINT check_gender CHECK (gender IN ('Male', 'Female'))
);


CREATE TABLE OWNER_LICENSE (
    license_id      NUMBER PRIMARY KEY,
    owner_id        NUMBER NOT NULL,
    license_number  VARCHAR2(30) UNIQUE NOT NULL,
    license_type    VARCHAR2(30) NOT NULL,
    issue_date      DATE NOT NULL,
    expiry_date     DATE NOT NULL,
    status          VARCHAR2(20) DEFAULT 'Active' NOT NULL,
    issuing_office  VARCHAR2(100),
    CONSTRAINT check_forignKey FOREIGN KEY (owner_id)  REFERENCES OWNER(owner_id),
    CONSTRAINT check_no3el3arbya CHECK (license_type IN ('Private','Professional','Motorcycle','Heavy Truck','International')),
    CONSTRAINT check_ro5sa CHECK (status IN ('Active','Expired','Suspended','Revoked')),
    CONSTRAINT check_expire CHECK (expiry_date > issue_date)
);

CREATE TABLE VEHICLE (
    vehicle_id      NUMBER PRIMARY KEY,
    owner_id        NUMBER NOT NULL,
    plate_number    VARCHAR2(20) UNIQUE NOT NULL,
    plate_type      VARCHAR2(30) NOT NULL,
    plate_color     VARCHAR2(20) NOT NULL,
    governorate_code VARCHAR2(10) NOT NULL,
    make           VARCHAR2(50) NOT NULL,
    model          VARCHAR2(50) NOT NULL,
    year           NUMBER(4) NOT NULL,
    color          VARCHAR2(30),
    engine_number  VARCHAR2(50) UNIQUE NOT NULL,
    chassis_number VARCHAR2(50) UNIQUE NOT NULL,
    last_exam_date   DATE,
    exam_expiry_date DATE,
    CONSTRAINT fk_owner   FOREIGN KEY (owner_id) REFERENCES OWNER(owner_id),
    CONSTRAINT chk_ptype  CHECK (plate_type IN ('Private','Taxi','Police','Truck','Diplomatic','Government','Motorcycle','Customs')),
    CONSTRAINT chk_pcolor CHECK (plate_color IN ('Light Blue','Orange','Dark Blue','Red','Green','Yellow','Brown')),
    CONSTRAINT chk_year   CHECK (year BETWEEN 1950 AND 2030)
);

CREATE TABLE CAR_LICENSE (
    car_license_id   NUMBER PRIMARY KEY,
    vehicle_id       NUMBER NOT NULL,
    owner_id         NUMBER NOT NULL,
    issue_date       DATE NOT NULL,
    expiry_date      DATE NOT NULL,
    license_status   VARCHAR2(20) DEFAULT 'Active' NOT NULL,
    license_type     VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_vehicle  FOREIGN KEY (vehicle_id) REFERENCES VEHICLE(vehicle_id),
    CONSTRAINT fk_owner    FOREIGN KEY (owner_id)   REFERENCES OWNER(owner_id),
    CONSTRAINT chk_status  CHECK (license_status IN ('Active','Expired','Suspended')),
    CONSTRAINT chk_type    CHECK (license_type IN ('Private','Commercial','Taxi','Heavy Truck','Motorcycle')),
    CONSTRAINT chk_dates   CHECK (expiry_date > issue_date)
);

CREATE TABLE VIOLATION (
    violation_id     NUMBER PRIMARY KEY,
    vehicle_id       NUMBER NOT NULL,
    owner_id         NUMBER NOT NULL,
    officer_id       NUMBER NOT NULL,
    violation_date   DATE NOT NULL,
    violation_type   VARCHAR2(50) NOT NULL,
    location         VARCHAR2(200),
    fine_amount      NUMBER(10,2) NOT NULL,
    paid_status      VARCHAR2(20) DEFAULT 'Unpaid' NOT NULL,
    CONSTRAINT fk_vehicle FOREIGN KEY (vehicle_id) REFERENCES VEHICLE(vehicle_id),
    CONSTRAINT fk_owner   FOREIGN KEY (owner_id)   REFERENCES OWNER(owner_id),
    CONSTRAINT fk_officer FOREIGN KEY (officer_id) REFERENCES TRAFFIC_OFFICER(officer_id),
    CONSTRAINT chk_type CHECK (violation_type IN ('Speeding','Red Light','No Seatbelt','Wrong Way','Illegal Parking',
        'Mobile Phone Use','No License','Expired License','Overloading','Drunk Driving')),
    CONSTRAINT chk_vio_paid CHECK (paid_status IN ('Paid','Unpaid','Waived')),
    CONSTRAINT chk_vio_fine CHECK (fine_amount > 0)
);


INSERT INTO TRAFFIC_OFFICER VALUES (1, 'OFFICER-001', 'Ahmed Mohamed Ali',       '3ameed',          'Cairo',        '01001234501');
INSERT INTO TRAFFIC_OFFICER VALUES (2, 'OFFICER-002', 'Omar Hassan Ibrahim',     'Na2eeb',        'Giza',         '01001234502');
INSERT INTO TRAFFIC_OFFICER VALUES (3, 'OFFICER-003', 'Khaled Mahmoud Saad',    'Molazem',     'Alexandria',   '01001234503');
INSERT INTO TRAFFIC_OFFICER VALUES (4, 'OFFICER-004', 'Mostafa Youssef Nabil',  'Molazem 1',       'Cairo',        '01001234504');
INSERT INTO TRAFFIC_OFFICER VALUES (5, 'OFFICER-005', 'Tarek Adel Farouk',      'Mo2adem',       'Giza',         '01001234505');
INSERT INTO TRAFFIC_OFFICER VALUES (6, 'OFFICER-006', 'Samer Walid Ezzat',      '3a2eed',       'Port Said',    '01001234506');
INSERT INTO TRAFFIC_OFFICER VALUES (7, 'OFFICER-007', 'Hossam Fathy Ragab',     'Ra2ed',          'Suez',         '01001234507');
INSERT INTO TRAFFIC_OFFICER VALUES (8, 'OFFICER-008', 'Islam Sherif Zaki',      'Lewa2',        'Luxor',        '01001234508');
INSERT INTO TRAFFIC_OFFICER VALUES (9, 'OFFICER-009', 'Wael Nasser Hamza',      '3ameed',     'Aswan',        '01001234509');
INSERT INTO TRAFFIC_OFFICER VALUES (10,'OFFICER-010', 'Ramy Gamal Abdel Aziz',  'Ra2ed',       'Mansoura',     '01001234510');

INSERT INTO OWNER VALUES (1,  '29901011234561', 'Mohamed Ahmed Sayed',      '01112345601', '5 Tahrir Sq, Cairo',     'Cairo',      TO_DATE('01-01-1999','DD-MM-YYYY'), 'Male');
INSERT INTO OWNER VALUES (2,  '29805021234562', 'Fatima Hassan Omar',       '01012345602', '12 Nile St, Giza',       'Giza',       TO_DATE('02-05-1998','DD-MM-YYYY'), 'Female');
INSERT INTO OWNER VALUES (3,  '29503031234563', 'Karim Youssef Nabil',      '01512345603', '3 Corniche, Alex',       'Alexandria', TO_DATE('03-03-1995','DD-MM-YYYY'), 'Male');
INSERT INTO OWNER VALUES (4,  '29007041234564', 'Sara Mahmoud Ibrahim',     '01212345604', '8 Orabi St, Cairo',      'Cairo',      TO_DATE('04-07-1990','DD-MM-YYYY'), 'Female');
INSERT INTO OWNER VALUES (5,  '29602051234565', 'Tamer Adel Mostafa',       '01612345605', '15 July 26 St, Giza',    'Giza',       TO_DATE('05-02-1996','DD-MM-YYYY'), 'Male');
INSERT INTO OWNER VALUES (6,  '29104061234566', 'Dina Walid Fouad',         '01012345606', '2 Sidi Gaber, Alex',     'Alexandria', TO_DATE('06-04-1991','DD-MM-YYYY'), 'Female');
INSERT INTO OWNER VALUES (7,  '29808071234567', 'Ayman Sherif Lotfy',       '01112345607', '9 Port Fouad, Port Said','Port Said',  TO_DATE('07-08-1998','DD-MM-YYYY'), 'Male');
INSERT INTO OWNER VALUES (8,  '29406081234568', 'Rania Fathy Saber',        '01512345608', '20 Suez Canal St, Suez', 'Suez',       TO_DATE('08-06-1994','DD-MM-YYYY'), 'Female');
INSERT INTO OWNER VALUES (9,  '29709091234569', 'Hassan Nasser Badr',       '01212345609', '7 Luxor Temple Rd',      'Luxor',      TO_DATE('09-09-1997','DD-MM-YYYY'), 'Male');
INSERT INTO OWNER VALUES (10, '29301101234560', 'Mona Gamal Amin',          '01612345610', '14 Aswan High Dam Rd',   'Aswan',      TO_DATE('10-01-1993','DD-MM-YYYY'), 'Female');



INSERT INTO OWNER_LICENSE VALUES (1,  1,  'DL-CAI-00001', 'Private',       TO_DATE('01-01-2020','DD-MM-YYYY'), TO_DATE('01-01-2025','DD-MM-YYYY'), 'Active',   'Cairo Traffic Office');
INSERT INTO OWNER_LICENSE VALUES (2,  2,  'DL-GIZ-00002', 'Private',       TO_DATE('02-02-2021','DD-MM-YYYY'), TO_DATE('02-02-2026','DD-MM-YYYY'), 'Active',   'Giza Traffic Office');
INSERT INTO OWNER_LICENSE VALUES (3,  3,  'DL-ALX-00003', 'Professional',  TO_DATE('03-03-2019','DD-MM-YYYY'), TO_DATE('03-03-2024','DD-MM-YYYY'), 'Expired',  'Alexandria Traffic Office');
INSERT INTO OWNER_LICENSE VALUES (4,  4,  'DL-CAI-00004', 'Private',       TO_DATE('04-04-2022','DD-MM-YYYY'), TO_DATE('04-04-2027','DD-MM-YYYY'), 'Active',   'Cairo Traffic Office');
INSERT INTO OWNER_LICENSE VALUES (5,  5,  'DL-GIZ-00005', 'Heavy Truck',   TO_DATE('05-05-2020','DD-MM-YYYY'), TO_DATE('05-05-2023','DD-MM-YYYY'), 'Expired',  'Giza Traffic Office');
INSERT INTO OWNER_LICENSE VALUES (6,  6,  'DL-ALX-00006', 'Private',       TO_DATE('06-06-2021','DD-MM-YYYY'), TO_DATE('06-06-2026','DD-MM-YYYY'), 'Active',   'Alexandria Traffic Office');
INSERT INTO OWNER_LICENSE VALUES (7,  7,  'DL-PRT-00007', 'Professional',  TO_DATE('07-07-2022','DD-MM-YYYY'), TO_DATE('07-07-2027','DD-MM-YYYY'), 'Active',   'Port Said Traffic Office');
INSERT INTO OWNER_LICENSE VALUES (8,  8,  'DL-SUZ-00008', 'Motorcycle',    TO_DATE('08-08-2023','DD-MM-YYYY'), TO_DATE('08-08-2028','DD-MM-YYYY'), 'Active',   'Suez Traffic Office');
INSERT INTO OWNER_LICENSE VALUES (9,  9,  'DL-LUX-00009', 'Private',       TO_DATE('09-09-2020','DD-MM-YYYY'), TO_DATE('09-09-2025','DD-MM-YYYY'), 'Active',   'Luxor Traffic Office');
INSERT INTO OWNER_LICENSE VALUES (10, 10, 'DL-ASW-00010', 'International', TO_DATE('10-10-2021','DD-MM-YYYY'), TO_DATE('10-10-2024','DD-MM-YYYY'), 'Expired',  'Aswan Traffic Office');




INSERT INTO VEHICLE VALUES (1,  1,  'ABC-123',    'Private',    'Blue', 'CAI', 'Toyota',     'Corolla',  2020, 'White',  'ENG-CAI-0001', 'CHS-CAI-0001', TO_DATE('01-03-2024','DD-MM-YYYY'), TO_DATE('01-03-2025','DD-MM-YYYY'));
INSERT INTO VEHICLE VALUES (2,  2,  'AB-1234',    'Private',    'Grey', 'GIZ', 'Hyundai',    'Elantra',  2019, 'Silver', 'ENG-GIZ-0002', 'CHS-GIZ-0002', TO_DATE('15-04-2024','DD-MM-YYYY'), TO_DATE('15-04-2025','DD-MM-YYYY'));
INSERT INTO VEHICLE VALUES (3,  3,  'DEF-2345',   'Taxi',       'Orange',     'ALX', 'Lada',       'Vesta',    2018, 'Yellow', 'ENG-ALX-0003', 'CHS-ALX-0003', TO_DATE('20-05-2023','DD-MM-YYYY'), TO_DATE('20-05-2024','DD-MM-YYYY'));
INSERT INTO VEHICLE VALUES (4,  4,  'GHI-456',    'Private',    'Blue', 'CAI', 'Kia',        'Sportage', 2022, 'Black',  'ENG-CAI-0004', 'CHS-CAI-0004', TO_DATE('10-06-2024','DD-MM-YYYY'), TO_DATE('10-06-2025','DD-MM-YYYY'));
INSERT INTO VEHICLE VALUES (5,  5,  'SB-5678',    'Truck',      'Red',        'GIZ', 'Mercedes',   'Actros',   2017, 'Red',    'ENG-GIZ-0005', 'CHS-GIZ-0005', TO_DATE('25-07-2023','DD-MM-YYYY'), TO_DATE('25-07-2024','DD-MM-YYYY'));
INSERT INTO VEHICLE VALUES (6,  6,  'JKL-3456',   'Private',    'Blue', 'ALX', 'Chevrolet',  'Optra',    2021, 'Blue',   'ENG-ALX-0006', 'CHS-ALX-0006', TO_DATE('05-08-2024','DD-MM-YYYY'), TO_DATE('05-08-2025','DD-MM-YYYY'));
INSERT INTO VEHICLE VALUES (7,  7,  'TB-7890',    'Police',     'Blue',  'PRT', 'Skoda',      'Octavia',  2023, 'Dark Blue','ENG-PRT-0007','CHS-PRT-0007', TO_DATE('12-09-2024','DD-MM-YYYY'), TO_DATE('12-09-2025','DD-MM-YYYY'));
INSERT INTO VEHICLE VALUES (8,  8,  'MNO-4567',   'Motorcycle', 'White', 'SUZ', 'Honda',      'CB500',    2022, 'Red',    'ENG-SUZ-0008', 'CHS-SUZ-0008', TO_DATE('18-10-2024','DD-MM-YYYY'), TO_DATE('18-10-2025','DD-MM-YYYY'));
INSERT INTO VEHICLE VALUES (9,  9,  'PQR-5678',   'Private',    'Black', 'LUX', 'Nissan',     'Sunny',    2020, 'Grey',   'ENG-LUX-0009', 'CHS-LUX-0009', TO_DATE('22-11-2023','DD-MM-YYYY'), TO_DATE('22-11-2024','DD-MM-YYYY'));
INSERT INTO VEHICLE VALUES (10, 10, 'STU-6789',   'Private',    'Red', 'ASW', 'Fiat',       '500',      2019, 'Green',  'ENG-ASW-0010', 'CHS-ASW-0010', TO_DATE('30-12-2024','DD-MM-YYYY'), TO_DATE('30-12-2025','DD-MM-YYYY'));


INSERT INTO CAR_LICENSE VALUES (1,  1,  1,  TO_DATE('01-01-2023','DD-MM-YYYY'), TO_DATE('01-01-2026','DD-MM-YYYY'), 'Active',   'Private');
INSERT INTO CAR_LICENSE VALUES (2,  2,  2,  TO_DATE('02-02-2023','DD-MM-YYYY'), TO_DATE('02-02-2026','DD-MM-YYYY'), 'Active',   'Private');
INSERT INTO CAR_LICENSE VALUES (3,  3,  3,  TO_DATE('03-03-2022','DD-MM-YYYY'), TO_DATE('03-03-2025','DD-MM-YYYY'), 'Active',   'Taxi');
INSERT INTO CAR_LICENSE VALUES (4,  4,  4,  TO_DATE('04-04-2023','DD-MM-YYYY'), TO_DATE('04-04-2026','DD-MM-YYYY'), 'Active',   'Private');
INSERT INTO CAR_LICENSE VALUES (5,  5,  5,  TO_DATE('05-05-2021','DD-MM-YYYY'), TO_DATE('05-05-2024','DD-MM-YYYY'), 'Expired',  'Heavy Truck');
INSERT INTO CAR_LICENSE VALUES (6,  6,  6,  TO_DATE('06-06-2023','DD-MM-YYYY'), TO_DATE('06-06-2026','DD-MM-YYYY'), 'Active',   'Private');
INSERT INTO CAR_LICENSE VALUES (7,  7,  7,  TO_DATE('07-07-2023','DD-MM-YYYY'), TO_DATE('07-07-2026','DD-MM-YYYY'), 'Active',   'Commercial');
INSERT INTO CAR_LICENSE VALUES (8,  8,  8,  TO_DATE('08-08-2023','DD-MM-YYYY'), TO_DATE('08-08-2026','DD-MM-YYYY'), 'Active',   'Motorcycle');
INSERT INTO CAR_LICENSE VALUES (9,  9,  9,  TO_DATE('09-09-2022','DD-MM-YYYY'), TO_DATE('09-09-2025','DD-MM-YYYY'), 'Active',   'Private');
INSERT INTO CAR_LICENSE VALUES (10, 10, 10, TO_DATE('10-10-2022','DD-MM-YYYY'), TO_DATE('10-10-2025','DD-MM-YYYY'), 'Suspended','Private');


INSERT INTO VIOLATION VALUES (1,  1,  1,  1,  TO_DATE('10-01-2024','DD-MM-YYYY'), 'Speeding',        'Ring Road Cairo km 12',        500,   'Paid');
INSERT INTO VIOLATION VALUES (2,  2,  2,  2,  TO_DATE('15-02-2024','DD-MM-YYYY'), 'No Seatbelt',     'Mehwar Road Giza',             150,   'Paid');
INSERT INTO VIOLATION VALUES (3,  3,  3,  3,  TO_DATE('20-03-2024','DD-MM-YYYY'), 'Red Light',       'Corniche Alexandria',          300,   'Unpaid');
INSERT INTO VIOLATION VALUES (4,  4,  4,  4,  TO_DATE('25-04-2024','DD-MM-YYYY'), 'Illegal Parking', 'Downtown Cairo',               200,   'Unpaid');
INSERT INTO VIOLATION VALUES (5,  5,  5,  5,  TO_DATE('30-05-2024','DD-MM-YYYY'), 'Overloading',     'Cairo-Alex Desert Road km 50', 1000,  'Unpaid');
INSERT INTO VIOLATION VALUES (6,  6,  6,  6,  TO_DATE('05-06-2024','DD-MM-YYYY'), 'Mobile Phone Use','Sidi Gaber Alexandria',        300,   'Paid');
INSERT INTO VIOLATION VALUES (7,  7,  7,  7,  TO_DATE('10-07-2024','DD-MM-YYYY'), 'Wrong Way',       'Port Said Corniche',           400,   'Unpaid');
INSERT INTO VIOLATION VALUES (8,  8,  8,  8,  TO_DATE('15-08-2024','DD-MM-YYYY'), 'No Seatbelt',     'Suez Road km 5',               150,   'Paid');
INSERT INTO VIOLATION VALUES (9,  9,  9,  9,  TO_DATE('20-09-2024','DD-MM-YYYY'), 'Speeding',        'Luxor-Aswan Highway',          500,   'Unpaid');
INSERT INTO VIOLATION VALUES (10, 10, 10, 10, TO_DATE('25-10-2024','DD-MM-YYYY'), 'Expired License', 'Aswan Corniche',               350,   'Unpaid');

COMMIT;




CREATE VIEW VW_VIOLATION_REPORT AS
SELECT
    v.violation_id, o.full_name AS owner_name, o.national_id, vh.plate_number,
    vh.make, vh.model, v.violation_date, v.violation_type, v.location,
    v.fine_amount, v.paid_status, tf.full_name AS officer_name, tf.rank AS officer_rank
    FROM VIOLATION v
    JOIN OWNER o ON v.owner_id   = o.owner_id
    JOIN VEHICLE vh ON v.vehicle_id = vh.vehicle_id
    JOIN TRAFFIC_OFFICER tf ON v.officer_id  = tf.officer_id;
    
    --view == to make easy to show the data of violtions


select * from VIOLATION;
SELECT * FROM VW_VIOLATION_REPORT;




CREATE TRIGGER Trigger_auto_expire
AFTER INSERT ON VIOLATION
FOR EACH ROW
BEGIN
    UPDATE CAR_LICENSE
    SET    license_status = 'Expired'
    WHERE  vehicle_id     = :NEW.vehicle_id
    AND    expiry_date    < SYSDATE
    AND    license_status = 'Active';
END;




INSERT INTO VIOLATION
      (violation_id, vehicle_id, owner_id, officer_id, violation_date, violation_type,
       location, fine_amount, paid_status) 
       VALUES (11, 5, 5, 1, SYSDATE, 'Speeding', ' Eqlemy', 200, 'Unpaid');
       
       
COMMIT;

SELECT vehicle_id, license_status, expiry_date
FROM CAR_LICENSE
WHERE vehicle_id = 5;



-- radwan querey:

UPDATE VIOLATION
SET    paid_status = 'Paid'
WHERE  owner_id    = 3;


UPDATE CAR_LICENSE
SET    license_status = 'Suspended'
WHERE  vehicle_id     = 10;

UPDATE TRAFFIC_OFFICER
SET    rank  = 'lewaa'
WHERE  officer_id = 10;


update traffic_officer
set governorate = 'Cairo'
where officer_id = 5;

update traffic_officer
set phone = '01003570980'
where officer_id = 2;

update traffic_officer
set full_name = 'Ali Hassan Saloka'
where officer_id = 7;



delete from traffic_officer
where officer_id = 10;

delete from traffic_officer
where officer_id = 9;

COMMIT;


ALTER TABLE OWNER
ADD email VARCHAR2(100);


ALTER TABLE TRAFFIC_OFFICER
ADD national_id VARCHAR2(14);


select governorate, count(*) As total_officers
from traffic_officer
group by governorate;


select upper(full_name) As officer_name
from traffic_officer;

-- Ziad Salah

SELECT COUNT(*)  AS total_owners
FROM OWNER;

SELECT GOVERNORATE, COUNT(*)  AS total_owners
FROM OWNER
GROUP BY GOVERNORATE;

SELECT SUM(fine_amount) AS total_fines
FROM VIOLATION;

SELECT VIOLATION_TYPE, SUM(fine_amount) AS total_fines
FROM VIOLATION
group by VIOLATION_TYPE;


SELECT SUM(fine_amount)  AS total_fines_paid   
FROM VIOLATION 
WHERE paid_status = 'Paid';

SELECT full_name, phone
FROM OWNER
WHERE owner_id IN (SELECT DISTINCT owner_id FROM VEHICLE);


SELECT full_name, rank
FROM TRAFFIC_OFFICER
WHERE officer_id IN (SELECT officer_id FROM VIOLATION WHERE fine_amount > 500);



SELECT plate_type, COUNT(*)  AS the_type      
FROM VEHICLE    
GROUP BY plate_type;



commit;

select  o.owner_id , o.FULL_NAME, ol.LICENSE_TYPE, ol.STATUS
from OWNER o , OWNER_LICENSE ol
where ol.STATUS = 'Expired';



SELECT COUNT(*) FROM VIOLATION;

INSERT INTO VIOLATION VALUES (50, 1, 1, 1, SYSDATE, 'Speeding', 'Test Road', 500, 'Unpaid');

SELECT COUNT(*) FROM VIOLATION;  

ROLLBACK;

SELECT COUNT(*) FROM VIOLATION;  


-- SALEM querey:

select full_name, governorate
from owner
order by full_name;

select *
from owner
where governorate = 'Cairo';

select *
from owner
where full_name = 'Sara Mahmoud Ibrahim';

-- ziad wael

SELECT 
    o.full_name As owner_name,
    o.national_id,
    vh.plate_number,
    v.violation_id,
    v.violation_date,
    v.violation_type,
    v.location,
    v.fine_amount,
    v.paid_status
FROM VIOLATION v, OWNER o, VEHICLE vh
WHERE v.paid_status = 'Unpaid'
AND v.owner_id = o.owner_id
AND   v.vehicle_id  = vh.vehicle_id
AND v.owner_id IN (SELECT owner_id FROM OWNER)
ORDER BY v.fine_amount DESC;

-- osama 

select rank , phone ,badge_number AS nnnumber
from TRAFFIC_OFFICER
where rank = '3ameed'

select *
from traffic_officer
order by officer_id desc ;



select rank,full_name
from traffic_officer
where rank < all (select rank
                  from traffic_officer
                  where officer_id = 3 );

 
select officer_id ,full_name, RANK
from traffic_officer
where officer_id < all (select officer_id
                        from traffic_officer  
                        where rank = 'Ra2ed' );



select plate_number,make,model, YEAR
from vehicle 
where owner_id in( select owner_id
                   from owner 
                   where governorate ='Giza');



update traffic_officer 
set phone = '01280994246'
where officer_id = 7;

update violation
set paid_status = 'Paid'
where violation_id = 7;

commit;

delete from violation 
where violation_id in(
select violation_id 
from violation
where paid_status = 'Paid' );

rollback;




-- mohamed shehab 

select make, model, year, color
from vehicle
order by year desc;

select owner_id ,count(*) as total_vehicles
from vehicle
group by owner_id;

select violation_type, count(*) as total_violations
from violation
where paid_status = 'Unpaid'
group by violation_type;

select license_type, count(*) as total_licenses
from owner_license
group by license_type
order by total_licenses desc;


select owner_id, full_name, governorate
from owner
where owner_id in (select owner_id
                   from violation
                   where fine_amount > (select avg(fine_amount)
                   from violation));

--Zeyad Mohamed 

SELECT o.owner_id , o.GOVERNORATE , ol.expiry_date 
FROM OWNER o
LEFT OUTER JOIN OWNER_LICENSE ol
ON o.owner_id = ol.owner_id;



SELECT officer_id , full_name , rank , governorate
FROM TRAFFIC_OFFICER
WHERE governorate = 'Cairo';

SELECT gender , count(gender)
FROM OWNER
GROUP BY gender;

SELECT o.owner_id, o.full_name, SUM(v.fine_amount) AS total_fines
FROM OWNER o
LEFT JOIN VIOLATION v ON o.owner_id = v.owner_id
GROUP BY o.owner_id, o.full_name;

UPDATE CAR_LICENSE
SET license_status = 'Active'
WHERE owner_id = 3;

UPDATE VIOLATION
SET paid_status = 'Paid'
WHERE violation_id = 3;

COMMIT; 

DELETE FROM VIOLATION
WHERE violation_id = 3;

ROLLBACK;

ALTER TABLE VEHICLE
ADD fuel_type VARCHAR2(20);

ALTER TABLE VEHICLE
MODIFY fuel_type VARCHAR2(50);

ALTER TABLE VEHICLE
DROP COLUMN fuel_type;
