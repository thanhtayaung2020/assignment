package com.student.dal;

import java.util.ArrayList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.student.dto.CourseInfo;
import com.student.dto.StudentInfo;
import com.student.util.StudentUtils;

public class CourseInfoServiceImpl implements CourseInfoService{

	private PreparedStatement pst;
	@Override
	public int saveCourseInfo(CourseInfo courseInfo) {
		int x = 0;
		try(Connection conn = StudentUtils.getConnection();) {
			pst = conn.prepareStatement("insert into course_info (NAME) VALUES (?)");
			pst.setString(1, courseInfo.getCourseName());
			x = pst.executeUpdate();
			System.out.println(x);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return x;

	}

	@Override
	public ArrayList<CourseInfo> findAll() {
		ArrayList<CourseInfo> courseList = new ArrayList<CourseInfo>();
		try(Connection conn = StudentUtils.getConnection();) {
			pst = conn.prepareStatement("select * from course_info");
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				CourseInfo courseInfo = new CourseInfo();
				courseInfo.setId(rs.getInt(1));
				courseInfo.setCourseName(rs.getString(2));
				
				
				courseList.add(courseInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return courseList;

	}

}
