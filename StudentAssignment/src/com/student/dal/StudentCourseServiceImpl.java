package com.student.dal;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.student.dto.StudentCourse;
import com.student.dto.StudentInfo;
import com.student.util.StudentUtils;

public class StudentCourseServiceImpl implements StudentCourseService{

	private PreparedStatement pst;
	
	@Override
	public int saveStudentCourse(StudentCourse studentCourse) {
		int x = 0;
		try(Connection conn = StudentUtils.getConnection();) {
			pst = conn.prepareStatement("insert into student_course (STUDENT_ID,STUDENT_NAME,COURSE_NAME) VALUES (?,?,?)");
			pst.setInt(1, studentCourse.getStudentId());
			pst.setString(2, studentCourse.getStudentName());
			pst.setString(3, studentCourse.getCourseName());
			x = pst.executeUpdate();
			System.out.println(x);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return x;
	}

	@Override
	public ArrayList<StudentCourse> findAll() {
		ArrayList<StudentCourse> scList = new ArrayList<StudentCourse>();
		try(Connection conn = StudentUtils.getConnection();) {
			pst = conn.prepareStatement("select * from student_course");
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				StudentCourse studentCourse = new StudentCourse();
				studentCourse.setId(rs.getInt(1));
				studentCourse.setStudentId(rs.getInt(2));
				studentCourse.setStudentName(rs.getString(3));
				studentCourse.setCourseName(rs.getString(4));
				scList.add(studentCourse);
			}
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return scList;
	}

}
