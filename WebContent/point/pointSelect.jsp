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

	PointDAO dao = new PointDAO();
	PointDTO dto = dao.selectOne(num);

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%if(dto !=null){ %>
		<h1>Name : <%= dto.getName() %></h1>
		<h1>Avg  : <%= dto.getAvg() %> </h1>
	
		<div>
			<a href="./pointUpdate.jsp?num=<%= dto.getNum()%>">Update</a>
			<a href="./pointDelete.jsp?num=<%= dto.getNum()%>">Delete</a>
		</div>
	<%}else { %>
		<h1>번호가 없다</h1>
	<%}

	%>
</body>
</html>






