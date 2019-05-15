<%@page import="java.util.ArrayList"%>
<%@page import="com.yr.point.PointDAO"%>
<%@page import="com.yr.point.PointDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.driver.DBConversion"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PointDAO dao = new PointDAO();
	ArrayList<PointDTO> ar = dao.selectList();
	
			
%>    
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
 
 <%@ include file="../temp/css_meta.jsp" %>

  <style type="text/css">
  	.main {
  		min-height: 800px;
  	}
  
  </style>	

</head>
<body>
  <%@ include file="../temp/header_nav.jsp" %>	
  
  <div class="container main">
  	<div class="row">
  		<h1>Point Page</h1>
  	</div>
  	
  	<!-- table -->
  	<div class="row">
		<table class="table table-hover">
			<tr>
				<td>NUM</td><td>NAME</td><td>KOR</td><td>ENG</td><td>MATH</td><td>TOTAL</td><td>AVG</td>
			</tr>
<% for(PointDTO dto: ar){ %>
			<tr>
				<td><%= dto.getNum() %> </td>
				<td><a href="./pointSelect.jsp?num=<%= dto.getNum() %>"><%= dto.getName() %></a> </td>
				<td><%= dto.getKor() %> </td>
				<td><%= dto.getEng() %> </td>
				<td><%= dto.getMath() %> </td>
				<td><%= dto.getTotal() %> </td>
				<td><%= dto.getAvg() %> </td>
			</tr>	
			<%}			%>
		</table>  	
  	</div>
  	
  	
  	<div class="row">
  		<a href="./pointWrite.jsp" class="btn btn-primary">Write</a>
  	</div>
  
  </div>
  



 <%@ include file="../temp/footer.jsp" %>
</body>
</html>