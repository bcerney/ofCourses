-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

-- Teachers 1 thru 4, Team Bravo--
INSERT INTO users (userType, firstName, lastName, email, salt, password) VALUES ('teacher', 'Alex', 'Khrizman', 'khrizman@gmail.com', 'a5ovqz02NeLR963sLDKVQ5DJ79p1x4YRa/RTjtsX6iIukUknFLUg/kehZCklFFkNaLHD8ac5EwJ92rPyfH+91hG+x8+XkRUl9mSLrRrhusJekcL/+OH5jKUL6NanbQcIOJ639+dwlIJSmFhLbayWJpBObt+Ogv76V+SwxH/0fmo=', 'ubwMT/KWFtKP7LCRfI0UZA==');
INSERT INTO users (userType, firstName, lastName, email, salt, password) VALUES ('teacher', 'Kyle', 'Wine', 'wine@gmail.com', 'a5ovqz02NeLR963sLDKVQ5DJ79p1x4YRa/RTjtsX6iIukUknFLUg/kehZCklFFkNaLHD8ac5EwJ92rPyfH+91hG+x8+XkRUl9mSLrRrhusJekcL/+OH5jKUL6NanbQcIOJ639+dwlIJSmFhLbayWJpBObt+Ogv76V+SwxH/0fmo=', 'ubwMT/KWFtKP7LCRfI0UZA==');
INSERT INTO users (userType, firstName, lastName, email, salt, password) VALUES ('teacher', 'Brian', 'Cerney', 'cerney@gmail.com', 'a5ovqz02NeLR963sLDKVQ5DJ79p1x4YRa/RTjtsX6iIukUknFLUg/kehZCklFFkNaLHD8ac5EwJ92rPyfH+91hG+x8+XkRUl9mSLrRrhusJekcL/+OH5jKUL6NanbQcIOJ639+dwlIJSmFhLbayWJpBObt+Ogv76V+SwxH/0fmo=', 'ubwMT/KWFtKP7LCRfI0UZA==');
INSERT INTO users (userType, firstName, lastName, email, salt, password) VALUES ('teacher', 'Eric', 'George', 'george@gmail.com', 'a5ovqz02NeLR963sLDKVQ5DJ79p1x4YRa/RTjtsX6iIukUknFLUg/kehZCklFFkNaLHD8ac5EwJ92rPyfH+91hG+x8+XkRUl9mSLrRrhusJekcL/+OH5jKUL6NanbQcIOJ639+dwlIJSmFhLbayWJpBObt+Ogv76V+SwxH/0fmo=', 'ubwMT/KWFtKP7LCRfI0UZA==');

-- Teachers 5 thru 7 , fake teachers--
INSERT INTO users (userType, firstName, lastName, email, salt, password) VALUES ('teacher', 'Stevie', 'Hawking', 'hawking@gmail.com', 'a5ovqz02NeLR963sLDKVQ5DJ79p1x4YRa/RTjtsX6iIukUknFLUg/kehZCklFFkNaLHD8ac5EwJ92rPyfH+91hG+x8+XkRUl9mSLrRrhusJekcL/+OH5jKUL6NanbQcIOJ639+dwlIJSmFhLbayWJpBObt+Ogv76V+SwxH/0fmo=', 'ubwMT/KWFtKP7LCRfI0UZA==');
INSERT INTO users (userType, firstName, lastName, email, salt, password) VALUES ('teacher', 'Elon', 'Musk', 'musk@gmail.com', 'a5ovqz02NeLR963sLDKVQ5DJ79p1x4YRa/RTjtsX6iIukUknFLUg/kehZCklFFkNaLHD8ac5EwJ92rPyfH+91hG+x8+XkRUl9mSLrRrhusJekcL/+OH5jKUL6NanbQcIOJ639+dwlIJSmFhLbayWJpBObt+Ogv76V+SwxH/0fmo=', 'ubwMT/KWFtKP7LCRfI0UZA==');
INSERT INTO users (userType, firstName, lastName, email, salt, password) VALUES ('teacher', 'Elmer', 'Fudd', 'fudd@gmail.com', 'a5ovqz02NeLR963sLDKVQ5DJ79p1x4YRa/RTjtsX6iIukUknFLUg/kehZCklFFkNaLHD8ac5EwJ92rPyfH+91hG+x8+XkRUl9mSLrRrhusJekcL/+OH5jKUL6NanbQcIOJ639+dwlIJSmFhLbayWJpBObt+Ogv76V+SwxH/0fmo=', 'ubwMT/KWFtKP7LCRfI0UZA==');

