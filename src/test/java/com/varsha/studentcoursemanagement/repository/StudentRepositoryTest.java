package com.varsha.studentcoursemanagement.repository;

import com.varsha.studentcoursemanagement.entity.Course;
import com.varsha.studentcoursemanagement.entity.Student;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.data.jpa.test.autoconfigure.DataJpaTest;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

@DataJpaTest
class StudentRepositoryTest {

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private CourseRepository courseRepository;

    @Test
    void testSaveStudent() {
        Course course = courseRepository.save(
                new Course("Java Programming", "3 Months", "Mr. Sharma")
        );

        Student student = new Student(
                "Aarav Sharma",
                "aaravtest@gmail.com",
                20,
                "Delhi",
                course
        );

        Student savedStudent = studentRepository.save(student);

        assertThat(savedStudent.getId()).isNotNull();
        assertThat(savedStudent.getStudentName()).isEqualTo("Aarav Sharma");
    }

    @Test
    void testGetStudentsWithCourses() {
        Course course = courseRepository.save(
                new Course("Python Programming", "2 Months", "Ms. Verma")
        );

        studentRepository.save(
                new Student("Isha Verma", "ishatest@gmail.com", 21, "Mumbai", course)
        );

        List<Student> students = studentRepository.getStudentsWithCourses();

        assertThat(students).isNotEmpty();
        assertThat(students.get(0).getCourse()).isNotNull();
    }
}