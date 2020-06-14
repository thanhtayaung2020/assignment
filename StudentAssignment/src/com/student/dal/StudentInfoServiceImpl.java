package com.student.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.student.dto.StudentInfo;
import com.student.util.StudentUtils;

public class StudentInfoServiceImpl implements StudentInfoService{
	
	private PreparedStatement pst;

	@Override
	public int saveStudentInfo(StudentInfo studentInfo) {
		int x = 0;
		try(Connection conn = StudentUtils.getConnection();) {
			pst = conn.prepareStatement("insert into student_info (NAME,BRITHDATE) VALUES (?,?)");
			pst.setString(1, studentInfo.getName());
			pst.setDate(2, new java.sql.Date(studentInfo.getBrithDate().getTime()));
			x = pst.executeUpdate();
			System.out.println(x);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return x;
	}

	@Override
	public ArrayList<StudentInfo> findAll() {
		ArrayList<StudentInfo> sList = new ArrayList<StudentInfo>();
		try(Connection conn = StudentUtils.getConnection();) {
			pst = conn.prepareStatement("select * from student_info");
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				StudentInfo studentInfo = new StudentInfo();
				studentInfo.setId(rs.getInt(1));
				studentInfo.setName(rs.getString(2));
				studentInfo.setBrithDate(new java.util.Date(rs.getDate(3).getTime()));
				
				sList.add(studentInfo);
			}
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sList;
	}

}
