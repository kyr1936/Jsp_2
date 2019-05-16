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
	
	PointDAO pointDAO = new PointDAO();
	PointDTO pointDTO = new PointDTO();
	pointDTO.setName(name);
	pointDTO.setKor(kor);
	pointDTO.setEng(eng);
	pointDTO.setMath(math);
	pointDTO.setTotal(total);
	pointDTO.setAvg(avg);
	int result = pointDAO.insert(pointDTO);
	
	
	
	//4. SQL문 생성
	
	
	String msg ="insert Fail";
	if(result>0){
		msg = "insert Success";
	}

	request.setAttribute("message", msg);
	// 키 path
	request.setAttribute("path", "./point.jsp");
	
	
	//forward
	RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");//이동해야할 경로
	view.forward(request, response);
	
	//redirect
//	response.sendRedirect("../common/test/result.jsp");
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








