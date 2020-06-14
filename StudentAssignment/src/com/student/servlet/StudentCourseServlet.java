package com.student.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.student.dal.StudentCourseService;
import com.student.dal.StudentCourseServiceImpl;
import com.student.dto.StudentCourse;


@WebServlet("/StudentCourseServlet")
public class StudentCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public StudentCourseServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int student_id = Integer.parseInt(request.getParameter("student_id"));
		String student_name = request.getParameter("student_name");
		String course_name = request.getParameter("student_course");
		
		//for test
		System.out.println(student_id);
		System.out.println(student_name);
		System.out.println(course_name);
		
		StudentCourse studentCourse = new StudentCourse(student_id, student_name, course_name);
		
		StudentCourseService scService = new StudentCourseServiceImpl();
		
		int x = scService.saveStudentCourse(studentCourse);
		
		getServletContext().getRequestDispatcher("/views/student_course.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
