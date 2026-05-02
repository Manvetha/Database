-- Insert Courses (if not exists)
INSERT IGNORE INTO course (id, course_name) VALUES (1, 'Computer Science 101');
INSERT IGNORE INTO course (id, course_name) VALUES (2, 'Introduction to Data Structures');
INSERT IGNORE INTO course (id, course_name) VALUES (3, 'Database Management Systems');
INSERT IGNORE INTO course (id, course_name) VALUES (4, 'Web Development Basics');
INSERT IGNORE INTO course (id, course_name) VALUES (5, 'Advanced Java Programming');
INSERT IGNORE INTO course (id, course_name) VALUES (6, 'Machine Learning Fundamentals');
INSERT IGNORE INTO course (id, course_name) VALUES (7, 'Operating Systems');
INSERT IGNORE INTO course (id, course_name) VALUES (8, 'Software Engineering');
INSERT IGNORE INTO course (id, course_name) VALUES (9, 'Computer Networks');
INSERT IGNORE INTO course (id, course_name) VALUES (10, 'Artificial Intelligence');

-- Insert Students (if not exists)
INSERT IGNORE INTO student (id, name, email, course_id) VALUES (1, 'Alice Smith', 'alice@example.com', 1);
INSERT IGNORE INTO student (id, name, email, course_id) VALUES (2, 'Bob Johnson', 'bob@example.com', 2);
INSERT IGNORE INTO student (id, name, email, course_id) VALUES (3, 'Charlie Brown', 'charlie@example.com', 3);
INSERT IGNORE INTO student (id, name, email, course_id) VALUES (4, 'Diana Prince', 'diana@example.com', 4);
INSERT IGNORE INTO student (id, name, email, course_id) VALUES (5, 'Evan Wright', 'evan@example.com', 5);
INSERT IGNORE INTO student (id, name, email, course_id) VALUES (6, 'Fiona Clark', 'fiona@example.com', 6);
INSERT IGNORE INTO student (id, name, email, course_id) VALUES (7, 'George Miller', 'george@example.com', 7);
INSERT IGNORE INTO student (id, name, email, course_id) VALUES (8, 'Hannah Davis', 'hannah@example.com', 8);
INSERT IGNORE INTO student (id, name, email, course_id) VALUES (9, 'Ian Evans', 'ian@example.com', 9);
INSERT IGNORE INTO student (id, name, email, course_id) VALUES (10, 'Julia Roberts', 'julia@example.com', 10);