-- Students 8 thru 11, Team Bravo --
INSERT INTO users (userType, firstName, lastName, email, salt, password) VALUES ('student', 'Brian', 'Cerney', 'brian@gmail.com', 'a5ovqz02NeLR963sLDKVQ5DJ79p1x4YRa/RTjtsX6iIukUknFLUg/kehZCklFFkNaLHD8ac5EwJ92rPyfH+91hG+x8+XkRUl9mSLrRrhusJekcL/+OH5jKUL6NanbQcIOJ639+dwlIJSmFhLbayWJpBObt+Ogv76V+SwxH/0fmo=', 'ubwMT/KWFtKP7LCRfI0UZA==');
INSERT INTO users (userType, firstName, lastName, email, salt, password) VALUES ('student', 'Eric', 'George', 'eric@gmail.com', 'a5ovqz02NeLR963sLDKVQ5DJ79p1x4YRa/RTjtsX6iIukUknFLUg/kehZCklFFkNaLHD8ac5EwJ92rPyfH+91hG+x8+XkRUl9mSLrRrhusJekcL/+OH5jKUL6NanbQcIOJ639+dwlIJSmFhLbayWJpBObt+Ogv76V+SwxH/0fmo=', 'ubwMT/KWFtKP7LCRfI0UZA==');
INSERT INTO users (userType, firstName, lastName, email, salt, password) VALUES ('student', 'Kyle', 'Wine', 'kyle@gmail.com', 'a5ovqz02NeLR963sLDKVQ5DJ79p1x4YRa/RTjtsX6iIukUknFLUg/kehZCklFFkNaLHD8ac5EwJ92rPyfH+91hG+x8+XkRUl9mSLrRrhusJekcL/+OH5jKUL6NanbQcIOJ639+dwlIJSmFhLbayWJpBObt+Ogv76V+SwxH/0fmo=', 'ubwMT/KWFtKP7LCRfI0UZA==');
INSERT INTO users (userType, firstName, lastName, email, salt, password) VALUES ('student', 'Alex', 'Khrizman', 'alex@gmail.com', 'a5ovqz02NeLR963sLDKVQ5DJ79p1x4YRa/RTjtsX6iIukUknFLUg/kehZCklFFkNaLHD8ac5EwJ92rPyfH+91hG+x8+XkRUl9mSLrRrhusJekcL/+OH5jKUL6NanbQcIOJ639+dwlIJSmFhLbayWJpBObt+Ogv76V+SwxH/0fmo=', 'ubwMT/KWFtKP7LCRfI0UZA==');

-- Students 12 thru 16, fake students --
INSERT INTO users (userType, firstName, lastName, email, salt, password) VALUES ('student', 'Bart', 'Frampton', 'frampton@gmail.com', 'a5ovqz02NeLR963sLDKVQ5DJ79p1x4YRa/RTjtsX6iIukUknFLUg/kehZCklFFkNaLHD8ac5EwJ92rPyfH+91hG+x8+XkRUl9mSLrRrhusJekcL/+OH5jKUL6NanbQcIOJ639+dwlIJSmFhLbayWJpBObt+Ogv76V+SwxH/0fmo=', 'ubwMT/KWFtKP7LCRfI0UZA==');
INSERT INTO users (userType, firstName, lastName, email, salt, password) VALUES ('student', 'Michael', 'Simpson', 'simpson@gmail.com', 'a5ovqz02NeLR963sLDKVQ5DJ79p1x4YRa/RTjtsX6iIukUknFLUg/kehZCklFFkNaLHD8ac5EwJ92rPyfH+91hG+x8+XkRUl9mSLrRrhusJekcL/+OH5jKUL6NanbQcIOJ639+dwlIJSmFhLbayWJpBObt+Ogv76V+SwxH/0fmo=', 'ubwMT/KWFtKP7LCRfI0UZA==');
INSERT INTO users (userType, firstName, lastName, email, salt, password) VALUES ('student', 'Ryan', 'Jackson', 'jackson@gmail.com', 'a5ovqz02NeLR963sLDKVQ5DJ79p1x4YRa/RTjtsX6iIukUknFLUg/kehZCklFFkNaLHD8ac5EwJ92rPyfH+91hG+x8+XkRUl9mSLrRrhusJekcL/+OH5jKUL6NanbQcIOJ639+dwlIJSmFhLbayWJpBObt+Ogv76V+SwxH/0fmo=', 'ubwMT/KWFtKP7LCRfI0UZA==');
INSERT INTO users (userType, firstName, lastName, email, salt, password) VALUES ('student', 'George', 'Gosling', 'gosling@gmail.com', 'a5ovqz02NeLR963sLDKVQ5DJ79p1x4YRa/RTjtsX6iIukUknFLUg/kehZCklFFkNaLHD8ac5EwJ92rPyfH+91hG+x8+XkRUl9mSLrRrhusJekcL/+OH5jKUL6NanbQcIOJ639+dwlIJSmFhLbayWJpBObt+Ogv76V+SwxH/0fmo=', 'ubwMT/KWFtKP7LCRfI0UZA==');
INSERT INTO users (userType, firstName, lastName, email, salt, password) VALUES ('student', 'Peter', 'Bush', 'bush@gmail.com', 'a5ovqz02NeLR963sLDKVQ5DJ79p1x4YRa/RTjtsX6iIukUknFLUg/kehZCklFFkNaLHD8ac5EwJ92rPyfH+91hG+x8+XkRUl9mSLrRrhusJekcL/+OH5jKUL6NanbQcIOJ639+dwlIJSmFhLbayWJpBObt+Ogv76V+SwxH/0fmo=', 'ubwMT/KWFtKP7LCRfI0UZA==');



