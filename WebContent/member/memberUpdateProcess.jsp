<%@page import="com.yr.member.MemberDAO"%>
<%@page import="com.yr.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   		request.setCharacterEncoding("utf-8");
   		response.setCharacterEncoding("utf-8");
   		//MemberDTO memberDTO = new MemberDTO;
   
   %> 
	<jsp:useBean id="memberDTO" class="com.yr.member.MemberDTO" />
	<jsp:setProperty property="*" name="memberDTO"/>	
<%
	MemberDAO memberDAO = new MemberDAO();
	int result = memberDAO.update(memberDTO);
	
	if(result>0){
		response.sendRedirect("./memberMyPage.jsp");
	//	session.setAttribute("member", memberDTO);
		MemberDTO m = (MemberDTO)session.getAttribute("member");
		m.setId(memberDTO.getId());
		
	} else {
		request.setAttribute("message", "Update Fail");
		request.setAttribute("path", "./memberMyPage.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");
		view.forward(request, response);
	}

%>
	   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 
<jsp:include page="../temp/css_meta.jsp"/>
</head>
<body>
<jsp:include page="../temp/header_nav.jsp"/>


<h2>UpdateProcess Page</h2>





<jsp:include page="../temp/footer.jsp"></jsp:include>
</body>
</html>