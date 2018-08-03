<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 달력 사용을 위한 CDN -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>


<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 10px;
}

body{
        padding-top : 70px;
        }
</style>


<!--  ///////////////////////// JavaScript ////////////////////////// -->
<!--  CDN(Content Delivery Network) 호스트 사용 -->
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">


	
$(function() {
	
	$("button.btn.btn-default:contains('확인')").on("click",function(){
		self.location ="/employee/listEmployee"
	});
	
	$("button.btn.btn-default:contains('추가등록')").on("click",function(){
		self.location ="/employee/addEmployee"
	});
	
	$( "button.btn.btn-default:contains('취소')" ).on("click" , function() {
		$("form")[0].reset();
	});
	
});
</script>

</head>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">다음과 같이 등록되었습니다</h1>

			<!-- form Start /////////////////////////////////////-->
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>부서</strong></div>
			<div class="col-xs-8 col-md-4">${employee.departmentNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>직급</strong></div>
			<div class="col-xs-8 col-md-4">${employee.positionNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>입사일</strong></div>
			<div class="col-xs-8 col-md-4">${employee.hireDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>사번</strong></div>
			<div class="col-xs-8 col-md-4">${employee.employeeNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>이름</strong></div>
			<div class="col-xs-8 col-md-4">${employee.employeeName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>생년월일</strong></div>
			<div class="col-xs-8 col-md-4">${employee.birthDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>이메일</strong></div>
			<div class="col-xs-8 col-md-4">${employee.email}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>연차</strong></div>
			<div class="col-xs-8 col-md-4">${employee.annualLeave}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>전자서명이미지</strong></div>
			<div class="col-xs-8 col-md-4">
			<img src="/images/uploadFiles/${employee.signImage} "  style="max-width: 100%; height: 100%;"/>
			</div>
		</div>
		
		
		<hr/>
			
			<div class="col-md-12 text-center">
	  			<button type="button" class="btn btn-default">확인</button>
	  			<button type="button" class="btn btn-default">추가등록</button>
	  			<button type="button" class="btn btn-default">취소</button>
	  		</div>
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
</body>
</html>