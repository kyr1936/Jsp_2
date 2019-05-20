<%@page import="com.yr.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yr.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    NoticeDAO dao = new NoticeDAO();
    int curPage =1;

    try{
    	curPage = Integer.parseInt(request.getParameter("curPage"));
    }catch(Exception e) {
    		
    }
    int perPage = 10;
    int startRow = (curPage-1)*perPage + 1;
    int lastRow = curPage*perPage;
    
    int totalCount = dao.getTotalCount();
    
    int totalPage = totalCount/perPage;
    if(totalCount%perPage !=0){ 
    	totalPage++;
    }
    int perBlock = 5;
   	int totalBlock = totalPage/perBlock;
    if(totalPage%perBlock !=0){
    	totalBlock++;
    }
    int curBlock=curPage/perBlock;
    if(curPage%perBlock !=0){
    	curBlock++;
    }
    
    int startNum = (curBlock-1)*perBlock +1;
    int lastNum = curBlock*perBlock;
    
  	if(curBlock==totalBlock){
  		lastNum=totalPage;
  	}
    

    
    ArrayList<NoticeDTO> ar = dao.selectList(startRow, lastRow);

    
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
				<td>Num</td><td>Title</td><td>Writer</td><td>Reg_date</td><td>Hit</td>
			</tr>
		<% for(NoticeDTO dto : ar) { %>
			<tr>
				<td><%=dto.getNum() %> </td>
				<td><a href="./noticeSelect.jsp?num=<%= dto.getNum() %>"><%= dto.getNum() %></a> </td>	
				<td><%=dto.getWriter() %></td>
				<td><%=dto.getReg_date() %></td>
				<td><%=dto.getHit() %></td>
			</tr>
				<%}  %>
			</table>
		</div>		
	  	
	  	<div>
	  		<%if(curBlock>1){ %>
	  		<a href="./noticeList.jsp?curPage=<%=startNum-1 %>">[이전]</a>
	  		
	  		<%} %>

	  		<%for(int i=startNum; i<=lastNum; i++) {%>
	  		<a href="./noticeList.jsp?curPage=<%=i%>"><%=i %></a>
	  	
	  		<%} %>
	  		
	  		<%if(curBlock<totalBlock){ %>
	  		<a href="./noticeList.jsp?curPage=<%=lastNum+1 %>">[다음]</a>
	  		
	  		<%} %>
	  	</div>
	<%
		//MemberDTO mDTO = (MemberDTO)session.getAttribute("member");
	
		if(memberDTO!=null && memberDTO.getId().equals("admin")) {
	
	%>  	
  	<div class="row">
  		<a href="./noticeWrite.jsp" class="btn btn-primary">Write</a>
  	</div>
  <%} %>
  </div>			
				
				
				
<%@ include file="../temp/footer.jsp" %>
</body>
</html>