<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@page isELIgnored="false"%>
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
    <div class="card-title text-center fs-1">Add Student</div>

    <c:if test="${not empty succMsg}">
        <p class="text-center text-success">${succMsg}</p>
        <c:remove var="succMsg"/>
    </c:if>
    <c:if test="${not empty errMsg}">
        <p class="text-center text-success">${errMsg}</p>
        <c:remove var="errMsg"/>
    </c:if>
      <form class="mt-5" action="register" method="post">
       
        <div class="mb-3">
          <label class="form-label" >Name</label>
          <input type="text" class="form-control" name="name">
        </div>
        <div class="mb-3">
          <label class="form-label" >Phone</label>
          <input type="text" class="form-control" name="phone">
        </div>
        <div class="mb-3">
          <label class="form-label" >DOB</label>
          <input type="text" class="form-control" name="dob">
        </div>
        <button type="submit" class="btn btn-primary col-md-12">Add</button>
      </form>
    </div>
  </div></div>
 </div>
</div>
</div>

</body>
</html>