<%@page import="com.yr.member.MemberDAO"%>
<%@page import="com.yr.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	MemberDTO dto = new MemberDTO();
	dto.setId(request.getParameter("id"));
	dto.setPw(request.getParameter("pw"));
	dto.setName(request.getParameter("name"));
	dto.setPhone(request.getParameter("phone"));
	dto.setEmail(request.getParameter("email"));
	dto.setAge(Integer.parseInt(request.getParameter("age")));
	
	
	MemberDAO dao = new MemberDAO();
	int result = dao.memberJoin(dto);
	
	String msg="Join Fail";
	if(result>0) {
		msg = "Join Success";
	}
	request.setAttribute("message",msg);
	request.setAttribute("path", "../index.jsp");
	
//	RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");
//	view.forward(request, response);
%>

<jsp:forward page="../common/test/result.jsp"></jsp:forward>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<body>
<h1>memberJoin Page</h1>
</body>
</html>