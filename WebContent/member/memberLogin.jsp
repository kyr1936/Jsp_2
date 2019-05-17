<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<h1>Login Page</h1>
	<form action ="./memberLoginProcess.jsp" method="post">		
		<div class="form-group">
    		<label for="id">ID:</label>
    		<input type="text" class="form-control " id="id" placeholder="Enter id" name="id">
    	</div>
    	<div class="form-group">
    		<label for="pw">Password:</label>
    		<input type="password" class="form-control " id="pw" placeholder="Enter password" name="pw">
    	</div>
    	
    	<button type="submit" class="btn btn-default">submit</button>
    	</form>	
    
  <jsp:include page="../temp/footer.jsp" />
</body>
</html>