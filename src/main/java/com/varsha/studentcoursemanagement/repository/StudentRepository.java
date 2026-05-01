package com.varsha.studentcoursemanagement.repository;

import com.varsha.studentcoursemanagement.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface StudentRepository extends JpaRepository<Student, Long> {

    @Query("SELECT s FROM Student s INNER JOIN s.course c")
    List<Student> getStudentsWithCourses();

    @Query("""
        SELECT s FROM Student s INNER JOIN s.course c
        WHERE LOWER(s.studentName) LIKE LOWER(CONCAT('%', :keyword, '%'))
        OR LOWER(s.email) LIKE LOWER(CONCAT('%', :keyword, '%'))
        OR LOWER(s.city) LIKE LOWER(CONCAT('%', :keyword, '%'))
        OR LOWER(c.courseName) LIKE LOWER(CONCAT('%', :keyword, '%'))
    """)
    List<Student> searchStudents(String keyword);

    @Query("SELECT s FROM Student s INNER JOIN s.course c WHERE c.id = :courseId")
    List<Student> findStudentsByCourseId(Long courseId);
}