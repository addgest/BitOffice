//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
 		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/attendance/listAttendance").submit();
		}		
	
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default, #modalClose" ).on("click" , function() {
				fncGetUserList(1);
			});
		 }); 
		

			//============= "출석 등록"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$("#checkin").on("click" , function() {					
					if ($('#employeeNo').val().trim().length<1){
						alert("session 종료! 다시로그인해주세요.");
						return;
					}				    
                      
				    //현재날짜 call         
	                fnc_getDate();	                
	                //현재시간 call
					fnc_getTime();                

	                //내 아이피 가져오기
	                $.getJSON("http://jsonip.com?callback=?", function (data) {	

					    /////////IP중복체 체크, 중복시 입력불가
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
		 								startIp: data.ip,
										endIp: data.ip																		
									},	       
									success : function() { */
							                	/////////지정된 IP범위에 해당되는 경우///////
							                	
												$.ajax( 
														{
															url : "/attendance/json/getAttendance/"+fnc_getDate()+$('#employeeNo').val(),
															method : "GET" ,
															dataType : "json" ,
															headers : {
																"Accept" : "application/json",
																"Content-Type" : "application/json"
															},
															success : function(JSONData , status) {	
																//출석 처리 조회되는 경우
																$("#modalmessage").text("이미 출석처리 되었습니다");
																jQuery("#getMessageModal").modal('show');	
															
															},    	
							    							error : function(request, error) {
							    								  //출석 처리
								    							  $.ajax( 
										    						{							
										    						
										    							url : "/attendance/json/addAttendance",	
										    							method : "GET" ,
										    							dataType : "text" ,	    							
										    							headers : {
										    								"Accept" : "application/json",
										    								"Content-Type" : "application/json"
										    							},								
										    							data : {
										    								attendanceNo: fnc_getDate()+$('#employeeNo').val(),
										    								attendateDate: fnc_getDate(),
										    								employeeNo: $('#employeeNo').val(),										 
										    								startTime: fnc_getTime(),  
										    								startIp: data.ip
										    							},
										    							success : function(status) {	 
										    								    $("#modalmessage").text("출석되었습니다");
										    								 	jQuery("#getMessageModal").modal('show');	    									
										    							},	
										    							error : function(status) {
									    								    $("#modalmessage").text("출석등록실패! 관리자에게 문의");
									    								 	jQuery("#getMessageModal").modal('show');	
										    						       
										    						    }	    								
										
										    						}); 	    						       
							    						    }										
															
													});						
												//////////////////
												
/* 									},//IP중복체 체크 success
									error : function() {
										//IP범위 벗어날 경우 미처리
										$("#modalmessage").text(data.ip+"는 지정된 IP범위에 있지 않습니다. 관리자에게 문의하세요.  ");
										jQuery("#getMessageModal").modal('show');											
									} 
	            	});*/
		 	         //////////IP중복체 체크, 중복시 입력불가
	 	            
				});
		 	});
		 });	
			
			//============= "퇴근 처리"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$("#checkout").on("click" , function() {					
					if ($('#employeeNo').val().trim().length<1){
						alert("session 종료! 다시로그인해주세요.");
						return;
					}              

					jQuery("#getCheckOutModal").modal('show');
   
				});
			 
			    $('#myFormSubmit').click(function(e){
			        e.preventDefault();

			        var memo = $('#memo').val();
			        
				    //현재날짜 call         
	                fnc_getDate();               
	                //현재시간 call
					fnc_getTime(); 
	                
	                //내 아이피 가져오기
	                $.getJSON("http://jsonip.com?callback=?", function (data) {	                	
					    /////////IP중복체 체크, 중복시 입력불가
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
		 								startIp: data.ip,
										endIp: data.ip																		
									},	       
									success : function() {	 */									
								   //-----출석유무확인--------
											$.ajax( 
													{
														url : "/attendance/json/getAttendance/"+fnc_getDate()+$('#employeeNo').val(),
														method : "GET" ,
														dataType : "json" ,
														headers : {
															"Accept" : "application/json",
															"Content-Type" : "application/json"
														},
														success : function(JSONData , status) {	
															//출석 처리 조회되는 경우
										                	//////////////
										    	            $.ajax( 
										    						{							
										    						
										    							url : "/attendance/json/updateAttendance",	
										    							method : "GET" ,
										    							dataType : "text" , 
																		headers : {
										    								"Accept" : "application/json",
										    								"Content-Type" : "application/json"
										    							},								
										    							data : {
										    								attendanceNo: fnc_getDate()+$('#employeeNo').val(),
										    								leaveDate: fnc_getDate(),
										    								employeeNo: $('#employeeNo').val(),										 
										    								endTime: fnc_getTime(),  
										    								endIp: data.ip,
										    								memo:$('#memo').val()
										    							},
										    							success : function(status) {	    								 	
									    								    $("#modalmessage").text("처리되었습니다");
									    								 	jQuery("#getMessageModal").modal('show');	     									
										    							},	
										    							error : function(status) {
									    								    $("#modalmessage").text("퇴근처리 실패! 관리자에게 문의!");
									    								 	jQuery("#getMessageModal").modal('show');	
										    						       
										    						    }	    								
										
										    				});
														
														},    	
						    							error : function(request, error) {
						    								  //출근 기록이 없는 경우
					    								    $("#modalmessage").text("출근 기록이 없습니다. 출근버튼을 눌러주세요");
					    								 	jQuery("#getMessageModal").modal('show');	    						       
						    						    }										
														
												});	
											//-----//출석유무확인--------
/* 									},
									error : function() {	
										//IP범위 벗어날 경우 미처리
										$("#modalmessage").text(data.ip+"지정된 IP범위에 있지 않습니다. 관리자에게 문의하세요.  ");
										jQuery("#getMessageModal").modal('show');										
									}
									
								});// /////////IP중복체 체크, 중복시 입력불가 */
	            	});
	                
			        $('#getCheckOutModal').modal('hide');

			      });	            
						 
		 });
			
		 
	//현재날짜
	 function fnc_getDate(){
			var fullDate = new Date();     
	              
		    //현재날짜 20170711           
	                    
				var twoDigitMonth = fullDate.getMonth()+1+"";
	              	if(twoDigitMonth.length==1)	twoDigitMonth="0" +twoDigitMonth;
	            var twoDigitDate = fullDate.getDate()+"";
	              	if(twoDigitDate.length==1)	twoDigitDate="0" +twoDigitDate;
	            var currentDate = fullDate.getFullYear()+ twoDigitMonth +  twoDigitDate;
	              
		 return currentDate;
	 }
	 
	//현재시간
	 function fnc_getTime(){
		 
			var fullDate = new Date();     
	           
	        //현재시간 1536
			var twoDigitHour = fullDate.getHours()+"";
			if(twoDigitHour.length==1)	twoDigitHour="0" +twoDigitHour;
			var twoDigitMinutes = fullDate.getMinutes()+"";
			if(twoDigitMinutes.length==1)	twoDigitMinutes="0" +twoDigitMinutes;
			var currentTime = twoDigitHour +":"+ twoDigitMinutes;	
			
			return currentTime;
	 }		 
	
	
	//숫자만	
	function onlyNumber(obj) {
		    $(obj).keyup(function(){
		         $(this).val($(this).val().replace(/[^0-9]/g,""));
		    }); 
	}
		
		
		 
		
		