CREATE DATABASE Caregivers;

use Caregivers;

CREATE TABLE USER (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    given_name VARCHAR(50),
    surname VARCHAR(50),
    city VARCHAR(50),
    phone_number VARCHAR(20),
    profile_description TEXT,
    password VARCHAR(50) NOT NULL
);

CREATE TABLE CAREGIVER (
    caregiver_user_id INT AUTO_INCREMENT PRIMARY KEY,
    photo LONGBLOB,
    gender VARCHAR(10),
    caregiving_type VARCHAR(50),
    hourly_rate DECIMAL(8, 2),
    FOREIGN KEY (caregiver_user_id) REFERENCES USER(user_id)
);

CREATE TABLE MEMBER (
    member_user_id INT AUTO_INCREMENT PRIMARY KEY,
    house_rules TEXT,
    FOREIGN KEY (member_user_id) REFERENCES USER(user_id)
);

CREATE TABLE ADDRESS (
    member_user_id INT AUTO_INCREMENT PRIMARY KEY,
    house_number VARCHAR(10),
    street VARCHAR(50),
    town VARCHAR(50),
    FOREIGN KEY (member_user_id) REFERENCES USER(user_id)
);

CREATE TABLE JOB (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    member_user_id INT,
    required_caregiving_type VARCHAR(50),
    other_requirements TEXT,
    date_posted DATE,
    FOREIGN KEY (member_user_id) REFERENCES MEMBER(member_user_id)
);

CREATE TABLE JOB_APPLICATION (
    caregiver_user_id INT AUTO_INCREMENT PRIMARY KEY,
    job_id INT,
    date_applied DATE,
    FOREIGN KEY (caregiver_user_id) REFERENCES CAREGIVER(caregiver_user_id)
);

CREATE TABLE APPOINTMENT (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    caregiver_user_id INT,
    member_user_id INT,
    appointment_date DATE,
    appointment_time TIME,
    work_hours INT,
    status VARCHAR(20),
    FOREIGN KEY (caregiver_user_id) REFERENCES CAREGIVER(caregiver_user_id),
    FOREIGN KEY (member_user_id) REFERENCES MEMBER(member_user_id)
);


