-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
CREATE SEQUENCE seq_users;

CREATE TABLE users
(
userId integer NOT NULL,
isTeacher boolean NOT NULL,
firstName varchar (64) NOT NULL,
lastName varchar (64) NOT NULL,
email varchar (128) NOT NULL,
password varchar (64) NOT NULL,	
CONSTRAINT pk_users_userId PRIMARY KEY (userId),
);


CREATE SEQUENCE seq_courseId;

CREATE TABLE courses
(
courseId integer NOT NULL,
name varchar (255) NOT NULL,
capacity integer NOT NULL,
description text NOT NULL,
fee decimal (7,2) NOT NULL,
startDate date NOT NULL,
endDate date NOT NULL,
teacherId integer NOT NULL,	
subject varchar (64) NOT NULL,
CONSTRAINT pk_courses_courseId PRIMARY KEY (courseId),
CONSTRAINT fk_courses_teacherId FOREIGN KEY (teacherId) REFERENCES teachers(teacherId)
);

CREATE SEQUENCE seq_modules;

CREATE TABLE modules
(
moduleId integer NOT NULL,
name varchar (255) NOT NULL,
description text NOT NULL,
courseId integer NOT NULL,	
CONSTRAINT pk_modules_moduleId PRIMARY KEY (moduleId),
CONSTRAINT fk_modules_courseId FOREIGN KEY (courseId) REFERENCES courses(courseId)
);

CREATE SEQUENCE seq_lessons;

CREATE TABLE lessons
(
lessonId integer NOT NULL,
name varchar (255) NOT NULL,
description text NOT NULL,	
moduleId integer NOT NULL,
CONSTRAINT pk_lessons_lessonId PRIMARY KEY (lessonId),
CONSTRAINT fk_lessons_moduleId FOREIGN KEY (moduleId) REFERENCES modules(moduleId)
);

CREATE SEQUENCE seq_assignments;

CREATE TABLE assignments
(
assignmentId integer NOT NULL,
name varchar (255) NOT NULL,
description text NOT NULL,	
assignDate date NOT NULL,
dueDate date NOT NULL,
lessonId integer NOT NULL,
maxScore integer NOT NULL,
CONSTRAINT pk_assignments_assignmentId PRIMARY KEY (assignmentId),
CONSTRAINT fk_assignments_lessonId FOREIGN KEY (lessonId) REFERENCES lessons(lessonId)
);


CREATE TABLE resources
(
resourceId integer NOT NULL,	
url text NOT NULL,
description text NOT NULL,
title varchar (255) NOT NULL,
lessonId integer NOT NULL,	
CONSTRAINT pk_resources_resourceId PRIMARY KEY (resourceId),
CONSTRAINT fk_resources_lessonId FOREIGN KEY (lessonId) REFERENCES lessons(lessonId)
);

CREATE TABLE student_course
(
userId integer NOT NULL,
courseId integer NOT NULL,
CONSTRAINT pk_student_course_userId_courseId PRIMARY KEY (userId, courseId)	
);

CREATE TABLE scores
(
userId integer NOT NULL,
assignmentId integer NOT NULL,
score integer NOT NULL,
CONSTRAINT pk_grades_userId_assignmentId PRIMARY KEY (userId, assignmentId)	
);


COMMIT;