<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@page isELIgnored="false"%>
<!DOCTYPE html>
<%@ page import="com.dao.StudentDAO" %>
<%@ page import="com.conn.DBconnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.Student" %>

<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="allCss.jsp" %>

<title>All Students</title>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="container p-4">
<div class="card text-center mt-3">
         <c:if test="${not empty succMsg}">
              <p class="text-center text-success">${succMsg}</p>
              <c:remove var="succMsg"/>
          </c:if>
          <c:if test="${not empty errMsg}">
              <p class="text-center text-success">${errMsg}</p>
              <c:remove var="errMsg"/>
          </c:if>

  <div class="card-body">
    <div class="card-title fs-4">
        All Student
      </div>
<table class="table mt-4">
  <thead>
    <tr>
      <th scope="col">id</th>
      <th scope="col">Name</th>
      <th scope="col">Phone</th>
      <th scope="col">DOB</th>
      <th scope="col">Action</th>

    </tr>
  </thead>
  <tbody>
  <%
  StudentDAO dao = new StudentDAO(DBconnect.getConn());
  List<Student> list = dao.getAllStudents();
  for(Student s : list){
    %>
    <tr>
          <th scope="row"><%=s.getId() %></th>
          <td><%=s.getName() %></td>
          <td><%=s.getPhone() %></td>
          <td><%=s.getDob() %></td>
          <td><a class="btn btn-primary me-2" href="editStudent.jsp?id=<%=s.getId() %>">Edit</a><a class="btn btn-danger" href="delete?id=<%=s.getId() %>">Delete</a></td>
        </tr>

  <%}
  %>


  </tbody>
</table>

  </div>

</div>

</div>

</body>
</html>