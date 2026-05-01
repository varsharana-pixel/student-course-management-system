package com.varsha.studentcoursemanagement;

import com.varsha.studentcoursemanagement.entity.Course;
import com.varsha.studentcoursemanagement.entity.Student;
import com.varsha.studentcoursemanagement.repository.CourseRepository;
import com.varsha.studentcoursemanagement.repository.StudentRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class DataInitializer implements CommandLineRunner {

    private final CourseRepository courseRepository;
    private final StudentRepository studentRepository;

    public DataInitializer(CourseRepository courseRepository,
                           StudentRepository studentRepository) {
        this.courseRepository = courseRepository;
        this.studentRepository = studentRepository;
    }

    @Override
    public void run(String... args) {

        // Insert only if database is empty
        if (courseRepository.count() == 0 &&
            studentRepository.count() == 0) {

            // ---------- COURSES (10 rows) ----------

            Course java = courseRepository.save(
                    new Course("Java Programming",
                            "3 Months",
                            "Dr. Sharma"));

            Course python = courseRepository.save(
                    new Course("Python Programming",
                            "2 Months",
                            "Prof. Mehta"));

            Course web = courseRepository.save(
                    new Course("Web Development",
                            "4 Months",
                            "Ms. Kapoor"));

            Course dbms = courseRepository.save(
                    new Course("Database Management",
                            "3 Months",
                            "Dr. Rao"));

            Course ai = courseRepository.save(
                    new Course("Artificial Intelligence",
                            "5 Months",
                            "Dr. Iyer"));

            Course ml = courseRepository.save(
                    new Course("Machine Learning",
                            "4 Months",
                            "Prof. Khan"));

            Course cloud = courseRepository.save(
                    new Course("Cloud Computing",
                            "3 Months",
                            "Mr. Verma"));

            Course cyber = courseRepository.save(
                    new Course("Cyber Security",
                            "4 Months",
                            "Ms. Nair"));

            Course android = courseRepository.save(
                    new Course("Android Development",
                            "3 Months",
                            "Mr. Singh"));

            Course dsa = courseRepository.save(
                    new Course("Data Structures",
                            "2 Months",
                            "Prof. Joshi"));

            // ---------- STUDENTS (10 rows) ----------

            studentRepository.save(
                    new Student("Aarav Sharma",
                            "aarav@gmail.com",
                            20,
                            "Delhi",
                            java));

            studentRepository.save(
                    new Student("Isha Verma",
                            "isha@gmail.com",
                            21,
                            "Mumbai",
                            python));

            studentRepository.save(
                    new Student("Rohan Mehta",
                            "rohan@gmail.com",
                            22,
                            "Pune",
                            web));

            studentRepository.save(
                    new Student("Neha Kapoor",
                            "neha@gmail.com",
                            20,
                            "Jaipur",
                            dbms));

            studentRepository.save(
                    new Student("Kabir Khan",
                            "kabir@gmail.com",
                            23,
                            "Lucknow",
                            ai));

            studentRepository.save(
                    new Student("Ananya Rao",
                            "ananya@gmail.com",
                            21,
                            "Bengaluru",
                            ml));

            studentRepository.save(
                    new Student("Vikram Singh",
                            "vikram@gmail.com",
                            22,
                            "Chandigarh",
                            cloud));

            studentRepository.save(
                    new Student("Priya Nair",
                            "priya@gmail.com",
                            20,
                            "Kochi",
                            cyber));

            studentRepository.save(
                    new Student("Dev Patel",
                            "dev@gmail.com",
                            21,
                            "Ahmedabad",
                            android));

            studentRepository.save(
                    new Student("Meera Joshi",
                            "meera@gmail.com",
                            22,
                            "Indore",
                            dsa));
        }
    }
}