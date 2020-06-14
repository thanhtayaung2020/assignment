package com.student.dal;

import java.util.ArrayList;

import com.student.dto.StudentCourse;

public interface StudentCourseService {

public int saveStudentCourse(StudentCourse studentCourse);
public ArrayList<StudentCourse> findAll();
}
