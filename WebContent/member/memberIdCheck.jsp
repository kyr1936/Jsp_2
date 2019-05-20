<%@page import="java.util.ArrayList"%>
<%@page import="com.yr.member.MemberDAO"%>
<%@page import="com.yr.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");	
	MemberDAO memberDAO = new MemberDAO();
	int result=memberDAO.idCheck(id);

%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>IdCheck Page</h2>
	
	
	<form action="./memberIdCheck.jsp">
		<div>
		<input type="text" id="id" name="id" value="<%=id %>">
		</div>
		<br>
		<button id="check">중복확인</button>
	
	<%if(result==0) { %>
		<input type="button" id="btn" value="사용">
	<%} %>
	</form>
	<!-- script -->
	<script src="<%= application.getContextPath() %>/vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript">
		$('#btn').click(function () {
			var id = $('#id').val();
			opener.document.getElementById('id').value=id;
			opener.document.getElementById('idConfirm').value=1;
			self.close();
			
		});
		$('#id').change(function() {
			$('#btn').remove();
		});
	
	</script>
	
	
	
	
	
	
	
</body>
</html>