package com.example.demo.service;

import com.example.demo.entity.Course;
import com.example.demo.entity.Student;
import com.example.demo.repository.StudentRepository;
import com.example.demo.service.impl.StudentServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

public class StudentServiceTest {

    @Mock
    private StudentRepository studentRepository;

    @InjectMocks
    private StudentServiceImpl studentService;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testSaveStudent() {
        Course course = new Course("Java 101");
        Student student = new Student("John Doe", "john@example.com", course);
        
        when(studentRepository.save(any(Student.class))).thenReturn(student);

        Student savedStudent = studentService.saveStudent(student);

        assertNotNull(savedStudent);
        assertEquals("John Doe", savedStudent.getName());
        verify(studentRepository, times(1)).save(student);
    }

    @Test
    public void testGetAllStudents() {
        Course course = new Course("Java 101");
        Student student1 = new Student("John Doe", "john@example.com", course);
        Student student2 = new Student("Jane Doe", "jane@example.com", course);

        when(studentRepository.getStudentsWithCourse()).thenReturn(Arrays.asList(student1, student2));

        List<Student> students = studentService.getAllStudents();

        assertEquals(2, students.size());
        verify(studentRepository, times(1)).getStudentsWithCourse();
    }

    @Test
    public void testGetStudentById() {
        Course course = new Course("Java 101");
        Student student = new Student("John Doe", "john@example.com", course);
        student.setId(1L);

        when(studentRepository.findById(1L)).thenReturn(Optional.of(student));

        Student foundStudent = studentService.getStudentById(1L);

        assertNotNull(foundStudent);
        assertEquals(1L, foundStudent.getId());
        assertEquals("John Doe", foundStudent.getName());
    }

    @Test
    public void testGetStudentById_NotFound() {
        when(studentRepository.findById(1L)).thenReturn(Optional.empty());

        Exception exception = assertThrows(RuntimeException.class, () -> {
            studentService.getStudentById(1L);
        });

        assertEquals("Student not found for id: 1", exception.getMessage());
    }
}
