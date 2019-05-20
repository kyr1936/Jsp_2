<%@page import="com.yr.member.MemberDTO"%>
<%@page import="com.yr.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="memberDTO" class="com.yr.member.MemberDTO" />
<jsp:setProperty property="*" name="memberDTO"/>
    
<%
	MemberDAO dao = new MemberDAO();
	//체크박스 체크여부
	String check = request.getParameter("remember");
	System.out.println(check);
	
	
	//쿠키 생성
	
	if(check!=null) {
		Cookie cookie = new Cookie("check", memberDTO.getId()); 
		cookie.setMaxAge(60*60*24*7);
		response.addCookie(cookie);

	} else {
		Cookie c = new Cookie("check", "");
		response.addCookie(c);
	}

	memberDTO = dao.memberLogin(memberDTO);
	

	
	if(memberDTO!=null) {
		session.setAttribute("member", memberDTO);
		response.sendRedirect("../index.jsp");
	
	} else {
		request.setAttribute("message", "Login Fail");
		request.setAttribute("path", "./memberLogin.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");
		view.forward(request, response);
	}

%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>LoginProcess Page</h1>
</body>
</html>