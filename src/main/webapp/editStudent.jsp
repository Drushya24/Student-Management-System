<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.dao.StudentDAO" %>
    <%@ page import="com.conn.DBconnect" %>
    <%@ page import="java.util.List" %>
    <%@ page import="com.entity.Student" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Student</title>
<%@include file="allCss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container d-flex justify-content-center align-items-center p-4">
 <div class="row">
 <div class="col-6">
  <div class="card mt-4" style="width: 36rem;">
    <div class="card-body">
    <div class="card-title text-center fs-1">Edit Student</div>
    <%
    int id = Integer.parseInt(request.getParameter("id"));
    StudentDAO dao = new StudentDAO(DBconnect.getConn());
    Student s = dao.getStudentById(id);
    %>



      <form class="mt-5" action="update" method="post">

           <div class="mb-3">
            <label class="form-label" >id</label>
            <input type="number" class="form-control" value="<%=s.getId()%>" name="id">
          </div>
        <div class="mb-3">
          <label class="form-label" >Name</label>
          <input type="text" class="form-control" value="<%=s.getName()%>" name="name">
        </div>
        <div class="mb-3">
          <label class="form-label" >phone</label>
          <input type="text" class="form-control"  value="<%=s.getPhone()%>" name="phone">
        </div>
        <div class="mb-3">
          <label class="form-label">DOB</label>
          <input type="text" class="form-control"  value="<%=s.getDob()%>" name="dob">
        </div>
        <button type="submit" class="btn btn-primary col-md-12">Save</button>
      </form>
    </div>
  </div></div>
 </div>
</div>


</div>

</body>
</html>