<%@page import="com.yr.notice.NoticeDTO"%>
<%@page import="com.yr.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	NoticeDAO dao = new NoticeDAO();
	NoticeDTO dto = dao.selectOne(num);
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

  	<div class="row">
		<table class="table table-hover">
			<tr>
				<td>NUM</td><td>title</td><td>writer</td><td>reg_date</td><td>Hie</td>
			</tr><tr>
				<td><%= dto.getNum() %> </td>
				<td><a href="./noticeUpdate.jsp?num=<%= dto.getNum()%>"><%=dto.getTitle() %></a> </td>
				<td><%= dto.getReg_date() %> </td>
				<td><%= dto.getWriter() %> </td>
				<td><%=dto.getHit() %> </td>
			</tr>	
		</table>
		</div>
	<div class="row">
			<a href="./noticeUpdate.jsp?num=<%= dto.getNum()%>">Update</a>
			<a href="./noticeDelete.jsp?num=<%= dto.getNum()%>">Delete</a>
	</div>
</body>
</html>