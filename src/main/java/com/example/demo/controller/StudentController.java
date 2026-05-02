package com.example.demo.controller;

import com.example.demo.entity.Student;
import com.example.demo.service.CourseService;
import com.example.demo.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class StudentController {

    private final StudentService studentService;
    private final CourseService courseService;

    @Autowired
    public StudentController(StudentService studentService, CourseService courseService) {
        this.studentService = studentService;
        this.courseService = courseService;
    }

    @GetMapping("/")
    public String listStudents(Model model) {
        model.addAttribute("students", studentService.getAllStudents());
        return "listStudents";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("student", new Student());
        model.addAttribute("courses", courseService.getAllCourses());
        return "addStudent";
    }

    @PostMapping("/save")
    public String saveStudent(@ModelAttribute("student") Student student, Model model) {
        try {
            studentService.saveStudent(student);
            return "redirect:/";
        } catch (DataIntegrityViolationException e) {
            model.addAttribute("error", "Error: Email already exists or invalid data.");
            model.addAttribute("courses", courseService.getAllCourses());
            return "addStudent";
        } catch (Exception e) {
            model.addAttribute("error", "An unexpected error occurred.");
            model.addAttribute("courses", courseService.getAllCourses());
            return "addStudent";
        }
    }

    @GetMapping("/edit/{id}")
    public String showUpdateForm(@PathVariable("id") Long id, Model model) {
        try {
            Student student = studentService.getStudentById(id);
            model.addAttribute("student", student);
            model.addAttribute("courses", courseService.getAllCourses());
            return "updateStudent";
        } catch (Exception e) {
            return "redirect:/";
        }
    }

    @PostMapping("/update")
    public String updateStudent(@ModelAttribute("student") Student student, Model model) {
        try {
            studentService.saveStudent(student);
            return "redirect:/";
        } catch (DataIntegrityViolationException e) {
            model.addAttribute("error", "Error: Email already exists or invalid data.");
            model.addAttribute("courses", courseService.getAllCourses());
            return "updateStudent";
        } catch (Exception e) {
            model.addAttribute("error", "An unexpected error occurred.");
            model.addAttribute("courses", courseService.getAllCourses());
            return "updateStudent";
        }
    }

    @GetMapping("/delete/{id}")
    public String deleteStudent(@PathVariable("id") Long id) {
        studentService.deleteStudent(id);
        return "redirect:/";
    }
}
