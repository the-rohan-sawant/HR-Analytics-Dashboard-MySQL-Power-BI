CREATE DATABASE projects;

USE projects;

SELECT * FROM hr;

ALTER TABLE hr
CHANGE COLUMN ï»¿id empid VARCHAR(20) NULL;

DESCRIBE hr;

SELECT birthdate FROM hr;

UPDATE hr
SET birthdate = CASE
    WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
    ELSE NULL 
END;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

UPDATE hr
SET hiredate = CASE
    WHEN hiredate LIKE '%/%' THEN date_format(str_to_date(hiredate,'%m/%d/%Y'),'%Y-%m-%d')
    WHEN hiredate LIKE '%-%' THEN date_format(str_to_date(hiredate,'%m-%d-%Y'),'%Y-%m-%d')
    ELSE NULL 
END;

UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate FROM hr;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

ALTER TABLE hr
MODIFY COLUMN hiredate DATE;

ALTER TABLE hr ADD COLUMN age INT;

UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT birthdate , age FROM hr;

SELECT 
     MIN(age) AS youngest,
     MAX(age) AS oldest
FROM hr;

