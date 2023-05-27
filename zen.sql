create database zen;
use zen;

CREATE TABLE Users(
  `user_id`  BIGINT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `mobile` INT(10) NOT NULL,
  PRIMARY KEY (`user_id`));
  
  
INSERT INTO users VALUES (NULL, 'Koushik', 'koushik@gmail.com', '7550159272');
INSERT INTO users VALUES (NULL, 'Arun', 'arun@gmail.com', '9955886644');
INSERT INTO users VALUES (NULL, 'Madesh', 'madesh@gmail.com', '9574259684');
INSERT INTO users VALUES (NULL, 'Varsha', 'varsha@gmail.com', '9156845628');
INSERT INTO users VALUES (NULL, 'Anisha', 'anisha@gmail.com', '9845456363');

CREATE TABLE codekata(
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `total_submissions` INT NOT NULL,
  `geek_coins` INT NOT NULL,
  `rank` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `userIdKeyCodeKata_idx` (`user_id` ASC),
  CONSTRAINT `userIdKeyCodeKata`
    FOREIGN KEY (`user_id`)
    REFERENCES Users(`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
INSERT INTO codekata VALUES(NULL, '1', '70', '1000', '11');
INSERT INTO codekata VALUES(NULL, '2', '80', '5000', '9');
INSERT INTO codekata VALUES(NULL, '3', '90', '10000', '7');
INSERT INTO codekata VALUES(NULL, '4', '100', '15000', '5');
INSERT INTO codekata VALUES(NULL, '5', '110', '20000', '1');


CREATE TABLE topics( `topic_id` INT NOT NULL AUTO_INCREMENT,
	`topic_name` VARCHAR(45) NOT NULL, 
	`course_id` INT NOT NULL, 
	PRIMARY KEY (`topic_id`), 
	INDEX `courseIdKey_idx` (`course_id` ASC), 
	CONSTRAINT `courseIdKey` FOREIGN KEY (`course_id`) 
	REFERENCES `courses` (`course_id`) 
	ON DELETE NO ACTION
	ON UPDATE NO ACTION);

INSERT INTO topics VALUES(NULL, 'mysql', '1');
INSERT INTO topics VALUES(NULL, 'dom', '1');
INSERT INTO topics VALUES(NULL, 'javascript', '1');
INSERT INTO topics VALUES(NULL, 'css', '1');
INSERT INTO topics VALUES(NULL, 'promise', '1');



CREATE TABLE attendance(
  `entry_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `user_id` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`entry_id`),
  INDEX `userIdKey_idx` (`user_id` ASC),
  CONSTRAINT `userIdKey`
    FOREIGN KEY (`user_id`)
    REFERENCES Users(`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO attendance VALUES (NULL, '2022-10-07', '1', 'present');
INSERT INTO attendance VALUES (NULL, '2022-10-02', '2', 'absent');
INSERT INTO attendance VALUES (NULL, '2022-10-29', '3', 'present');
INSERT INTO attendance VALUES (NULL, '2022-10-05', '4', 'absent');
INSERT INTO attendance VALUES (NULL, '2022-10-28', '5', 'present');



CREATE TABLE tasks(
  `row_id` INT NOT NULL AUTO_INCREMENT,
  `task_name` VARCHAR(45) NOT NULL,
  `task_url` VARCHAR(45) NOT NULL,
  `task_date` DATE NOT NULL,
  `task_deadline` DATE NOT NULL,
  `student_id` INT NULL,
  PRIMARY KEY (`row_id`),
  INDEX `studentIdKey_idx` (`student_id` ASC),
  CONSTRAINT `studentIdKey`
    FOREIGN KEY (`student_id`)
    REFERENCES Users (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO tasks VALUES (NULL, 'sql', '\"http:sql\"', '2022-10-01', '2022-10-05', '1');
INSERT INTO tasks VALUES (NULL, 'bms', '\"http:bms\"', '2022-10-06', '2022-10-10', '2');
INSERT INTO tasks VALUES (NULL, 'pagination', '\"http:pagination\"', '2022-10-11', '2022-10-15', '3');
INSERT INTO tasks VALUES (NULL, 'restapi', '\"http:restapi\"', '2022-10-16', '2022-10-20', '4');
INSERT INTO tasks VALUES (NULL, 'weatherapi', '\"http:weatherapi\"', '2022-10-21', '2022-10-25', '5');



CREATE TABLE company_drives( `row_id` INT NOT NULL AUTO_INCREMENT, 
	`drive_name` VARCHAR(45) NOT NULL, 
	`company_name` VARCHAR(45) NOT NULL, 
	`ctc` INT NOT NULL, 
	`student_id` INT NULL, 
	PRIMARY KEY (`row_id`), 
	INDEX `studentIdKey_idx` (`student_id` ASC), 
	CONSTRAINT `studentIdKey2` 
	FOREIGN KEY (`student_id`) 
	REFERENCES Users(`user_id`) 
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION);
	
INSERT INTO company_drives VALUES (NULL, 'Azure Cloud', 'Azure', '12', '1');
INSERT INTO company_drives VALUES (NULL, 'Software Testing', 'Datafoundry', '25', '1');
INSERT INTO company_drives VALUES (NULL, 'Data Analyst', 'Wipro', '18', '1');
INSERT INTO company_drives VALUES (NULL, 'AWS', 'Amazon', '20', '1');
INSERT INTO company_drives VALUES (NULL, 'Google Developer', 'Google', '30', '1');


CREATE TABLE mentor(
  `row_id` INT NOT NULL AUTO_INCREMENT,
  `mentor_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`row_id`))

INSERT INTO mentor VALUES (NULL, '4', '2');
INSERT INTO mentor VALUES (NULL, '2', '2');
INSERT INTO mentor VALUES (NULL, '6', '1');
INSERT INTO mentor VALUES (NULL, '5', '5');
INSERT INTO mentor VALUES (NULL, '7', '5');



SELECT * FROM topics INNER JOIN tasks ON users.user_id = codekata.user_id Where task_date=10;

SELECT * FROM company_drives ON users.user_id = codekata.user_id Where date=2020-10-15 => 2020-10-31;

SELECT COUNT(student_id) AS Totally_attended FROM company_drives WHERE student_id=1;

SELECT COUNT(student_id) AS total_submissions FROM codekata WHERE student_id=1; 

SELECT * FROM mentor WHERE mentor_id=<15;

SELECT * FROM users INNER JOIN 
	(select 'status' = 'absent', task_submitted) WHERE date=2020-10-15 => 2020-10-31; ;




-- Find all the topics and tasks which are thought in the month of October
-- Find all the company drives which appeared between 15 oct-2020 and 31-oct-2020
-- Find all the company drives and students who are appeared for the placement.
-- Find the number of problems solved by the user in codekata
-- Find all the mentors with who has the mentee's count more than 15
-- Find the number of users who are absent and task is not submitted  between 15 oct-2020 and 31-oct-2020        