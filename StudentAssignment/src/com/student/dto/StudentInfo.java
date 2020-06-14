package com.student.dto;

import java.util.Date;

public class StudentInfo {
	private int id;
	private String name;
	private Date brithDate;
	public StudentInfo() {
		super();
	}
	
	public StudentInfo(String name, Date brithDate) {
		super();
		this.name = name;
		this.brithDate = brithDate;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBrithDate() {
		return brithDate;
	}
	public void setBrithDate(Date brithDate) {
		this.brithDate = brithDate;
	}
	
	
	
}
