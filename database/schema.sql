-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
CREATE SEQUENCE seq_userId;

CREATE TABLE users
(
userId integer DEFAULT NEXTVAL('seq_userId'),
userType varchar (32) NOT NULL,
firstName varchar (64) NOT NULL,
lastName varchar (64) NOT NULL,
email varchar (128) NOT NULL,
salt varchar (255) NOT NULL,
password varchar (64) NOT NULL,
CONSTRAINT pk_users_userId PRIMARY KEY (userId)
);


CREATE SEQUENCE seq_courseId;

CREATE TABLE courses
(
courseId integer DEFAULT NEXTVAL('seq_courseId'),
name varchar (255) NOT NULL,
capacity integer NOT NULL,
description text NOT NULL,
fee decimal (7,2) NOT NULL,
startDate date NOT NULL,
endDate date NOT NULL,
teacherId integer NOT NULL,	
subject varchar (64) NOT NULL,
difficulty varchar (16) NOT NULL,
CONSTRAINT pk_courses_courseId PRIMARY KEY (courseId),
CONSTRAINT fk_courses_teacherId FOREIGN KEY (teacherId) REFERENCES users(userId)
);

CREATE SEQUENCE seq_moduleId;

CREATE TABLE modules
(
moduleId integer DEFAULT NEXTVAL('seq_moduleId'),
name varchar (255) NOT NULL,
description text NOT NULL,
courseId integer NOT NULL,	
CONSTRAINT pk_modules_moduleId PRIMARY KEY (moduleId),
CONSTRAINT fk_modules_courseId FOREIGN KEY (courseId) REFERENCES courses(courseId)
);

CREATE SEQUENCE seq_lessonId;

CREATE TABLE lessons
(
lessonId integer DEFAULT NEXTVAL('seq_lessonId'),
name varchar (255) NOT NULL,
description text NOT NULL,	
moduleId integer NOT NULL,
CONSTRAINT pk_lessons_lessonId PRIMARY KEY (lessonId),
CONSTRAINT fk_lessons_moduleId FOREIGN KEY (moduleId) REFERENCES modules(moduleId)
);

CREATE SEQUENCE seq_assignmentId;

CREATE TABLE assignments
(
assignmentId integer DEFAULT NEXTVAL('seq_assignmentId'),
name varchar (255) NOT NULL,
description text NOT NULL,	
assignDate date NOT NULL,
dueDate date NOT NULL,
lessonId integer NOT NULL,
maxScore integer NOT NULL,
CONSTRAINT pk_assignments_assignmentId PRIMARY KEY (assignmentId),
CONSTRAINT fk_assignments_lessonId FOREIGN KEY (lessonId) REFERENCES lessons(lessonId)
);

CREATE SEQUENCE seq_resourceId;

CREATE TABLE resources
(
resourceId integer DEFAULT NEXTVAL('seq_resourceId'),
url text NOT NULL,
description text NOT NULL,
title varchar (255) NOT NULL,
lessonId integer NOT NULL,	
CONSTRAINT pk_resources_resourceId PRIMARY KEY (resourceId),
CONSTRAINT fk_resources_lessonId FOREIGN KEY (lessonId) REFERENCES lessons(lessonId)
);

CREATE TABLE student_course
(
studentId integer NOT NULL,
courseId integer NOT NULL,
CONSTRAINT pk_student_course_studentId_courseId PRIMARY KEY (studentId, courseId),
CONSTRAINT fk_student_course_studentId FOREIGN KEY (studentId) REFERENCES users(userId),
CONSTRAINT fk_student_course_courseId FOREIGN KEY (courseId) REFERENCES courses(courseId)
);

CREATE TABLE scores
(
studentId integer NOT NULL,
assignmentId integer NOT NULL,
score integer NOT NULL,
CONSTRAINT pk_grades_studentId_assignmentId PRIMARY KEY (studentId, assignmentId),
CONSTRAINT fk_scores_studentId FOREIGN KEY (studentId) REFERENCES users(userId),
CONSTRAINT fk_scores_assignmentId FOREIGN KEY (assignmentId) REFERENCES assignments(assignmentId)
);

COMMIT;