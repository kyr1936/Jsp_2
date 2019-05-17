<%@page import="com.yr.point.PointDTO"%>
<%@page import="com.yr.point.PointDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	PointDAO pointDAO = new PointDAO();
	


%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<div class="row">
	<form action="./pointUpdateProcess.jsp" >
	<input type="hidden" name="num" value="<%=num%>">
    <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" value="<%= %>" id="name" placeholder="Enter Name" name="name">
    </div>
    <div class="form-group">
      <label for="kor">Kor:</label>
      <input type="text" class="form-control" value="<%=  %>" id="kor" placeholder="Enter Kor" name="kor">
    </div>
    <div class="form-group">
      <label for="eng">Eng:</label>
      <input type="text" class="form-control" value="<%=  %>" id="eng" placeholder="Enter Eng" name="eng">
    </div>
    <div class="form-group">
      <label for="math">Math:</label>
      <input type="text" class="form-control" value="<%= %>" id="math" placeholder="Enter Math" name="math">
    </div>
    
    <div class="form-group">
      <label for="math">Contents:</label>
      <textarea rows="" cols="" name=""></textarea>
    </div>
    
    <button type="submit" class="btn btn-danger">Update</button>
  </form>	
</div>

</div>


</body>
</html>