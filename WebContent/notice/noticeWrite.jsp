<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../temp/header_nav.jsp" %>
  <style type="text/css">
  	.main {
  		min-height: 800px;
  	}
  </style>	
</head>
<body>


<div class="container main">
	<div class="row">
	<form action="./noticeWriteProcess.jsp" method="post">
    <div class="form-group">
      <label for="title">Title :</label>
      <input type="text" class="form-control" id="title" placeholder="Enter Title" name="title">
    </div>
    <div class="form-group">
      <label for="writer">Writer:</label>
      <input type="text" class="form-control" id="Writer" placeholder="Enter Writer" name="Writer">
    </div>
    <div class="form-group">
      <label for="contents">Contents:</label>
      <textarea class="form-group" rows="5"  cols="" name="Contents">
      </textarea>
    </div>
    
    <button type="submit" class="btn btn-danger">Write</button>
  </form>	
</div>
	

</div>


<%@ include file="../temp/footer.jsp" %>
</body>
</html>