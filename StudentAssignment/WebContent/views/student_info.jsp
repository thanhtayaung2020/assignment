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
<title>Student Information</title>
<!-- bootstrap css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <!-- fontawesome -->
    <script src="${pageContext.request.contextPath}/resources/js/all.js"></script>
</head>
<body>

<%
StudentInfoService studentService = new StudentInfoServiceImpl();
ArrayList<StudentInfo> studentList = new ArrayList<StudentInfo>();
request.setAttribute("studentList", studentService.findAll());

%>

<jsp:include page="/includes/header.jsp"></jsp:include>
<br>
<br>
<div class="container">
	<div class="row">
		
		<!-- for form -->
		<div class="col-md-6">
			<h1 class="text-center mb-10">Student Information</h1>
			<br>
			
			<form action="${pageContext.request.contextPath}/StudentInfoServlet" method="post">	
				
				  <div class="form-group row mt-10 pt-10">
				    <label for="name" class="col-sm-3 col-form-label">Name</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control"  placeholder="Enter the name" id="name" name="student_name">
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="brith_date" class="col-sm-3 col-form-label">Brith Date</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="brith_date" name="student_brith_date" placeholder="dd/MM/yyyy">
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
			<h1 class="text-center mb-10">Student Records</h1>
			<br>
			<table class="table table-bordered">
			    <thead>
			      <tr>
			        <th>Id</th>
			        <th>Name</th>
			        <th>Brith Date</th>
			      </tr>
			    </thead>
			    <tbody>
			    <c:choose>
			    	<c:when test="${empty requestScope.studentList }">
			    		<tr>
							<td colspan="3">No Record Found</td>
							
						</tr>
			    	</c:when>
			    	<c:otherwise>
			    		<c:forEach var="studentList" items="${requestScope.studentList }">
			    			<tr>
						        <td><c:out value="${studentList.id }"></c:out></td>
						        <td><c:out value="${studentList.name }"></c:out></td>
						        <td><c:out value="${studentList.brithDate }"></c:out></td>
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