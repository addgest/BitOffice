		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/ip/updateIpView").submit();
		}		
	
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default, #modalClose" ).on("click" , function() {
				fncGetList(1);
			});
		 });
		
			//============= "IP등록"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$("#ipsubmit").on("click" , function() {				
					
					var startIp = $("#startip1").val().trim()+"."+$("#startip2").val().trim()+"."+$("#startip3").val().trim()+"."+$("#startip4").val().trim();
					var endIp = $("#endip1").val().trim()+"."+$("#endip2").val().trim()+"."+$("#endip3").val().trim()+"."+$("#endip4").val().trim();
					var employeeNo = $('#employeeNo').val();
					
					if ($("#startip1").val().trim().length<1){
						alert("시작IP 1번째 입력하세요");
						$("#startip1").focus();
						return;
					}	
					
					if ($("#startip2").val().trim().length<1){
						alert("시작IP 2번째 입력하세요");
						$("#startip2").focus();
						return;
					}	
					
					if ($("#startip3").val().trim().length<1){
						alert("시작IP 3번째 입력하세요");
						$("#startip3").focus();
						return;
					}	
					
					if ($("#startip4").val().trim().length<1){
						alert("시작IP 4번째 입력하세요");
						$("#startip4").focus();
						return;
					}
					
					if ($("#endip1").val().trim().length<1){
						alert("끝IP 1번째 입력하세요");
						$("#endip1").focus();
						return;
					}	
					
					if ($("#endip2").val().trim().length<1){
						alert("끝IP 2번째 입력하세요");
						$("#endip2").focus();
						return;
					}	
					
					if ($("#endip3").val().trim().length<1){
						alert("끝IP 3번째 입력하세요");
						$("#endip3").focus();
						return;
					}	
					
					if ($("#endip4").val().trim().length<1){
						alert("끝IP 4번째 입력하세요");
						$("#endip4").focus();
						return;
					}						
					
					if (startIp.replace(",","")> endIp.replace(",","")){
						alert("종료IP는 시작 IP보다 커야 합니다");
						$("#endip4").focus();
						return;
					}						
					    //IP중복체 체크, 중복시 입력불가
/* 		 	            $.ajax( 
								{
									
									url : "/ip/json/getIp",										
									method : "GET" ,
									dataType : "text" ,
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},								
									data : {
		 								startIp: startIp,
										endIp: endIp,																		
									},
									success : function() {
										//IP중복시 처리 불가
										$("#modalmessage").text("IP중복으로 인해 처리 불가합니다");
										jQuery("#getMessageModal").modal('show');	
									},	
									error : function() { */
										//IP증복이 안될때 등록가능

							
					            	$.ajax({
					            		url : "/ip/json/addIp",
										method : "POST" ,
										data : { 	
				 								"startIp": startIp,
												"endIp": endIp,
												"regId": employeeNo	
													} ,	
										contentType : "application/x-www-form-urlencoded; charset=UTF-8",
										dataType : "text" ,
										success : function(resultValue,status) {
											//alert("::"+resultValue+"::");
											if(resultValue.indexOf('1')>=0){
												$("#modalmessage").text("등록되었습니다");
											}else{
												$("#modalmessage").text("등록처리 실패! 관리자에게 문의!");
											}	
											jQuery("#getMessageModal").modal('show');
										},	
										error : function(request, error) {
											alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
											   

											
											$("#modalmessage").text("등록접속 error");
											jQuery("#getMessageModal").modal('show');	
									    }						
									}); 
									

									

/* 								    }
										
						
						}); //ajax */  

	 	            
				});
		 });
		
		 //숫자만	
		 function onlyNumber(obj) {
			    $(obj).keyup(function(){
			         $(this).val($(this).val().replace(/[^0-9]/g,""));
			    }); 
			}
		 
		//삭제 
		function delIp(serialNo) {
        	$.ajax({
        		url : "/ip/json/deleteIp",
				method : "POST" ,
				data : { 	
					"serialNo": serialNo
				} ,	
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				dataType : "text" ,
				success : function(resultValue) {
					//alert("resultValue: "+resultValue);
				    if (resultValue.indexOf('1')>=0){
				    	$("#modalmessage").text("삭제되었습니다");
				    }else{
				    	$("#modalmessage").text("삭제처리 실패! 관리자에게 문의!");
				    }
					
					jQuery("#getMessageModal").modal('show');	
	
				},	
				error : function() {
					$("#modalmessage").text("삭제접속 error");
					jQuery("#getMessageModal").modal('show');	
			    }
		});
        	
			
	}		