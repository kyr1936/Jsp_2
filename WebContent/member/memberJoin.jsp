<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 
<jsp:include page="../temp/css_meta.jsp" />

  <style type="text/css">
  	.main {
  		min-height: 800px;
  	}
  </style>	

</head>
<body>
  <%@ include file="../temp/header_nav.jsp" %>

<script type="text/javascript">


	$(function() {
		$('#confirm').click(function() {
			open("./id_confirm.html","_blank","width=500, height=300, top=200, left=300");
		});
		
		$('#id').keyup(function() {
			if($('#id').val().length<10) {
				$('#idd').text("10자 이상으로 입력하세요");
			} else $('#idd').text("");
		});
		
		
		$('#pw2').keyup(function() {
			if($('#pw1').val()!=$('#pw2').val()){
				$('#pwd2').text("비밀번호가 일치하지 않습니다");
			} else if($('#pw1').val()==$('#pw2').val()){
					$('#pwd2').text("");
			}
		});
		

		$('#email').keyup(function() {
			var n = null;
			n = $('#email').val().indexOf("@");
			if(n<0) {
				$('#emaild').text("이메일 형식으로 입력하세요");				
			}else $('#emaild').text("");
		});

		$('#pw1').keyup(function() {
			if($('#pw1').val().length<6) {
				$('#pwd1').text("6자 이상으로 입력하세요");
			} else $('#pwd1').text("");
		});
		
		
		$('#join').click(function() {
			var r = true;
			$(".form-control").each(function() {
				if($(this).val()==''){
					r=false;
				}
			});
			
			if(r && $('#idConfirm').val()=='1') {
				$('#idform').submit();	
			} else alert("모두 작성하세요");
		});
		
	});
				



</script>


</head>
<body>

<div class="container">
  <h2>회원가입</h2>
  <form action="./memberJoinProcess.jsp" id="frm" method="post">
    <div class="form-group">
    	<label for="id">ID:</label>
    	<input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
		<input type="hidden" id="idConfirm" value="1">
		<input type="button" value="중복확인" id="confirm">
		<div id="idd"></div>
    </div>
    <div class="form-group">
    	<label for="pwd">Password:</label>
    	<input type="password" class="form-control " id="pw1" placeholder="Enter password" >
    	<div id="pwd1"></div>
    </div>
    <div class="form-group">
    	<label for="pwd">Password confirm:</label>
    	<input type="password" class="form-control" id="pw2" placeholder="Enter password" name="pw">
    	<div id="pwd2"></div>
    </div>
    
    <div class="form-group">
    	<label for="name">name:</label>
    	<input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
    </div>
    
    	<div class="form-group">
    	<label for="phone">Phone:</label>
    	<input type="tel" class="form-control" id="phone" placeholder="Enter phone" name="phone">
    </div>
    
    <div class="form-group">
    	<label for="email">Email:</label>
    	<input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
    	<div id="emaild"></div>
    </div>
    
	<div class="form-group">
    	<label for="age">age:</label>
    	<input type="number" class="form-control" id="age" placeholder="Enter age" name="age">
    	<div id="aged"></div>
    </div>
    
    <input type="button"  class="btn btn-default" value="join" id="join">
  </form>
</div>

<jsp:include page="../temp/footer.jsp" />
</body>
</html>