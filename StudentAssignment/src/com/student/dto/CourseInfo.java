package com.student.dto;

import java.io.Serializable;

public class CourseInfo implements Serializable{
	private int id;
	private String courseName;

	
	public CourseInfo(String courseName) {
		super();
		this.courseName = courseName;
	}

	public CourseInfo() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	
	
	

}
