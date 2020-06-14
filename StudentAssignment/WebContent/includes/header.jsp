<nav class="navbar navbar-expand-md navbar-dark"
  style="background-color: #7952B3">
  <a class="navbar-brand" href="#">Student Information System</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/views/student_info.jsp">Student Info <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/views/course_info.jsp">Course Info</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/views/student_course.jsp">Student Course</a>
      </li>
    </ul>
  </div>
</nav>