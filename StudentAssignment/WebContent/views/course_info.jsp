<%@page import="com.student.dto.CourseInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.student.dal.CourseInfoServiceImpl"%>
<%@page import="com.student.dal.CourseInfoService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Course Information</title>
<!-- bootstrap css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <!-- fontawesome -->
    <script src="${pageContext.request.contextPath}/resources/js/all.js"></script>
</head>
<body>

<%

CourseInfoService courseService = new CourseInfoServiceImpl();
ArrayList<CourseInfo> courseList = new ArrayList<CourseInfo>();
request.setAttribute("courseList", courseService.findAll());

%>

<jsp:include page="/includes/header.jsp"></jsp:include>
<br>
<br>
<div class="container">
	<div class="row">
		
		<!-- for form -->
		<div class="col-md-6">
			<h1 class="text-center mb-10">Course Information</h1>
			<br>
			
			<form action="${pageContext.request.contextPath}/CourseInfoServlet" method="post">	
				
				  <div class="form-group row mt-10 pt-10">
				    <label for="name" class="col-sm-3 col-form-label">Course Name</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control"  placeholder="Enter the course name" id="name" name="course_name">
				    </div>
				  </div>
				  
				  <div class="form-group row">
				    <label for="" class="col-sm-3 col-form-label"></label>
				    <div class="col-sm-3">
				      <input type="submit" class="form-control btn btn-primary"  value="Save">
				    </div>
				  </div>
				  
			</form>			
		</div>
		
		<!-- end of form -->
		<!-- for table -->
		<div class="col-md-6">
			<h1 class="text-center mb-10">Course Records</h1>
			<br>
			<table class="table table-bordered">
			    <thead>
			      <tr>
			        <th>Id</th>
			        <th>Name</th>
			      </tr>
			    </thead>
			    <tbody>
			      <c:choose>
			    	<c:when test="${empty requestScope.courseList }">
			    		<tr>
							<td colspan="2">No Record Found</td>
							
						</tr>
			    	</c:when>
			    	<c:otherwise>
			    		<c:forEach var="courseList" items="${requestScope.courseList }">
			    			<tr>
						        <td><c:out value="${courseList.id }"></c:out></td>
						        <td><c:out value="${courseList.courseName }"></c:out></td>
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