-- Courses 1 thru 4, Team Bravo Courses --
INSERT INTO courses (name, capacity, fee, startDate, endDate, teacherId, subject, difficulty, description) VALUES ('Quantum Bananas', 30, 99.99, '2017-05-04', '2017-07-10', 4, 'Physics', 'advanced', 'Quantum Bananas integrages the complex nature of quantum theory with typical day-to-day occurances.  The course covers topics ranging from quantum theory and how it relates to grocery shopping, to being able to predict the optimal type of cat litter to use so that even if you were to put your cat in a box, it would survive.  Just like the boson particle, this class will only exist for a short time.  If it were to exist for longer, you wouldn''t know where to find it.');
INSERT INTO courses (name, capacity, fee, startDate, endDate, teacherId, subject, difficulty, description) VALUES ('Wine on Beer', 15, 40.00, '2017-06-01', '2017-06-30', 3, 'Wine Arts', 'beginner', 'Like beer? Want to know more about beer? Want to drink a beer? Then this is the class for you. Learn about beers of the world with Kyle Wine! It’s way better than whatever lame course Eric George is teaching.');
INSERT INTO courses (name, capacity, fee, startDate, endDate, teacherId, subject, difficulty, description) VALUES ('Guitar Acchordingly', 20, 149.95, '2017-04-26', '2017-07-20', 1, 'Music', 'beginner', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nec quam aliquet, imperdiet nisi in, porttitor felis. Morbi finibus velit sed lorem rhoncus porta vel eu turpis. Nunc malesuada erat ut luctus congue. In eu tortor et odio vulputate auctor. Sed in justo porttitor leo imperdiet mollis. Aliquam accumsan, lectus vel imperdiet lobortis, sem nisl sodales ligula, ac varius erat neque vulputate massa. Duis sit amet magna sed felis imperdiet convallis.');
INSERT INTO courses (name, capacity, fee, startDate, endDate, teacherId, subject, difficulty, description) VALUES ('Photography for Mummies', 15, 25.00, '2017-06-01', '2017-06-30', 2, 'Time Wasting', 'intermediate', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed mi elit, consequat non pulvinar a, porttitor et ipsum. Proin ultricies non tortor non condimentum. Donec porta felis eget tellus consectetur pellentesque. Nulla ullamcorper, justo eget congue facilisis, purus quam elementum elit, eget luctus sapien mauris quis tellus. Aliquam vel eros sed enim commodo congue et et diam. Aliquam mattis, massa eu interdum faucibus, nibh felis pulvinar risus, id iaculis urna orci sit amet sem. Vestibulum pellentesque felis tellus, ac tempor lorem lacinia vel. Vestibulum eget orci nunc. Sed eget dolor ac eros sagittis condimentum nec non orci. Duis ultricies lectus vel neque tincidunt ornare. Integer venenatis viverra justo, ut hendrerit mauris tincidunt sit amet. Nunc hendrerit lectus eget est tempor finibus. Donec convallis, eros congue convallis congue, lorem tortor tristique dui, et semper nisi velit ut ipsum. Suspendisse aliquam magna nec faucibus sollicitudin. Cras metus lacus, bibendum at dui eu, mattis blandit diam.');

-- Courses 5 thru 7 fake courses--
INSERT INTO courses (name, capacity, fee, startDate, endDate, teacherId, subject, difficulty, description) VALUES ('Why Black Holes Suck', 50, 0, '2017-08-14', '2018-08-15', 5, 'Science', 'advanced', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eleifend sodales ullamcorper. Phasellus blandit elit eget congue tincidunt. Donec vitae nisi imperdiet, dictum risus interdum, convallis lorem. Phasellus efficitur sit amet tellus vitae aliquam. Duis malesuada leo ac massa suscipit sodales. Nulla ut rutrum tortor. Nulla ligula ipsum, porta quis tempus ut, laoreet et tortor. Maecenas a erat nulla. Morbi porttitor, justo porta sodales accumsan, urna risus vulputate elit, nec blandit tellus felis eget dui. Donec iaculis diam a nulla convallis, a bibendum felis finibus. Nunc finibus suscipit tortor sit amet vestibulum. Quisque fringilla in enim sit amet interdum. Nullam viverra tincidunt augue, eget sollicitudin ipsum gravida eu. Quisque ac massa arcu.');
INSERT INTO courses (name, capacity, fee, startDate, endDate, teacherId, subject, difficulty, description) VALUES ('How to Shock People with Your Tesla', 20, 60, '2017-05-14', '2017-07-14', 6, 'Engineering', 'intermediate', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam rutrum nulla in odio rutrum, ut interdum lacus suscipit. Fusce et lorem eget lacus finibus rhoncus. Pellentesque mattis justo a sapien tincidunt tincidunt. Mauris a nisl sollicitudin, accumsan enim non, vestibulum lacus. Vestibulum quis tempus dui, sit amet dapibus enim. Aenean quis ligula suscipit est laoreet sollicitudin. Donec varius felis eget tortor ultrices lacinia. Suspendisse consectetur, metus ut tempor varius, ante magna consectetur quam, eget accumsan velit mauris ut nisl. Donec dapibus metus nulla, vitae molestie tellus dignissim at. Integer ullamcorper faucibus mollis.');
INSERT INTO courses (name, capacity, fee, startDate, endDate, teacherId, subject, difficulty, description) VALUES ('Killing Wabbits', 10, 0, '2017-06-14', '2017-08-15', 7, 'Athletics', 'beginner', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eleifend sodales ullamcorper. Phasellus blandit elit eget congue tincidunt. Donec vitae nisi imperdiet, dictum risus interdum, convallis lorem. Phasellus efficitur sit amet tellus vitae aliquam. Duis malesuada leo ac massa suscipit sodales. Nulla ut rutrum tortor. Nulla ligula ipsum, porta quis tempus ut, laoreet et tortor. Maecenas a erat nulla. Morbi porttitor, justo porta sodales accumsan, urna risus vulputate elit, nec blandit tellus felis eget dui. Donec iaculis diam a nulla convallis, a bibendum felis finibus. Nunc finibus suscipit tortor sit amet vestibulum. Quisque fringilla in enim sit amet interdum. Nullam viverra tincidunt augue, eget sollicitudin ipsum gravida eu. Quisque ac massa arcu.');

-- Courses 8 thru 11 Team Bravo Courses--
INSERT INTO courses (name, capacity, fee, startDate, endDate, teacherId, subject, difficulty, description) VALUES ('The Key to Great Piano', 20, 249.95, '2017-07-26', '2017-10-20', 1, 'Music', 'advanced', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nec quam aliquet, imperdiet nisi in, porttitor felis. Morbi finibus velit sed lorem rhoncus porta vel eu turpis. Nunc malesuada erat ut luctus congue. In eu tortor et odio vulputate auctor. Sed in justo porttitor leo imperdiet mollis. Aliquam accumsan, lectus vel imperdiet lobortis, sem nisl sodales ligula, ac varius erat neque vulputate massa. Duis sit amet magna sed felis imperdiet convallis.');
INSERT INTO courses (name, capacity, fee, startDate, endDate, teacherId, subject, difficulty, description) VALUES ('Photography for Mommies', 15, 110.00, '2017-05-01', '2017-05-30', 2, 'Time Wasting', 'beginner', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed mi elit, consequat non pulvinar a, porttitor et ipsum. Proin ultricies non tortor non condimentum. Donec porta felis eget tellus consectetur pellentesque. Nulla ullamcorper, justo eget congue facilisis, purus quam elementum elit, eget luctus sapien mauris quis tellus. Aliquam vel eros sed enim commodo congue et et diam. Aliquam mattis, massa eu interdum faucibus, nibh felis pulvinar risus, id iaculis urna orci sit amet sem. Vestibulum pellentesque felis tellus, ac tempor lorem lacinia vel. Vestibulum eget orci nunc. Sed eget dolor ac eros sagittis condimentum nec non orci. Duis ultricies lectus vel neque tincidunt ornare. Integer venenatis viverra justo, ut hendrerit mauris tincidunt sit amet. Nunc hendrerit lectus eget est tempor finibus. Donec convallis, eros congue convallis congue, lorem tortor tristique dui, et semper nisi velit ut ipsum. Suspendisse aliquam magna nec faucibus sollicitudin. Cras metus lacus, bibendum at dui eu, mattis blandit diam.');
INSERT INTO courses (name, capacity, fee, startDate, endDate, teacherId, subject, difficulty, description) VALUES ('Wine on Liquor', 15, 90.00, '2017-05-01', '2017-05-30', 3, 'Wine Arts', 'intermediate', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed mi elit, consequat non pulvinar a, porttitor et ipsum. Proin ultricies non tortor non condimentum. Donec porta felis eget tellus consectetur pellentesque. Nulla ullamcorper, justo eget congue facilisis, purus quam elementum elit, eget luctus sapien mauris quis tellus. Aliquam vel eros sed enim commodo congue et et diam. Aliquam mattis, massa eu interdum faucibus, nibh felis pulvinar risus, id iaculis urna orci sit amet sem. Vestibulum pellentesque felis tellus, ac tempor lorem lacinia vel. Vestibulum eget orci nunc. Sed eget dolor ac eros sagittis condimentum nec non orci. Duis ultricies lectus vel neque tincidunt ornare. Integer venenatis viverra justo, ut hendrerit mauris tincidunt sit amet. Nunc hendrerit lectus eget est tempor finibus. Donec convallis, eros congue convallis congue, lorem tortor tristique dui, et semper nisi velit ut ipsum. Suspendisse aliquam magna nec faucibus sollicitudin. Cras metus lacus, bibendum at dui eu, mattis blandit diam.');
INSERT INTO courses (name, capacity, fee, startDate, endDate, teacherId, subject, difficulty, description) VALUES ('Radioactive Bananas', 30, 149.99, '2017-07-04', '2017-08-10', 4, 'Physics', 'advanced', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sollicitudin ante non accumsan tincidunt. Integer scelerisque sagittis enim, fermentum congue purus egestas a. In hac habitasse platea dictumst. Proin pharetra est neque, eu faucibus arcu euismod eget. Nulla tincidunt, diam id vehicula interdum, quam lacus molestie tellus, sed tempus nibh nulla at velit. Sed facilisis turpis quis metus pellentesque, a laoreet odio ullamcorper. Pellentesque fermentum lectus nec mauris gravida mattis vel ut nibh. Proin porttitor nisi metus. Nunc blandit felis pretium, interdum mi eget, tempor ex. Donec velit neque, pellentesque sit amet interdum a, interdum vitae elit. Fusce vel leo ullamcorper, volutpat mauris eleifend, rutrum lacus.');



-- Course 1 students --
INSERT INTO student_course (studentId, courseId) VALUES (8,1);
INSERT INTO student_course (studentId, courseId) VALUES (9,1);
INSERT INTO student_course (studentId, courseId) VALUES (10,1);
INSERT INTO student_course (studentId, courseId) VALUES (11,1);
INSERT INTO student_course (studentId, courseId) VALUES (12,1);
INSERT INTO student_course (studentId, courseId) VALUES (13,1);
INSERT INTO student_course (studentId, courseId) VALUES (14,1);
INSERT INTO student_course (studentId, courseId) VALUES (15,1);
INSERT INTO student_course (studentId, courseId) VALUES (16,1);

-- Course 2 students --
INSERT INTO student_course (studentId, courseId) VALUES (8,2);
INSERT INTO student_course (studentId, courseId) VALUES (9,2);
INSERT INTO student_course (studentId, courseId) VALUES (10,2);
INSERT INTO student_course (studentId, courseId) VALUES (11,2);
INSERT INTO student_course (studentId, courseId) VALUES (12,2);
INSERT INTO student_course (studentId, courseId) VALUES (13,2);
INSERT INTO student_course (studentId, courseId) VALUES (14,2);
INSERT INTO student_course (studentId, courseId) VALUES (15,2);
INSERT INTO student_course (studentId, courseId) VALUES (16,2);



-- Course 1, modules 1 thru 3 --
INSERT INTO modules (name, courseId, description) VALUES ('Randomness in Every Day Life', 1, 'Have you ever wondered why things happen the way they do, and in the order that they do.  Have you ever wondered "what if it happened a different way?"  This module explores the various randomness that occurs in our every day lives and how much control we "actually" have over them.');
INSERT INTO modules (name, courseId, description) VALUES ('Quantum Theory Basics', 1, 'First, we need to get the fundamentals down.  This modules covers the basics of quantum theory, and proves that all occurances can be modeled with mathematical equations.');
INSERT INTO modules (name, courseId, description) VALUES ('Alternate Dimensions and Our World', 1, 'We live in the dimension we all know and see. But in reality, the universe is so vast that there are an infinate number of dimensions that exist, and on different timelines.  Some dimensions are actually in a completely different age of our universe.  This is where time-travel comes into play, but we haven''t quite figured out how to traverse dimensions, or have we?');

-- Course 2, modules 4 thru 6 --
INSERT INTO modules (name, courseId, description) VALUES ('Intro To Beer', 2, 'An absolutely riveting foray into the world of beer. Learn about its history, how it''s made, and the people who drink it');
INSERT INTO modules (name, courseId, description) VALUES ('Advanced Beer', 2, 'Now that you know the basics it’s time to go even deeper into beer.');
INSERT INTO modules (name, courseId, description) VALUES ('Beer Mastery', 2, 'The end is in sight. You are almost a beer master.');


-- Course 3, modules 7 thru 13 --
INSERT INTO modules (name, courseId, description) VALUES ('Why Play Guitar', 3, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Selecting a Guitar', 3, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Basic Chords', 3, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Basic Finger Picking', 3, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Reading Tabliture', 3, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Writing Tabliture', 3, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Your First Song', 3, 'Coming Soon!!!');

-- Course 4, modules 14 thru 20 --
INSERT INTO modules (name, courseId, description) VALUES ('It IS art!!!', 4, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Even Mummies Can Shoot', 4, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Choosing the Rich Camera', 4, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Moving Away from Auto', 4, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Getting the Shot', 4, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Building your Portfolio', 4, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Do''s and Dont''s', 4, 'Coming Soon!!!');

-- Course 5, modules 21 thru 27 --
INSERT INTO modules (name, courseId, description) VALUES ('Black Holes: Why We Care', 5, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Basic Astronomical Principles', 5, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Universe Hopping', 5, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Time Travel', 5, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Mathematical Complexities', 5, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('The Multiverse Principle', 5, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Current Research', 5, 'Coming Soon!!!');

-- Course 6, modules 28 thru 34 --
INSERT INTO modules (name, courseId, description) VALUES ('Why Go Electric?', 6, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Choosing your Ride', 6, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('An Ohm-mazing Choice', 6, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('The Actual "Smart Car"', 6, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('It Drives You', 6, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('The Wow Effect', 6, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Upgrading', 6, 'Coming Soon!!!');

-- Course 7, modules 35 thru 41 --
INSERT INTO modules (name, courseId, description) VALUES ('Why Hunt Small Game?', 7, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Right Prey, Right Gun', 7, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Don''t Fur-get the Essentials', 7, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Friendly Fire', 7, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Wabbit Season', 7, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Skinning your Catch', 7, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('The Best Meal Ever', 7, 'Coming Soon!!!');

-- Course 7, modules 35 thru 41 --
INSERT INTO modules (name, courseId, description) VALUES ('Why Hunt Small Game?', 7, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Right Prey, Right Gun', 7, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Don''t Fur-get the Essentials', 7, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Friendly Fire', 7, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Wabbit Season', 7, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('Skinning your Catch', 7, 'Coming Soon!!!');
INSERT INTO modules (name, courseId, description) VALUES ('The Best Meal Ever', 7, 'Coming Soon!!!');



-- Course 1, Module 1, lessons 1-3
INSERT INTO lessons (name, moduleId, description) VALUES ('Randomness', 1, 'What is randomness? The lesson shows you how to determine if a process is random in nature, or predetermined.  It is key in understanding the more complex ideas behind quantum theory.');
INSERT INTO lessons (name, moduleId, description) VALUES ('Mathematics of Radomness', 1, 'This lesson delves into the mathematics behind random behavior. Understanding of partial differential equations is suggested. Not for the faint of math.');
INSERT INTO lessons (name, moduleId, description) VALUES ('Brownian Motion', 1, 'It''s happening all around us, every day. If you''re ever seen dust particles floating around in a sun-light room, you''ve witnessed Brownian motion.  Here''s what really going on.');
-- Course 1, Module 2, lessons 4-7
INSERT INTO lessons (name, moduleId, description) VALUES ('Theory of Relativity: Not Just for Space Travel.', 2, 'Einstein never actually had space travel in mind, especially considering there wasn''t yet a space program when he descovered his famous equation. Einstein''s unifying theory actually explains the science behind matter.');
INSERT INTO lessons (name, moduleId, description) VALUES ('Mathemagic', 2, 'This lesson mathematically explains the theory of relativity.');
INSERT INTO lessons (name, moduleId, description) VALUES ('We are particles!', 2, 'Everying can be treated as a particle or collection of particles. Even you. This lesson describes how to change our view of objects to much more complicated arrangements of highly simple, predictable particles.');
INSERT INTO lessons (name, moduleId, description) VALUES ('String Theory', 2, 'Learn about the latest craze in the phsyics community. But, it''s really only another way of explain particles. Learn the benefits and disadvantages of treating particles as waves (or strings).');
-- Course 1, Module 3, lessons 8-10
INSERT INTO lessons (name, moduleId, description) VALUES ('Multiple Dimensions', 3, 'Have you ever wondered if there is another you somewhere out there.  Well, there probaly is, and not just one, but quite possibly an infinite number of yous.  This lessons explains how every action creates a new dimension.');
INSERT INTO lessons (name, moduleId, description) VALUES ('Time Travel', 3, 'This lesson describes a simplified view of time travel, and shows how time travel can only move forward in time, at least with modern quantum physical laws.');
INSERT INTO lessons (name, moduleId, description) VALUES ('Subatomic Travel', 3, 'Remember that last lesson?  Well, those rules don''t actually apply to particles! In a way, we will show how particles can actually travel back in time, under the right conditions.');

-- Course 2, Module 4, lessons 11-13
INSERT INTO lessons (name, moduleId, description) VALUES ('History of Beer', 4, 'Follow the History of beer. From the ancient Egyptians all the way to modern times.');
INSERT INTO lessons (name, moduleId, description) VALUES ('Beer Etiquette', 4, 'Did you know it’s considered rude to drink a Budweiser on the third Saturday of the month in the state of Mississippi? It’s a fact! Find out about this and numerous other beer rules.');
INSERT INTO lessons (name, moduleId, description) VALUES ('Making Beer', 4, 'Now it’s time to actually make beer! Grab your barley, hops, and water, it’s time to make beer!');

-- Course 2, Module 5, lessons 14-16
INSERT INTO lessons (name, moduleId, description) VALUES ('Rare Beers', 5, 'Some beers demand attention because of their scarcity.');
INSERT INTO lessons (name, moduleId, description) VALUES ('Buying Beer', 5, 'More than just a normal transaction. Buying beer is one of the most important financial decisions you ever make. Make it wisely!');
INSERT INTO lessons (name, moduleId, description) VALUES ('Opening a beer', 5, 'You don’t just have to use a bottle opener. There are plenty of creative ways to open a beer bottle.');
-- Course 2, Module 6, lessons 17-19
INSERT INTO lessons (name, moduleId, description) VALUES ('Beer Tricks', 6, 'Ready to impress your friends with some amazing and dangerous beer stunts? Then sign this waiver and come with me!');
INSERT INTO lessons (name, moduleId, description) VALUES ('Beer Legends', 6, 'Did you know Wade Boggs once drank 107 beers on a cross country flight? Let''s learn about him and other legends of the world of beer.');
INSERT INTO lessons (name, moduleId, description) VALUES ('Hold my Beer', 6, 'Let’s review everything we’ve learned so far and then have a beer.');



-- Course 1, Module 1, Lesson 1, resources 1-2
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=tClZGWlRLoE', 1, 'YoutubeDescription');
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=vSxU0_wNXJY', 1, 'YoutubeDescription');
-- Course 1, Module 1, Lesson 2, resource 3
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=Xo-m9xw6eSo', 2, 'YoutubeDescription');
-- Course 1, Module 1, Lesson 3, resources 4-6
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=7mmeksMiXp4', 3, 'YoutubeDescription');
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=sIKD1tQryHg', 3, 'YoutubeDescription');
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=rvYfNz2H3Uk', 3, 'YoutubeDescription');

-- Course 1, Module 2, Lesson 4, resource 7
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=ev9zrt__lec', 4, 'YoutubeDescription');
-- Course 1, Module 2, Lesson 5, resources 8-9
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=hW7DW9NIO9M', 5, 'YoutubeDescription');
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=A5IlKfdbjAk', 5, 'YoutubeDescription');
-- Course 1, Module 2, Lesson 6, resources 10-11
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=eD7hXLRqWWM', 6, 'YoutubeDescription');
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=X5Fel1VKEN8', 6, 'YoutubeDescription');
-- Course 1, Module 2, Lesson 7, resources 12-13
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=kYAdwS5MFjQ', 7, 'YoutubeDescription');
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=eGxPGgPdTVw', 7, 'YoutubeDescription');

-- Course 1, Module 1, Lesson 8, resources 14-15
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=tClZGWlRLoE', 8, 'YoutubeDescription');
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=vSxU0_wNXJY', 8, 'YoutubeDescription');
-- Course 1, Module 1, Lesson 9, resources 16-17
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=tClZGWlRLoE', 9, 'YoutubeDescription');
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=vSxU0_wNXJY', 9, 'YoutubeDescription');
-- Course 1, Module 1, Lesson 10, resource 18
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=7mmeksMiXp4', 10, 'YoutubeDescription');


-- Course 2, Module 4, Lesson 11, resources 19-20
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=WT-FT5HDPNo', 11, 'YoutubeDescription');
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=6n-qie51FVA', 11, 'YoutubeDescription');
-- Course 2, Module 4, Lesson 12, resources 21-22
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=Mb3h7Q3YkoM', 12, 'YoutubeDescription');
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=pVcbasIb8lQ', 12, 'YoutubeDescription');
-- Course 2, Module 4, Lesson 13, resources 23-24
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=VPKXAToDr-M', 13, 'YoutubeDescription');
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=M9X6wn7yyy8', 13, 'YoutubeDescription');

-- Course 2, Module 5, Lesson 14, resources 25-26
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=Ow-WGOgKR24', 14, 'YoutubeDescription');
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=fpJnhI1hhME', 14, 'YoutubeDescription');
-- Course 2, Module 5, Lesson 15, resources 27-28
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=1yHsoW6CTjM', 15, 'YoutubeDescription');
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=f9coeReh1-w', 15, 'YoutubeDescription');
-- Course 2, Module 5, Lesson 16, resources 29-30
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=ShI1jj8Dc-w', 16, 'YoutubeDescription');
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=JEbmqw1w9Vs', 16, 'YoutubeDescription');

-- Course 2, Module 6, Lesson 17, resources 31-32
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=XRpvab3kdOc', 17, 'YoutubeDescription');
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=Uu0xL8M_BBI', 17, 'YoutubeDescription');
-- Course 2, Module 6, Lesson 18, resources 33-34
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=75Gx8OmO9Rk', 18, 'YoutubeDescription');
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=ptrmW51ed58', 18, 'YoutubeDescription');
-- Course 2, Module 6, Lesson 19, resources 35-36
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=PM_X-2Y6OZo', 19, 'YoutubeDescription');
INSERT INTO resources (title, url, lessonId, description) VALUES ('YoutubeTitle', 'https://www.youtube.com/watch?v=oBxPXXVljLo', 19, 'YoutubeDescription');




-- Course 1, Module 1, Lesson 1, assignment 1
INSERT INTO assignments (name, assignDate, dueDate, maxScore, lessonId, description) VALUES ('Randomness Experience', '2017-04-27', '2017-04-29', 50, 1, 'Give one random occurence that occured in your life and explain whether it was truly random or not.');
-- Course 1, Module 1, Lesson 2, assignments 2-3
INSERT INTO assignments (name, assignDate, dueDate, maxScore, lessonId, description) VALUES ('Current Random Event', '2017-04-28', '2017-04-30', 50, 2, 'Find one current event (in the last 2 weeks) and quantify the level of randomness.  Use appropriate scaling.');
INSERT INTO assignments (name, assignDate, dueDate, maxScore, lessonId, description) VALUES ('Dice Roll', '2017-04-28', '2017-04-30', 50, 2, 'Quantify the level of randomness in 3 six-sided dice rolls, if rolled in two different locations by two different people.  Use appropriate scaling.');
-- Course 1, Module 1, Lesson 3, assignments 4
INSERT INTO assignments (name, assignDate, dueDate, maxScore, lessonId, description) VALUES ('Brownian Example', '2017-05-01', '2017-05-03', 50, 3, 'Describe traffic patterns using the parameters of Brownian motion. Include multiple different sequences, and directional vectors.');

-- Course 1, Module 2, Lesson 4, NO ASSIGNMENTS
-- Course 1, Module 2, Lesson 5, assignment 5
INSERT INTO assignments (name, assignDate, dueDate, maxScore, lessonId, description) VALUES ('Relative Misconceptions', '2017-05-01', '2017-05-03', 50, 5, 'Explain the 3 most common misconceptions of the Theory of Relativity.');
-- Course 1, Module 2, Lesson 6, assignment 6
INSERT INTO assignments (name, assignDate, dueDate, maxScore, lessonId, description) VALUES ('Particle Interaction', '2017-05-02', '2017-05-04', 50, 6, 'Explain the conditions under which fast particles interact.');
-- Course 1, Module 2, Lesson 7, assignment 7
INSERT INTO assignments (name, assignDate, dueDate, maxScore, lessonId, description) VALUES ('Strings versus Particles', '2017-05-03', '2017-05-05', 50, 7, 'Compare and contrast String Thoery versus traditional particle theory. Reference current research.');

-- Course 1, Module 3, Lesson 8, assignment 8
INSERT INTO assignments (name, assignDate, dueDate, maxScore, lessonId, description) VALUES ('Dimensional Analysis', '2017-05-07', '2017-05-09', 50, 8, 'Describe the 4th dimension and it''s relationship with the first three. Create a thought experiment where at least 3 alternate dimensions simultaneously exist.');
-- Course 1, Module 3, Lesson 9, assignment 9
INSERT INTO assignments (name, assignDate, dueDate, maxScore, lessonId, description) VALUES ('Travel Time', '2017-05-09', '2017-05-11', 50, 9, 'Explain why time travel, as we understand it, cannot occur in the negative direction.');
-- Course 1, Module 3, Lesson 10, assignment 10
INSERT INTO assignments (name, assignDate, dueDate, maxScore, lessonId, description) VALUES ('Subatomic Particles Behavior', '2017-05-11', '2017-05-13', 50, 10, 'Explain why particles can appear to travel in time. Your response should include concepts from relativity.');


-- Course 2, Module 4, Lesson 11, assignment 11
INSERT INTO assignments (name, assignDate, dueDate, maxScore, lessonId, description) VALUES ('Drink a beer!', '2017-04-27', '2017-04-29', 50, 11, 'Please write a one page essay on the beer you just drank.');
-- Course 2, Module 4, Lesson 12, assignment 12
INSERT INTO assignments (name, assignDate, dueDate, maxScore, lessonId, description) VALUES ('Make a Beer Rule', '2017-04-30', '2017-05-01', 50, 12, 'Come up with your own arbitrary beer rule. ');
-- Course 2, Module 4, Lesson 13, assignment 13
INSERT INTO assignments (name, assignDate, dueDate, maxScore, lessonId, description) VALUES ('Make a beer.', '2017-05-01', '2017-05-03', 50, 13, 'Make some beer. Then write a one page paper on the experience.');

-- Course 2, Module 5, Lesson 14, assignment 14
INSERT INTO assignments (name, assignDate, dueDate, maxScore, lessonId, description) VALUES ('Rare Beer Experience', '2017-05-01', '2017-05-03', 50, 14, 'Camp out overnight waiting for the next big beer release. Write about the experience.');
-- Course 2, Module 5, Lesson 15, assignment 15
INSERT INTO assignments (name, assignDate, dueDate, maxScore, lessonId, description) VALUES ('Buy Some Beer', '2017-05-02', '2017-05-04', 50, 15, 'Head over to the store and buy some beer. Now write about the experience. How much did it cost? What did you buy? Did you enjoy the experience?');
-- Course 2, Module 5, Lesson 16, assignment 16
INSERT INTO assignments (name, assignDate, dueDate, maxScore, lessonId, description) VALUES ('Open a beer.', '2017-05-03', '2017-05-05', 50, 16, 'Find a creative new way to open a beer bottle.');

-- Course 2, Module 6, Lesson 17, assignment 17
INSERT INTO assignments (name, assignDate, dueDate, maxScore, lessonId, description) VALUES ('Create your own beer stunt', '2017-05-07', '2017-05-09', 50, 17, 'Create a step by step guide for your own death defying beer stunt. ');
-- Course 2, Module 6, Lesson 18, assignment 18
INSERT INTO assignments (name, assignDate, dueDate, maxScore, lessonId, description) VALUES ('Who is your beer hero?', '2017-05-09', '2017-05-11', 50, 18, 'Write about your beer hero. Who is this person? What characteristics make them your hero?');
-- Course 2, Module 6, Lesson 19, assignment 19
INSERT INTO assignments (name, assignDate, dueDate, maxScore, lessonId, description) VALUES ('Drink a beer', '2017-05-11', '2017-05-13', 50, 19, 'Don’t write anything, just enjoy a beer. You earned it!');



-- Course 1 Student Assignments
INSERT INTO student_assignment (studentId, assignmentId) VALUES (8, 1);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (8, 2);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (8, 3);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (8, 4);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (8, 5);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (8, 6);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (8, 7);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (8, 8);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (8, 9);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (8, 10);

INSERT INTO student_assignment (studentId, assignmentId) VALUES (9, 1);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (9, 2);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (9, 3);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (9, 4);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (9, 5);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (9, 6);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (9, 7);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (9, 8);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (9, 9);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (9, 10);

INSERT INTO student_assignment (studentId, assignmentId) VALUES (10, 1);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (10, 2);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (10, 3);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (10, 4);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (10, 5);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (10, 6);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (10, 7);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (10, 8);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (10, 9);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (10, 10);

INSERT INTO student_assignment (studentId, assignmentId) VALUES (11, 1);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (11, 2);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (11, 3);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (11, 4);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (11, 5);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (11, 6);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (11, 7);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (11, 8);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (11, 9);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (11, 10);

INSERT INTO student_assignment (studentId, assignmentId) VALUES (12, 1);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (12, 2);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (12, 3);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (12, 4);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (12, 5);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (12, 6);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (12, 7);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (12, 8);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (12, 9);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (12, 10);

INSERT INTO student_assignment (studentId, assignmentId) VALUES (13, 1);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (13, 2);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (13, 3);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (13, 4);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (13, 5);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (13, 6);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (13, 7);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (13, 8);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (13, 9);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (13, 10);

INSERT INTO student_assignment (studentId, assignmentId) VALUES (14, 1);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (14, 2);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (14, 3);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (14, 4);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (14, 5);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (14, 6);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (14, 7);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (14, 8);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (14, 9);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (14, 10);

INSERT INTO student_assignment (studentId, assignmentId) VALUES (15, 1);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (15, 2);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (15, 3);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (15, 4);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (15, 5);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (15, 6);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (15, 7);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (15, 8);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (15, 9);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (15, 10);

INSERT INTO student_assignment (studentId, assignmentId) VALUES (16, 1);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (16, 2);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (16, 3);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (16, 4);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (16, 5);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (16, 6);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (16, 7);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (16, 8);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (16, 9);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (16, 10);

-- Course 2 Student Assignments
INSERT INTO student_assignment (studentId, assignmentId) VALUES (8, 11);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (8, 12);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (8, 13);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (8, 14);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (8, 15);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (8, 16);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (8, 17);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (8, 18);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (8, 19);

INSERT INTO student_assignment (studentId, assignmentId) VALUES (9, 11);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (9, 12);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (9, 13);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (9, 14);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (9, 15);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (9, 16);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (9, 17);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (9, 18);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (9, 19);

INSERT INTO student_assignment (studentId, assignmentId) VALUES (10, 11);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (10, 12);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (10, 13);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (10, 14);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (10, 15);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (10, 16);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (10, 17);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (10, 18);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (10, 19);

INSERT INTO student_assignment (studentId, assignmentId) VALUES (11, 11);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (11, 12);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (11, 13);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (11, 14);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (11, 15);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (11, 16);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (11, 17);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (11, 18);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (11, 19);

INSERT INTO student_assignment (studentId, assignmentId) VALUES (12, 11);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (12, 12);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (12, 13);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (12, 14);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (12, 15);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (12, 16);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (12, 17);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (12, 18);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (12, 19);

INSERT INTO student_assignment (studentId, assignmentId) VALUES (13, 11);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (13, 12);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (13, 13);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (13, 14);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (13, 15);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (13, 16);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (13, 17);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (13, 18);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (13, 19);

INSERT INTO student_assignment (studentId, assignmentId) VALUES (14, 11);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (14, 12);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (14, 13);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (14, 14);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (14, 15);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (14, 16);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (14, 17);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (14, 18);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (14, 19);

INSERT INTO student_assignment (studentId, assignmentId) VALUES (15, 11);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (15, 12);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (15, 13);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (15, 14);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (15, 15);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (15, 16);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (15, 17);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (15, 18);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (15, 19);

INSERT INTO student_assignment (studentId, assignmentId) VALUES (16, 11);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (16, 12);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (16, 13);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (16, 14);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (16, 15);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (16, 16);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (16, 17);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (16, 18);
INSERT INTO student_assignment (studentId, assignmentId) VALUES (16, 19);

COMMIT;