       $(function() {	
    	 //출퇴근기준시간 시간 timepicker
	       $("#starts-at, #ends-at").timepicker({
	    	    timeFormat: 'HH:mm',
	    	    interval: 15,
	    	    minTime: '60',
	    	    maxTime: '23:00 p',
	    	    defaultTime: '05:00',
	    	    startTime: '05:00',
	    	    dynamic: false,
	    	    dropdown: true,
	    	    scrollbar: true
	    	});
	       
	       
			//등록
			$("button.btn.btn-primary").on("click" , function() {
				fncAddStandardTime();
			});
			
			//모달창 닫기 클릭시 화면 reload
			$("#modalClose").on("click" , function() {
				$("form").attr("method" , "POST").attr("action" , "/standardtime/updateStandardTime").submit();
			});			
	  	 
	       
       });
         
        

		function fncAddStandardTime() {
			
			var startTime=$("#starts-at").val();
			var endTime=$("#ends-at").val();
			
			if(startTime == null || startTime.trim().length <1){
				alert("출근시간은 반드시 입력하셔야 합니다.");				
				return;
			}
			
			if(endTime == null || endTime.trim().length <1){
				alert("퇴근시간은 반드시 입력하셔야 합니다.");				
				return;
			}	
			
			if(startTime.replace(':','') >= endTime.replace(':','')){
				alert("퇴근시간은 출근시간보다 커야합니다");				
				return;
			}
	
			if($("button.btn.btn-primary").text().trim()=="등록"){				

				//등록
		            	$.ajax({
		            		url : "/standardtime/json/addStandardTime",
							method : "POST" ,
							data : { 	
  								stdStartTime: $("#starts-at").val(),
  								stdEndTime: $("#ends-at").val(),
  								regEmployeeNo:  $("#regEmployeeNo").val()
										} ,	
							contentType : "application/x-www-form-urlencoded; charset=UTF-8",
							dataType : "text" ,
							success : function(returnValue, status) {
								if (returnValue.indexOf(1)){ 
  								    $("#modalmessage").text("등록되었습니다");
  								 	jQuery("#getMessageModal").modal('show');	
								}else{
									alert("등록 실패! 관리자에게 문의!");									
								}
							},
							error : function(error) {
						        alert("등록 접속 error");
						    }							
					}); 
				
				
			}else{		
				//수정
				//$("form").attr("method" , "POST").attr("action" , "/standardtime/updateStandardTime").submit();
		            	$.ajax({
		            		url : "/standardtime/json/updateStandardTime",
							method : "POST" ,
							data : { 	
  								serialNo: $("#serialNo").val(),
  								stdStartTime: $("#starts-at").val(),
  								stdEndTime: $("#ends-at").val(),
  								regEmployeeNo:  $("#regEmployeeNo").val()
										} ,	
							contentType : "application/x-www-form-urlencoded; charset=UTF-8",
							dataType : "text" ,
							success : function(returnValue, status) {
								if (returnValue.indexOf(1)){ 
  								    $("#modalmessage").text("수정되었습니다");
  								 	jQuery("#getMessageModal").modal('show');
								}else{
									alert("수정 실패! 관리자에게 문의!");									
								}
							},
							error : function(error) {
						        alert("수정 접속 error");
						    }							
					}); 	            	
			
			}

		}