<%@page import="com.yr.notice.NoticeDTO"%>
<%@page import="com.yr.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   
   request.setCharacterEncoding("UTF-8");
   response.setCharacterEncoding("UTF-8");
   
   int num = Integer.parseInt(request.getParameter("num"));
   NoticeDAO dao = new NoticeDAO();
   num = dao.delete(num);
   
	int result = dao.delete(num);
	
	String msg = "Delete Fail";
	
	if(result>0){
		msg = "Delete Success";
	}
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert('<%=msg%>');
	location.href="./noticeList.jsp";
</script>
</head>
<body>

</body>
</html>