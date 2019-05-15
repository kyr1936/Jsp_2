<%@page import="com.yr.point.PointDTO"%>
<%@page import="com.yr.point.PointDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

		PointDAO dao = new PointDAO();
		PointDTO dto = new PointDTO();
		
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setName(request.getParameter("name"));
		dto.setKor(Integer.parseInt(request.getParameter("kor")));
		dto.setEng(Integer.parseInt(request.getParameter("eng")));
		dto.setMath(Integer.parseInt(request.getParameter("math")));
		dto.setTotal(Integer.parseInt(request.getParameter("kor"))+Integer.parseInt(request.getParameter("eng"))+Integer.parseInt(request.getParameter("math")));
		dto.setAvg(Integer.parseInt(request.getParameter("total"))/3.0);
		
		int result = dao.update(dto);
	
		String msg = "Update Fail";
		if(result>0){
			msg = "Update Success";
		}
%>    	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert('<%=msg%>');
	location.href="./point.jsp";
</script>
</head>
<body>

</body>
</html>