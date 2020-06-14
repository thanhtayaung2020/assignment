package com.student.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.student.dal.CourseInfoService;
import com.student.dal.CourseInfoServiceImpl;
import com.student.dto.CourseInfo;

@WebServlet("/CourseInfoServlet")
public class CourseInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CourseInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String courseName = request.getParameter("course_name");
		
		CourseInfo courseInfo = new CourseInfo(courseName);
		
		CourseInfoService courseService = new CourseInfoServiceImpl();
		
		int x = courseService.saveCourseInfo(courseInfo);
		
		getServletContext().getRequestDispatcher("/views/course_info.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
