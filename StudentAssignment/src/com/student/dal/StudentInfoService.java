package com.student.dal;

import java.util.ArrayList;

import com.student.dto.StudentInfo;

public interface StudentInfoService {
	public int saveStudentInfo(StudentInfo studentInfo);
	public ArrayList<StudentInfo> findAll();
}
