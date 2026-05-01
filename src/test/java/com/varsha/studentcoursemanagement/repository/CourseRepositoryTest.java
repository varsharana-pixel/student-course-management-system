package com.varsha.studentcoursemanagement.repository;

import com.varsha.studentcoursemanagement.entity.Course;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.data.jpa.test.autoconfigure.DataJpaTest;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

@DataJpaTest
class CourseRepositoryTest {

    @Autowired
    private CourseRepository courseRepository;

    @Test
    void testSaveCourse() {
        Course course = new Course("Java Programming", "3 Months", "Mr. Sharma");

        Course savedCourse = courseRepository.save(course);

        assertThat(savedCourse.getId()).isNotNull();
        assertThat(savedCourse.getCourseName()).isEqualTo("Java Programming");
    }

    @Test
    void testFindAllCourses() {
        courseRepository.save(new Course("Python Programming", "2 Months", "Ms. Verma"));
        courseRepository.save(new Course("Web Development", "4 Months", "Mr. Khan"));

        List<Course> courses = courseRepository.findAll();

        assertThat(courses).hasSizeGreaterThanOrEqualTo(2);
    }
}