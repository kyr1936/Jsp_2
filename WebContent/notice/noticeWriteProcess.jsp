<%@page import="com.yr.notice.NoticeDTO"%>
<%@page import="com.yr.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
   String title = request.getParameter("title");
   String contents = request.getParameter("contents");
   String writer = request.getParameter("writer");
   
   NoticeDAO dao = new NoticeDAO();
   NoticeDTO dto = new NoticeDTO();
   dto.setTitle(title);
   dto.setContents(contents);
   dto.setWriter(writer);
   
   int result = dao.insert(dto);
	
   String msg ="insert Fail";
	if(result>0){
		msg = "insert Success";
	}
   
	%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../temp/css_meta.jsp" />

<script type="text/javascript">
	alert('<%= msg%>');
	location.href="./noticeList.jsp";
	
</script>
</head>
<body>
<jsp:include page="../temp/header_nav.jsp" />

<jsp:include page="../temp/footer.jsp" />
</body>
</html>