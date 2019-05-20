<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Cookie [] cookies = request.getCookies();
	
    String rid="";
    for(Cookie c : cookies) {
		if(c.getName().equals("check")) {
			rid = c.getValue();
		}
    }
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
  
<div class="container">
	<h1>Login Page</h1>
	<form action ="./memberLoginProcess.jsp" method="post">		
		<div class="form-group">
    		<label for="id">ID:</label>
    		<input type="text" class="form-control " value="<%=rid %>" id="id" placeholder="Enter id" name="id">
    	</div>
    	<div class="form-group">
    		<label for="pw">Password:</label>
    		<input type="password" class="form-control " id="pw" placeholder="Enter password" name="pw">
    	</div>
    	<div class="checkbox">
      <label><input type="checkbox" name="remember"> Remember me</label>
    	</div>
    	<button type="submit" class="btn btn-default">submit</button>
    	</form>	
    </div>
  <jsp:include page="../temp/footer.jsp" />
</body>
</html>