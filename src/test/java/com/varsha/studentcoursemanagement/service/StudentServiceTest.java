package com.varsha.studentcoursemanagement.service;

import com.varsha.studentcoursemanagement.entity.Course;
import com.varsha.studentcoursemanagement.entity.Student;
import com.varsha.studentcoursemanagement.repository.StudentRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Arrays;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class StudentServiceTest {

    @Mock
    private StudentRepository studentRepository;

    @InjectMocks
    private StudentService studentService;

    @Test
    void testGetAllStudents() {
        Course course = new Course("Java Programming", "3 Months", "Mr. Sharma");

        Student student1 = new Student("Aarav Sharma", "aarav@gmail.com", 20, "Delhi", course);
        Student student2 = new Student("Isha Verma", "isha@gmail.com", 21, "Mumbai", course);

        when(studentRepository.findAll()).thenReturn(Arrays.asList(student1, student2));

        assertThat(studentService.getAllStudents()).hasSize(2);

        verify(studentRepository, times(1)).findAll();
    }

    @Test
    void testGetStudentsWithCourses() {
        Course course = new Course("Python Programming", "2 Months", "Ms. Verma");
        Student student = new Student("Isha Verma", "isha@gmail.com", 21, "Mumbai", course);

        when(studentRepository.getStudentsWithCourses()).thenReturn(Arrays.asList(student));

        assertThat(studentService.getStudentsWithCourses()).hasSize(1);

        verify(studentRepository, times(1)).getStudentsWithCourses();
    }

    @Test
    void testSearchStudents() {
        Course course = new Course("Web Development", "4 Months", "Mr. Khan");
        Student student = new Student("Riya Singh", "riya@gmail.com", 22, "Pune", course);

        when(studentRepository.searchStudents("Riya")).thenReturn(Arrays.asList(student));

        assertThat(studentService.searchStudents("Riya")).hasSize(1);

        verify(studentRepository, times(1)).searchStudents("Riya");
    }

    @Test
    void testGetStudentsByCourse() {
        Course course = new Course("Data Science", "6 Months", "Dr. Mehta");
        Student student = new Student("Kabir Mehta", "kabir@gmail.com", 23, "Jaipur", course);

        when(studentRepository.findStudentsByCourseId(1L)).thenReturn(Arrays.asList(student));

        assertThat(studentService.getStudentsByCourse(1L)).hasSize(1);

        verify(studentRepository, times(1)).findStudentsByCourseId(1L);
    }

    @Test
    void testSaveStudent() {
        Course course = new Course("Java Programming", "3 Months", "Mr. Sharma");
        Student student = new Student("Aarav Sharma", "aarav@gmail.com", 20, "Delhi", course);

        when(studentRepository.save(student)).thenReturn(student);

        Student savedStudent = studentService.saveStudent(student);

        assertThat(savedStudent.getStudentName()).isEqualTo("Aarav Sharma");

        verify(studentRepository, times(1)).save(student);
    }

    @Test
    void testGetStudentById() {
        Course course = new Course("Web Development", "4 Months", "Mr. Khan");
        Student student = new Student("Riya Singh", "riya@gmail.com", 22, "Pune", course);
        student.setId(1L);

        when(studentRepository.findById(1L)).thenReturn(Optional.of(student));

        Student foundStudent = studentService.getStudentById(1L);

        assertThat(foundStudent).isNotNull();
        assertThat(foundStudent.getId()).isEqualTo(1L);

        verify(studentRepository, times(1)).findById(1L);
    }

    @Test
    void testDeleteStudent() {
        Long studentId = 1L;

        studentService.deleteStudent(studentId);

        verify(studentRepository, times(1)).deleteById(studentId);
    }
}
