package com.student.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.student.dal.StudentInfoService;
import com.student.dal.StudentInfoServiceImpl;
import com.student.dto.StudentInfo;
import com.student.util.StudentUtils;


@WebServlet("/StudentInfoServlet")
public class StudentInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ArrayList<StudentInfo> studentList;
    
    public StudentInfoServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("student_name");
		String brithDate = request.getParameter("student_brith_date");
		
		//for test
		System.out.println(name);
		System.out.println(brithDate);
		//end of test
		
		StudentInfoService studentService = new StudentInfoServiceImpl();
		
		//studentList = AllStudents();
		StudentInfo studentInfo = new StudentInfo(name,StudentUtils.stringToDate(brithDate));
		
		int x = studentService.saveStudentInfo(studentInfo);
		
		//request.setAttribute("studentList", studentList);
		//response.sendRedirect(request.getContextPath()+"/views//student_info.jsp");
		getServletContext().getRequestDispatcher("/views/student_info.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

	public ArrayList<StudentInfo> AllStudents(){
		ArrayList<StudentInfo> sList = new ArrayList<StudentInfo>();
		
		//student object
		StudentInfo s1 = new StudentInfo();
		s1.setId(1);
		s1.setName("than htay aung");
		s1.setBrithDate(new Date());
		
		sList.add(s1);
		return sList;
	}
}
