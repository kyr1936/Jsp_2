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
  <jsp:include page="../temp/header_nav.jsp" />
 


<div class="container">
  <h2>회원 약관 동의</h2>
 	<div class="checkbox">
      <label><input type="checkbox" id="checkAll"> 전체동의</label>
    </div>
    <div class="checkbox">
      <label><input type="checkbox" class="check"> 동의 A</label>
    </div>
    <div class="checkbox">
      <label><input type="checkbox" class="check"> 동의 B</label>
    </div>
    <div class="checkbox">
      <label><input type="checkbox" class="check"> 동의 C</label>
    </div>
    
    <input type="button"  class="btn btn-default" id="join" value="join">
    </div>
    

<jsp:include page="../temp/footer.jsp" />
<script type="text/javascript">

$(function() {
	$('#checkAll').click(function() {
		var c = $(this).prop('checked');
		$('.check').prop('checked', c);
	});
	
	$('.check').click(function() {
		var c=true;
		$('.check').each(function() {
			if(!$(this).prop('checked')) {
				c=false;
			}
		});
		$('#checkAll').prop('checked', c);
	});
	$('#join').click(function() {
		var c = $('#checkAll').prop('checked');
		
		if (c) {
			location.href="./memberJoin.jsp";
		} else {
			alert("약관에 동의해주세요");
		}
		
	});
});


</script>
</body>
</html>