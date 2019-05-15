<%@page import="com.yr.point.PointDTO"%>
<%@page import="com.yr.point.PointDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	

	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	int total = kor+eng+math;
	double avg = total/3.0;

	PointDAO dao = new PointDAO();
	PointDTO dto = new PointDTO();
	dto.setName(name);
	dto.setKor(kor);
	dto.setEng(eng);
	dto.setMath(math);
	dto.setTotal(total);
	dto.setAvg(avg);
	
	int result=dao.insert(dto);
	
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
<script type="text/javascript">
	alert('<%= msg%>');
	location.href="./point.jsp";
</script>
</head>
<body>
	<h1>Point Write Process</h1>
</body>
</html>