INSERT INTO USER (user_id, email, given_name, surname, city, phone_number, profile_description, password)
VALUES
    (12345, 'Askar@gmail.com', 'Askar', 'Askarov', 'Astana', '+7 777 777 77 77', 'Babysitter with CPR training', 123456789),
    (12456, 'Jane@gmail.com', 'Jane', 'Smith', 'Almaty’', '+7 771 777 77 77', 'Elderly care professional', 234567890),
    (13478, 'Jack@gmail.com', 'Jack', 'White', 'Astana', '+7 707 777 77 77', 'Certified playmate for children', 345678901),
    (10955, 'Jeane@gmail.com', 'Jeane', 'Kim', 'Semey', '+7 701 777 77 55', 'Single parent looking for a reliable babysitter', 054632315),
    (18321, 'Arystan@gmail.com', 'Arystan', 'Markov', 'Astana', '+7 771 777 44 55', 'Elderly family member needs assistance', 098765432),
    (18934, 'Zhan@example.com', 'Zhan', 'Bastyq', 'Semey’', '+7 701 777 77 77', 'Elderly care professional', 456789012),
    (12675, 'Khanym@gmail.com', 'Khanym', 'Adilova', 'Almaty', '+7 747 777 77 77', 'Child Care specialist with 5 years of experience', 567890123),
    (19876, 'Kerey@gmail.com', 'Kerey', 'Zhigitov', 'Astana', '+7 777 777 77 55', 'Experienced Babysitter', 678901234),
    (13217, 'Bolat@gmail.com', 'Bolat', 'Bolatov', 'Astana', '+7 701 777 77 55', 'Single parent looking for a reliable babysitter', 789012345),
    (18978, 'Amira@gmail.com', 'Amira', 'Murat', 'Almaty', '+7 707 777 77 55', 'Elderly family member needs assistance', 890123456),
    (12349, 'Anuar@gmail.com', 'Anuar', 'Tarkhanov', 'Taraz', '+7 701 777 77 44', 'Busy professional seeking help with childcare', 890123456),
    (12510, 'Bakyt@gmail.com', 'Baqyt', 'Happy', 'Astana', '+7 701 777 77 33', 'Looking for a babysiter for my 4-year-old son', 901234567),
    (13556, 'Ainur@gmail.com', 'Ainur', 'Zhakenova', 'Astana', '+7 771 777 77 33', 'Elderly care professional', '012345678'),
    (15678, 'Moldir@gmail.com', 'Moldir', 'Rakhit', 'Astana', '+7 701 777 77 66', 'Certified playmate for children with 6 years of experience', 123467890),
    (14876, 'Aibar@gmail.com', 'Aibar', 'Aibarov', 'Almaty', '+7 747 777 77 22', 'Looking for a babysiter', '123467890'),
    (14538, 'Bayraq@gmail.com', 'Bayraq', 'Assetov', 'Astana', '+7 707 777 77 35', 'Busy employee looking for elderly family member assistance', 167834522),
    (12522, 'Shaya@gmail.com', 'Shaya', 'Larken', 'Semey', '+7 771 777 77 33', 'Professional playmate', 012367890),
	(12509, 'Ansar@gmail.com', 'Ansar', 'Sezimov', 'Astana', '+7 747 777 99 44', 'Looking for a babysiter for my 3-year-old son', 890123456),
    (12777, 'Maxim@example.com', 'Maxim', 'Arlen', 'Astana’', '+7 701 777 33 11', 'Elderly care professional', 345678123),
    (14490, 'Malika@gmail.com', 'Malika', 'Khan', 'Almaty', '+7 747 777 45 35', 'Child Care specialist with 2 years of experience', 567232431),
    (10006, 'Kairat@gmail.com', 'Kairat', 'Lazatov', 'Almaty', '+7 777 777 55 22', 'Looking for a babysiter for my 5-year-old daughter', 654321098),
	(10543, 'Zhanna@gmail.com', 'Zhanna', 'Inkar', 'Astana', '+7 771 777 33 66', 'Elderly care specialist with 4 years of experience', 623515723),
    (12333, 'Nursultan@gmail.com', 'Nursultan', 'Quashev', 'Almaty', '+7 747 777 77 99', 'Babysitter with CPR training', 012367890);

INSERT INTO CAREGIVER (caregiver_user_id, photo, gender, caregiving_type, hourly_rate)
VALUES
    (12345, NULL, 'Male', 'Baby Sitter', 15.00),
    (12456, NULL, 'Female', 'Elderly Care', 20.00),
    (13478, NULL, 'Male', 'Playmate for Children', 6.00),
    (18934, NULL, 'Male', 'Elderly Care', 12.50),
    (12675, NULL, 'Female', 'Baby Sitter', 7.50),
    (19876, NULL, 'Male', 'Baby Sitter', 9.00),
    (13556, NULL, 'Female', 'Elderly Care', 8.50),
    (15678, NULL, 'Female', 'Playmate for Children', 20.50),
    (12522, NULL, 'Female', 'Playmate for Children', 13.00),
    (12333, NULL, 'Male', 'Baby Sitter', 5.50),
    (12777, NULL, 'Male', 'Elderly Care', 15.50),
    (14490, NULL, 'Female', 'Baby Sitter', 7.00),
    (10543, NULL, 'Female', 'Elderly Care', 18.50);

INSERT INTO MEMBER (member_user_id, house_rules)
VALUES
    (13217, 'Follow hygiene rules and keep the house clean'),
    (18978, 'Be attentive to the needs of the elderly family member'),
    (12349, 'No outside food for the children, please'),
    (12510, 'Must be punctual and reliable'),
    (14876, 'Engage in creative activities with the children and No pets'),
    (14538, 'Maintain a safe environment for the elderly family member and No pets'),
    (10955, 'Daily reports on the child''s activities'),
    (18321, 'No pets'),
    (12509, 'Good communication skills'),
    (10006, 'Experience with special needs children preferred');
    
