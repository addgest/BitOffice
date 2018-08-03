<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
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
 <script type="text/javascript" src="../javascript/calendar.js"></script>
<script type="text/javascript">

function fncUpdateDepartment(){
	//Form 유효성 검증
	var departmentNo = $("input[name='departmentNo']").val();
	var departmentName = $("input[name='departmentName']").val();
	
	if(departmentNo == null || departmentNo.length<1){
		alert("부서번호은 반드시 입력하여야 합니다.");
		return;
	}
	
	if(departmentName == null || departmentName.length<1){
		alert("부서명은 반드시 입력하셔야 합니다.");
		return;
	}
	
	$("form").attr("method","POST").attr("action","/department/updateDepartment").submit();
}

$(function() {
	$("button.btn.btn-default:contains('등록')").on("click",function(){
		fncUpdateDepartment();
	});
	
	$( "button.btn.btn-default:contains('취소')" ).on("click" , function() {
		$("form")[0].reset();
	});
	
});

function dbCheck(){
	var departmentName=$('#departmentName').val();
	$.ajax({
		url:'/department/json/dbCheck',
		type:'post',
		data:{"departmentName":departmentName},
		success:function(data){
			console.log(data)
			if(data.count==0){
				$('#chkMsg').html("<p style=\"COLOR: blue\">사용가능</p>");
			}else{
				$('#chkMsg').html("<p style=\"COLOR: red\">이미 등록된 부서 입니다.</p>");
			}
		},
		error:function(){
		alert("에러입니다.");	
		}
	});
};

	
	</script>
	</head>
	<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-default text-center">부 서 수 정</h1>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" >
		
	    <div class="form-group">
		    <label for="departmentNo" class="col-sm-offset-1 col-sm-3 control-label">부서번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="departmentNo" name="departmentNo" value="${department.departmentNo }" readonly="readonly">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="departmentName" class="col-sm-offset-1 col-sm-3 control-label">부서명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="departmentName" name="departmentName" onkeyup = "dbCheck()"   value="${department.departmentName}" >
		    <span id = "chkMsg"></span>
		    </div>
		  </div>
	    

		  
		  	<div class="col-md-12 text-center">
	  			<button type="button" class="btn btn-default">등록</button>
	  			<button type="button" class="btn btn-default">취소</button>
	  		</div>
	  		</form>
	  		</div>
	</body>
	</html>