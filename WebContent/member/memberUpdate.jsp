<%@page import="com.yr.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    MemberDTO memberDTO = new MemberDTO();
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="../temp/css_meta.jsp"/>

</head>
<body>
<jsp:include page="../temp/header_nav.jsp" />

<H2>Update Page</H2>
<jsp:useBean id="member" class="com.yr.member.MemberDTO" scope="session" />

<form action ="./memberUpdateProcess.jsp" id="frm" method="post">
	<div class="form-group">
	<input type="hidden" class= "form-control" id="id" name="id" value="<jsp:getProperty property="id" name="member"/>">
	</div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd1" placeholder="Enter password">
    </div>
        <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd2" placeholder="Enter password" name="pw">
    </div>
	<div class="form-group">
		<label for ="name">Name : </label>
		<input type="text" value="<jsp:getProperty property="name" name="member"/>" class= "form-control" id="name" placeholder="Enter Name"	name="id">
	</div>
	<div class="form-group">
		<label for ="phone">Phone : </label>
		<input type="tel" value="<jsp:getProperty property="phone" name="member"/>" class= "form-control" id="name" placeholder="Enter phone"	name="phone">
	</div>
	<div class="form-group">
		<label for ="email">Email : </label>
		<input type="email" value="<jsp:getProperty property="email" name="member"/>" class= "form-control" id="name" placeholder="Enter email"	name="email">
	</div>
	<div class="form-group">
		<label for ="age">Age : </label>
		<input type="number" value="<jsp:getProperty property="age" name="member"/>" class= "form-control" id="name" placeholder="Enter age"	name="age">
	</div>








	<button type="submit" class="btn btn-default">Update</button>
</form>









<jsp:include page="../temp/footer.jsp"></jsp:include>
<script type="text/javascript">
  	$(function() {
  		
  		
  		$('#idCheck').click(function() {
			open('jquery_9.html', '_blank', 'width=500, height=300');
		});
  		
  		///////////////////////////////////////////////
  		/* $('#id').change(function() {
			$('#idConfirm').val('0');
		}); */
  		//////////////////////////////////////////////
  		
  		$('#pwd2').blur(function() {
			if($(this).val()==$('#pwd1').val()){
				alert('같아요');
			}else {
				alert('달라요');
				$(this).val('');
			}
		});
  		
  		$('#pwd1').blur(function() {
			$('#pwd2').val('');
		});
  		
  		
  		
  		/////////////////////////////////////////////
		$('#btn').click(function() {
			var r = true;
			$(".form-control").each(function() {
				if($(this).val() == ''){
					r=false;
				}
			});
			
			if(r){
				$('#frm').submit();
			}else {
				alert('모두 작성');
			}
			
			
		});
	});
  
  </script>
</body>
</html>