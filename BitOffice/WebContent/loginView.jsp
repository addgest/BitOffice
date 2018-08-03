<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>BitOffce</title>
  </head>
  <body>
    <section class="material-half-bg">
      <div class="cover"></div>
    </section>
    <section class="login-content">
      <div class="logo">
        <h1>BitOffice</h1>
      </div>
      <div class="login-box">
        <form class="login-form"  onkeyup="enterkey();" >
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>SIGN IN</h3>
          <div class="form-group">
            <label class="control-label">사번</label>
            <input class="form-control" type="text"   id="employeeNo"  name="employeeNo"  placeholder="사번" autofocus>
          </div>
          <div class="form-group">
            <label class="control-label">비밀번호</label>
            <input class="form-control" type="password" id="password" name="password"  placeholder="Password">
          </div>
          <div class="form-group">
          <div id="message" align="center"></div>
            <div class="utility">

              <p class="semibold-text mb-2"><a href="#" data-toggle="flip">Forgot Password ?</a></p>
            </div>
          </div>
          <div class="form-group btn-container">
            <a class="btn btn-primary btn-block" href="#" ><i class="fa fa-sign-in fa-lg fa-fw"></i>SIGN IN</a>
          </div>
        </form>
        <form class="forget-form">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>Forgot Password ?</h3>
          <div class="form-group">
            <label class="control-label">사번</label>
            <input class="form-control" id="employeeNo2" name="employeeNo" type="text" placeholder="사번" onkeyup="checkId()">
          <span id = "chkMsg"></span>
          </div>
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block"><i class="fa fa-unlock fa-lg fa-fw"></i>RESET</button>
          </div>
          <div class="form-group mt-3">
            <p class="semibold-text mb-0"><a href="#" data-toggle="flip"><i class="fa fa-angle-left fa-fw"></i> Back to Login</a></p>
          </div>
        </form>
      </div>
    </section>
    <!-- Essential javascripts for application to work-->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <script type="text/javascript">
      // Login Page Flipbox control
      $('.login-content [data-toggle="flip"]').click(function() {
      	$('.login-box').toggleClass('flipped');
      	return false;
      });
      //=============로그인 Event=================
	function fncLogin() {

		var employeeNo = $("input[name='employeeNo']").val();
		var password = $("input[name='password']").val();
		
		if (employeeNo == null || employeeNo.length < 1) {
			alert('사번을 입력하지 않으셨습니다.');
			$("#employeeNo").focus();
			return;
		}
		if (password == null || password.length < 1) {
			alert('패스워드를 입력하지 않으셨습니다.');
			$("#password").focus();
			return;
		}

		$.ajax({

			url : "/employee/json/logIn",
			method : "POST",
			dataType : "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({

				employeeNo : employeeNo,
				password : password

			}),

			success : function(JSONData, status) {
				console.log(JSONData)
				console.log(status)
// 				return;

				if (JSONData.employeeNo != "none") {
					if (JSONData.password == $("#password").val()) {
						$(".login-form").attr("method", "POST").attr("action",
								"/employee/login").submit();
					} else {
						$("#message").text("비밀번호를 다시 확인하세요")
								.css("color", "red");
						$("#password").val("").focus();
					}
				} else {
					$("#employeeNo").val("").focus();
					$("#password").val("");
					$("#message").text("로그인 정보를 다시 확인하세요").css("color", "red");
				}

			}

		});
	}
	
	function enterkey() {
        if (window.event.keyCode == 13) {
             // 엔터키가 눌렸을 때 실행할 내용
        	fncLogin();
        }
      }

	$(function() {

		$("a[href='#' ]:contains('SIGN IN')").on("click", function() {
			fncLogin();
		});

	});
	
	function checkId(){
	    var employeeNo = $('#employeeNo2').val();
	    $.ajax({
	        url:'/employee/json//idCheck',
	        type:'post',
	        data:{"employeeNo":employeeNo},
	        success:function(data){
	        	console.log(data)
	            if(data.count == 1){
	                $('#chkMsg').html("<p style=\"COLOR: blue\">연결된 메일로 임시비밀번호를 발송합니다.</p>");                
	            }else{
	                $('#chkMsg').html("<p style=\"COLOR: red\">입력하신 사번이 존재하지 않습니다.</p>");
	            }
	        },
	        error:function(){
	                alert("에러입니다");
	        }
	    });
	}; 

	$(function() {
		
		$( "button.btn.btn-primary:contains('RESET')" ).on("click" , function() {
			fncEmailPassword();
		});
	});	

	function fncEmailPassword() {
		
			 $("form").attr("method" , "POST").attr("action" , "/employee/emailPassword").submit();

			 }
    </script>
  </body>
</html>
