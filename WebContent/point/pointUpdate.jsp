<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	//1. 4가지정보
	String user="user03";
	String password="user03";
	String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String driver = "oracle.jdbc.driver.OracleDriver";
	//2. 드라이버로딩
	Class.forName(driver);
	//3. 로그인
	Connection con = DriverManager.getConnection(url, user, password);
	//4. sql
	String sql = "select * from point where num=?";
	//5. 미리전송
	PreparedStatement st = con.prepareStatement(sql);
	//6. ?세팅
	st.setInt(1, num);
	//7. 최종 전송 
	ResultSet rs = st.executeQuery();
	
	rs.next();

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<div class="row">
	<form action="./pointUpdateProcess.jsp" >
	<input type="hidden" name="num" value="<%= rs.getInt("num")%>">
    <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" value="<%=rs.getString("name") %>" id="name" placeholder="Enter Name" name="name">
    </div>
    <div class="form-group">
      <label for="kor">Kor:</label>
      <input type="text" class="form-control" value="<%=rs.getInt("kor") %>" id="kor" placeholder="Enter Kor" name="kor">
    </div>
    <div class="form-group">
      <label for="eng">Eng:</label>
      <input type="text" class="form-control" value="<%= rs.getInt("eng") %>" id="eng" placeholder="Enter Eng" name="eng">
    </div>
    <div class="form-group">
      <label for="math">Math:</label>
      <input type="text" class="form-control" value="<%=rs.getInt("math") %>" id="math" placeholder="Enter Math" name="math">
    </div>
    
    <div class="form-group">
      <label for="math">Contents:</label>
      <textarea rows="" cols="" name=""></textarea>
    </div>
    
    <button type="submit" class="btn btn-danger">Update</button>
  </form>	
</div>
	<% rs.close(); 
	   st.close();
	   con.close();
	%>

</div>


</body>
</html>