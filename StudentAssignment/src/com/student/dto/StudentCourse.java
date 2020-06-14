package com.student.dto;

import java.io.Serializable;

public class StudentCourse implements Serializable{
	
	private int id;
	private int studentId;
	private String studentName;
	private String courseName;
	
	public StudentCourse() {
		super();
	}

	public StudentCourse(int studentId, String studentName, String courseName) {
		super();
		this.studentId = studentId;
		this.studentName = studentName;
		this.courseName = courseName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	
	

}
