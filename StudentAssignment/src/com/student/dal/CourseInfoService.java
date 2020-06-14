package com.student.dal;

import java.util.ArrayList;

import com.student.dto.CourseInfo;

public interface CourseInfoService {
	public int saveCourseInfo(CourseInfo courseInfo);
	public ArrayList<CourseInfo> findAll();
	
}
