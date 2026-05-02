package com.example.demo.repository;

import com.example.demo.entity.Course;
import com.example.demo.entity.Student;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@DataJpaTest
public class StudentRepositoryTest {

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private CourseRepository courseRepository;

    @Test
    public void testGetStudentsWithCourse() {
        // Given
        Course course = new Course("Test Course");
        course = courseRepository.save(course);

        Student student1 = new Student("Test Student 1", "test1@example.com", course);
        Student student2 = new Student("Test Student 2", "test2@example.com", course);
        
        studentRepository.save(student1);
        studentRepository.save(student2);

        // When
        List<Student> students = studentRepository.getStudentsWithCourse();

        // Then
        assertTrue(students.size() >= 2);
        
        // We know that student1 and student2 should be fetched with the course.
        boolean found = students.stream().anyMatch(s -> s.getName().equals("Test Student 1") && s.getCourse() != null);
        assertTrue(found);
    }
}
