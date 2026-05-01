package com.varsha.studentcoursemanagement.service;

import com.varsha.studentcoursemanagement.entity.Course;
import com.varsha.studentcoursemanagement.repository.CourseRepository;
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
class CourseServiceTest {

    @Mock
    private CourseRepository courseRepository;

    @InjectMocks
    private CourseService courseService;

    @Test
    void testGetAllCourses() {
        Course course1 = new Course("Java Programming", "3 Months", "Mr. Sharma");
        Course course2 = new Course("Python Programming", "2 Months", "Ms. Verma");

        when(courseRepository.findAll()).thenReturn(Arrays.asList(course1, course2));

        assertThat(courseService.getAllCourses()).hasSize(2);

        verify(courseRepository, times(1)).findAll();
    }

    @Test
    void testSaveCourse() {
        Course course = new Course("Web Development", "4 Months", "Mr. Khan");

        when(courseRepository.save(course)).thenReturn(course);

        Course savedCourse = courseService.saveCourse(course);

        assertThat(savedCourse.getCourseName()).isEqualTo("Web Development");

        verify(courseRepository, times(1)).save(course);
    }

    @Test
    void testGetCourseById() {
        Course course = new Course("Data Science", "6 Months", "Dr. Mehta");
        course.setId(1L);

        when(courseRepository.findById(1L)).thenReturn(Optional.of(course));

        Course foundCourse = courseService.getCourseById(1L);

        assertThat(foundCourse).isNotNull();
        assertThat(foundCourse.getId()).isEqualTo(1L);

        verify(courseRepository, times(1)).findById(1L);
    }
}