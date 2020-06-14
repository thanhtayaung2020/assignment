<%@page import="com.student.dto.StudentCourse"%>
<%@page import="com.student.dal.StudentCourseServiceImpl"%>
<%@page import="com.student.dal.StudentCourseService"%>
<%@page import="com.student.dto.CourseInfo"%>
<%@page import="com.student.dal.CourseInfoServiceImpl"%>
<%@page import="com.student.dal.CourseInfoService"%>
<%@page import="com.student.dto.StudentInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.student.dal.StudentInfoServiceImpl"%>
<%@page import="com.student.dal.StudentInfoService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Course Information</title>
<!-- bootstrap css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <!-- fontawesome -->
    <script src="${pageContext.request.contextPath}/resources/js/all.js"></script>
</head>
<body>

<!-- student can be assigned to course -->

<%

StudentCourseService scService = new StudentCourseServiceImpl();
ArrayList<StudentCourse> scList = new ArrayList<StudentCourse>();
request.setAttribute("scList", scService.findAll());


%>

<!-- end of student course assign -->
<jsp:include page="/includes/header.jsp"></jsp:include>
<br>
<br>

<!-- for student list -->

<%

StudentInfoService studentService = new StudentInfoServiceImpl();
ArrayList<StudentInfo> studentList = new ArrayList<StudentInfo>();
request.setAttribute("studentList", studentService.findAll());

%>

<!-- end of  student list -->

<!-- for course list -->

<%

CourseInfoService courseService = new CourseInfoServiceImpl();
ArrayList<CourseInfo> courseList = new ArrayList<CourseInfo>();
request.setAttribute("courseList", courseService.findAll());

%>

%>

<!-- end of course list -->

<div class="container">
	<div class="row">
		
		<!-- for form -->
		<div class="col-md-6">
			<h1 class="text-center mb-10">Student Course Information</h1>
			<br>
			
			<form action="${pageContext.request.contextPath}/StudentCourseServlet" method="post">	
				
				  <!-- Student Id -->
				  <div class="form-group row mt-10 pt-10">
				    <label for="name" class="col-sm-3 col-form-label">Student Id</label>
				    <div class="col-sm-9">
				    
				      <select class="form-control" id="name" name="student_id">
				      	  <c:choose>
				      	  	<c:when test="${empty requestScope.studentList}">
				      	  		<option>no data</option>
				      	  	</c:when>
				      	  	<c:otherwise>
				      	  		<option></option>
				      	  		<c:forEach var="studentList" items="${requestScope.studentList }">
				      	  			<option value="${studentList.id }"><c:out value="${studentList.id }"></c:out></option>
				      	  		</c:forEach>
				      	  	</c:otherwise>
				      	  </c:choose>
					    </select>
				    </div>
				  </div>
				  <!-- end of student id -->				
				  <div class="form-group row mt-10 pt-10">
				    <label for="name" class="col-sm-3 col-form-label">Student Name</label>
				    <div class="col-sm-9">
				    
				      <select class="form-control" id="name" name="student_name">
				      	  <c:choose>
				      	  	<c:when test="${empty requestScope.studentList}">
				      	  		<option>no data</option>
				      	  	</c:when>
				      	  	<c:otherwise>
				      	  		<option></option>
				      	  		<c:forEach var="studentList" items="${requestScope.studentList }">
				      	  			<option value="${studentList.name }"><c:out value="${studentList.name }"></c:out></option>
				      	  		</c:forEach>
				      	  	</c:otherwise>
				      	  </c:choose>
					    </select>
				    </div>
				  </div>
				  <div class="form-group row mt-10 pt-10">
				    <label for="name" class="col-sm-3 col-form-label">Student Name</label>
				    <div class="col-sm-9">
				    
				      <select class="form-control" id="name" name="student_course">
				      	  <c:choose>
				      	  	<c:when test="${empty requestScope.courseList}">
				      	  		<option>no data</option>
				      	  	</c:when>
				      	  	<c:otherwise>
				      	  		<option></option>
				      	  		<c:forEach var="courseList" items="${requestScope.courseList }">
				      	  			<option value="${courseList.courseName }"><c:out value="${courseList.courseName }"></c:out></option>
				      	  		</c:forEach>
				      	  	</c:otherwise>
				      	  </c:choose>
					    </select>
				    </div>
				  </div>
				  
				  <div class="form-group row">
				    <label for="" class="col-sm-3 col-form-label"></label>
				    <div class="col-sm-3">
				      <input type="submit" class="form-control btn btn-primary"  value="Assign">
				    </div>
				  </div>
				  
			</form>			
		</div>
		
		<!-- end of form -->
		<!-- for table -->
		<div class="col-md-6">
			<h1 class="text-center mb-10">Student Course Records</h1>
			<br>
			<table class="table table-bordered">
			    <thead>
			      <tr>
			        <th>Id</th>
			        <th>Student Id</th>
			        <th>Name</th>
			        <th>Brith Date</th>
			      </tr>
			    </thead>
			    <tbody>
			    <c:choose>
			    	<c:when test="${empty requestScope.scList}">
			    		<tr>
			    			<td colspan="4">No record here</td>
			    		</tr>
			    	</c:when>
			    	<c:otherwise>
			    		<c:forEach var="scList" items="${requestScope.scList }">
			    			<tr>
						        <td><c:out value="${scList.id }"></c:out></td>
						        <td><c:out value="${scList.studentId }"></c:out></td>
						        <td><c:out value="${scList.studentName }"></c:out></td>
						        <td><c:out value="${scList.courseName }"></c:out></td>
						      </tr>
			    		</c:forEach>
			    	</c:otherwise>
			    </c:choose>
			      
			    </tbody>
			  </table>
		</div>
		<!-- end of table -->
		
	</div>
</div>


<!-- jquery -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
    <!-- bootstrap js -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
</body>
</html>