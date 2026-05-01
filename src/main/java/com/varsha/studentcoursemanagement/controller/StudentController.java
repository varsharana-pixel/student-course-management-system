package com.varsha.studentcoursemanagement.controller;

import com.varsha.studentcoursemanagement.entity.Course;
import com.varsha.studentcoursemanagement.entity.Student;
import com.varsha.studentcoursemanagement.service.CourseService;
import com.varsha.studentcoursemanagement.service.StudentService;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validator;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Set;

@Controller
public class StudentController {

    private final StudentService studentService;
    private final CourseService courseService;
    private final Validator validator;

    public StudentController(StudentService studentService,
                             CourseService courseService,
                             Validator validator) {
        this.studentService = studentService;
        this.courseService = courseService;
        this.validator = validator;
    }

    @GetMapping("/")
    public String home() {
        return "redirect:/students";
    }

    @GetMapping("/students")
    public String listStudents(@RequestParam(required = false) String keyword,
                               @RequestParam(required = false) Long courseId,
                               Model model) {

        List<Student> students;

        if (keyword != null && !keyword.trim().isEmpty()) {
            students = studentService.searchStudents(keyword);
        } else if (courseId != null) {
            students = studentService.getStudentsByCourse(courseId);
        } else {
            students = studentService.getStudentsWithCourses();
        }

        List<Student> allStudents = studentService.getStudentsWithCourses();
        List<Course> allCourses = courseService.getAllCourses();

        model.addAttribute("students", students);
        model.addAttribute("courses", allCourses);

        model.addAttribute("totalStudents", allStudents.size());
        model.addAttribute("totalCourses", allCourses.size());
        model.addAttribute("totalEnrollments", allStudents.size());
        model.addAttribute("visibleStudents", students.size());

        model.addAttribute("keyword", keyword);
        model.addAttribute("selectedCourseId", courseId);

        model.addAttribute("todayDate",
                LocalDate.now().format(DateTimeFormatter.ofPattern("dd MMM yyyy")));

        return "students";
    }

    @GetMapping("/students/new")
    public String showAddForm(Model model) {
        model.addAttribute("student", new Student());
        model.addAttribute("courses", courseService.getAllCourses());
        model.addAttribute("formTitle", "Add New Student");
        return "student-form";
    }

    @PostMapping("/students/save")
    public String saveStudent(@ModelAttribute Student student,
                              @RequestParam("courseId") Long courseId,
                              Model model) {

        try {
            Course course = courseService.getCourseById(courseId);
            student.setCourse(course);

            Set<ConstraintViolation<Student>> violations = validator.validate(student);

            if (!violations.isEmpty()) {
                StringBuilder errorMessage = new StringBuilder();

                for (ConstraintViolation<Student> violation : violations) {
                    errorMessage.append(violation.getMessage()).append(" ");
                }

                model.addAttribute("student", student);
                model.addAttribute("courses", courseService.getAllCourses());
                model.addAttribute("formTitle",
                        student.getId() == null ? "Add New Student" : "Update Student");
                model.addAttribute("errorMessage", errorMessage.toString());

                return "student-form";
            }

            studentService.saveStudent(student);

            return "redirect:/students";

        } catch (Exception e) {
            model.addAttribute("student", student);
            model.addAttribute("courses", courseService.getAllCourses());
            model.addAttribute("formTitle",
                    student.getId() == null ? "Add New Student" : "Update Student");
            model.addAttribute("errorMessage",
                    "Student could not be saved. Email may already exist or data is invalid.");

            return "student-form";
        }
    }

    @GetMapping("/students/edit/{id}")
    public String showUpdateForm(@PathVariable Long id, Model model) {
        Student student = studentService.getStudentById(id);
        model.addAttribute("student", student);
        model.addAttribute("courses", courseService.getAllCourses());
        model.addAttribute("formTitle", "Update Student");
        return "student-form";
    }

    @GetMapping("/students/delete/{id}")
    public String deleteStudent(@PathVariable Long id) {
        studentService.deleteStudent(id);
        return "redirect:/students";
    }

    @GetMapping("/courses")
    public String coursesPage(Model model) {
        model.addAttribute("courses", courseService.getAllCourses());
        return "courses";
    }

    @GetMapping("/reports")
    public String reportsPage(Model model) {
        model.addAttribute("students", studentService.getStudentsWithCourses());
        model.addAttribute("courses", courseService.getAllCourses());
        return "reports";
    }

    @GetMapping("/settings")
    public String settingsPage() {
        return "settings";
    }

    @GetMapping("/students/export")
    public ResponseEntity<String> exportStudents() {
        List<Student> students = studentService.getStudentsWithCourses();

        StringBuilder csv = new StringBuilder();
        csv.append("ID,Name,Email,Age,City,Course\n");

        for (Student s : students) {
            csv.append(s.getId()).append(",")
                    .append(s.getStudentName()).append(",")
                    .append(s.getEmail()).append(",")
                    .append(s.getAge()).append(",")
                    .append(s.getCity()).append(",")
                    .append(s.getCourse().getCourseName()).append("\n");
        }

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=students.csv")
                .contentType(MediaType.parseMediaType("text/csv"))
                .body(csv.toString());
    }
    @GetMapping("/student-list")
    public String viewStudentTable(Model model) {
        model.addAttribute("students", studentService.getAllStudents());
        return "student-list";
    }
    @GetMapping("/courses/new")
    public String showAddCourseForm(Model model) {
        model.addAttribute("course", new Course());
        return "course-form";
    }

    @PostMapping("/courses/save")
    public String saveCourse(@ModelAttribute("course") Course course) {
        courseService.saveCourse(course);
        return "redirect:/courses";
    }
}