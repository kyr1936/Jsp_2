<%@page import="com.yr.point.PointDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yr.point.PointDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.driver.DBConversion"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PointDAO pointDAO = new PointDAO();
	
	int curPage =1;
	
	try{
	curPage= Integer.parseInt(request.getParameter("curPage"));
	} catch(Exception e) {
		
	}
	
	String kind = request.getParameter("kind");
	String search = request.getParameter("search");
	
	System.out.println("kind : " + kind);
	System.out.println("search : " +search);
	if(search==null) {
		search="";
	}
	
	int perPage=10;
	int startRow=(curPage-1)*perPage+1;
	int lastRow=curPage*perPage;
	
	// 1. 총 글의 개수
	
	int totalCount= pointDAO.getTotalCount();
	// 2. 총 페이지 개수
	int totalPage = totalCount/perPage;
//	Math.ceil(totalCount/perPage);
	
	if(totalCount%perPage !=0) {
		totalPage++;
	}
	
	// 3. block당 숫자 개수
	int perBlock=5;
	
	// 4. 총 block의 개수
	int totalBlock = totalPage/perBlock;
	if(totalPage%perBlock !=0) {
		totalBlock++;
	}
	// 5. curPage
	int curBlock = curPage/perBlock;
	
	if(curPage%perBlock !=0) {
		curBlock++;
	}

	// 6. curBlock에서 startNum과 lastNum 찾기
	int startNum = (curBlock-1)*perBlock +1;
	int lastNum = curBlock*perBlock;
	
	if(curBlock==totalBlock) {
		lastNum=totalPage;
	}
	
	
	ArrayList<PointDTO> ar = pointDAO.selectList(search, startRow, lastRow);
			
%>    
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
 
 <%@ include file="../temp/css_meta.jsp" %>

  <style type="text/css">
  	.main {
  		min-height: 800px;
  	}
  
  </style>	

</head>
<body>
  <%@ include file="../temp/header_nav.jsp" %>	
  
  <div class="container main">
  	<div class="row">
  		<h1>Point Page</h1>
  	</div>
  	
  	<!-- table -->
  	<div class="row">
		<table class="table table-hover">
			<tr>
				<td>NUM</td><td>NAME</td><td>KOR</td><td>ENG</td><td>MATH</td><td>TOTAL</td><td>AVG</td>
			</tr>
		<% for(PointDTO pointDTO: ar){ %>
			<tr>
				<td><%= pointDTO.getNum() %> </td>
				<td><a href="./pointSelect.jsp?num=<%= pointDTO.getNum() %>"><%= pointDTO.getName() %></a> </td>
				<td><%= pointDTO.getKor() %> </td>
				<td><%= pointDTO.getEng() %> </td>
				<td><%= pointDTO.getMath() %> </td>
				<td><%= pointDTO.getTotal() %> </td>
				<td><%= pointDTO.getAvg() %> </td>
			</tr>
			
		<%} %>
			
		</table>  	
  	</div>
  <div class="row">
  	<form action="./point.jsp">
  	<select name="kind">
  		<option value="t">제목</option>
  		<option value="w">작성자</option>
  		<option value="c">내용</option>
  	</select>
  	<input type="text" name="search">
	<button>검색</button>  
  	</form>
  </div>
  
  
  
  

  	<div class="row">
  		<%if(curBlock>1) { %>
  		<a href="./point.jsp?curPage=<%=startNum-1%>">[이전]</a>
  		
  		<% }%>
  		
  	
  		
  		<% for(int i=startNum; i<=lastNum;i++) {%>
  			<a href="./point.jsp?curPage=<%=i%>"><%= i %></a>
  		<%} %>
  	
  		
  		<%if(curBlock<totalBlock) { %>
  		<a href="./point.jsp?curPage=<%=lastNum+1%>">[다음]</a>
  		
  		<% }%>
  		
  		
  	</div>
  	
  	
  	
  	<div class="row">
  		<a href="./pointWrite.jsp" class="btn btn-primary">Write</a>
  	</div>
  
  </div>
  



 <%@ include file="../temp/footer.jsp" %>
</body>
</html>