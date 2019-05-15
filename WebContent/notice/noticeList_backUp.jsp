<%@page import="com.yr.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yr.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    NoticeDAO dao = new NoticeDAO();
    ArrayList<NoticeDTO> ar = dao.selectList();
    
    %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@ include file="../temp/css_meta.jsp" %>

  <style type="text/css">
  	.main {
  		min-height: 800px;
  	}
  	
  </style>	
<script type="text/javascript">
	$(function() {
		$('.list_click').click(function() {
			location.href="./noticeSelect.jsp";
	});
});

</script>
</head>
<body>
  <%@ include file="../temp/header_nav.jsp" %>	
  
  <div class="container main">
  	<div class="row">
  		<h1>NoticeList Page</h1>
  	</div>
  	
	<!-- table -->
  	<div class="row">
		<table class="table table-hover">
			<tr>
				<td>NUM</td><td>TITLE</td><td>WRITER</td><td>DATE</td><td>HIT</td>
			</tr>
		<% for(NoticeDTO noticeDTO: ar){ %>
			<tr >
				<td><%= noticeDTO.getNum() %> </td>
				<td><%= noticeDTO.getTitle() %></td>
				<td><%= noticeDTO.getWriter() %> </td>
				<td><%= noticeDTO.getReg_date() %> </td>
				<td><%= noticeDTO.getHit()%> </td>
				
			</tr>
			
		<%} %>
			
		</table>  	
  	</div>
  	
  	
  	<div class="row">
  		<a href="./noticeWrite.jsp" class="btn btn-primary">Write</a>
  	</div>
  
  </div>			
				
				
				
<%@ include file="../temp/footer.jsp" %>
</body>
</html>