INSERT INTO ADDRESS (member_user_id, house_number, street, town)
VALUES
    (13217, 101, 'Turan', 'Astana'),
    (18978, 202, 'Mangilik', 'Almaty'),
    (12349, 303, 'Abay', 'Taraz'),
    (12510, 404, 'Turan', 'Astana'),
    (14876, 505, 'Turkistan', 'Almaty'),
    (14538, 606, 'Respublika', 'Astana'),
    (10955, 707, 'Ualikhanov', 'Semey'),
    (18321, 808, 'Turan', 'Astana'),
    (12509, 909, 'Ramazan', 'Astana'),
    (10006, 000, 'Bogenbay', 'Almaty');
    
INSERT INTO JOB (job_id, member_user_id, required_caregiving_type, other_requirements, date_posted)
VALUES
    (17726, 13217, 'Baby Sitter', 'Daily gentle care needed for a 2-year-old', '2023-11-12'),
    (29302, 18978, 'Elderly Care', 'Weekly care for an 80-year-old and should be gentle', '2023-11-18'),
    (10573, 12349, 'Playmate for Children', 'Two hours of playtime daily', '2023-11-02'),
    (24001, 12510, 'Baby Sitter', 'Occasional evening childcare', '2023-11-14'),
    (12352, 14876, 'Playmate for Children', 'Creative activities for a 6-year-old', '2023-11-13'),
    (16668, 14538, 'Elderly Care', 'Assistance with daily tasks', '2023-11-19'),
    (20018, 10955, 'Baby Sitter', 'Morning gentle childcare for a toddler', '2023-11-20'),
    (19338, 18321, 'Playmate for Children', 'Weekend playdates', '2023-11-08'),
    (24306, 12509, 'Baby Sitter', 'Flexible schedule required', '2023-11-17'),
    (16329, 10006, 'Elderly Care', 'Companionship for an elderly family member', '2023-11-14');

INSERT INTO JOB_APPLICATION (caregiver_user_id, job_id, date_applied)
VALUES
    (12345, 17726, '2023-11-13'),
    (12456, 29302, '2023-11-18'),
    (13478, 10573, '2023-11-04'),
    (18934, 16668, '2023-11-20'),
    (12675, 24001, '2023-11-17'),
    (19876, 24306, '2023-11-18'),
    (13556, 16329, '2023-11-15'),
    (15678, 12352, '2023-11-13'),
    (12522, 19338, '2023-11-09'),
    (12777, 12352, '2023-11-14'),
    (14490, 24001, '2023-11-15'),
    (10543, 12352, '2023-11-15');

INSERT INTO APPOINTMENT (caregiver_user_id, member_user_id, appointment_date, appointment_time, work_hours, status)
VALUES
    (12345, 13217, '2023-11-14', '10:00', 4, 'Pending'),
    (12456, 18978, '2023-11-20', '15:00', 3, 'Confirmed'),
    (13478, 12349, '2023-11-07', '12:00', 2, 'Pending'),
    (18934, 14538, '2023-11-21', '18:00', 1, 'Confirmed'),
    (12675, 12510, '2023-11-19', '09:00', 5, 'Pending'),
    (19876, 12509, '2023-11-19', '14:00', 3, 'Confirmed'),
    (13556, 10006, '2023-11-17', '11:00', 4, 'Pending'),
    (15678, 14876, '2023-11-14', '16:00', 2, 'Confirmed'),
    (12522, 18321, '2023-11-10', '13:00', 6, 'Pending'),
    (12333, 10955, '2023-11-24', '17:00', 2, 'Confirmed'),
    (12777, 14876, '2023-11-15', '13:00', 3, 'Pending'),
    (14490, 12510, '2023-11-16', '17:00', 4, 'Pending'),
    (10543, 14876, '2023-11-16', '15:00', 2, 'Pending');


    




