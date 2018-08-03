<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="toDay" class="java.util.Date" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:formatDate value='${toDay}' pattern='yyyyMMdd' var="nowDate"/>

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
   
   

 <!-- bootstrap datetimepicker -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
 
 <!-- tree -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script> 	 
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
      .aa {
      	color:red;
      }  
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
     
	            		
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
		
		
		 
		
		 
		//============= userId 에 회원정보보기  Event  처리(Click) =============	
	

	
	</script>
	
</head>

<body>
	<!-- Modal -->
	<div class="modal fade" id="getMessageModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Bitoffice</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <form>
		      <div id="modalmessage" class="modal-body">
		       
		      </div>
	      </form>
	      <div class="modal-footer">
	        <button type="button" id="modalClose" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 퇴근 Modal -->
	<div class="modal fade" id="getCheckOutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel2">Bitoffice</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      		 <form class="form-inline" name="modalForm">
					  <div class="form-group">					   
					    <select id="memo" name="memo" class="form-control" name="memo" >
							<option value="">퇴근</option>
							<option value="외근">외근</option>
							<option value="교육">교육</option>
							<option value="반휴">반휴</option>						
							<option value="조퇴">조퇴</option>	
							<option value="기타">기타</option>						
						</select>
					  </div>
				  </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
 	        <button type="button" id="myFormSubmit" class="btn btn-primary">등록</button> 
	      </div>
	    </div>
	  </div>
	</div>	
 
	<!-- Timepicker Start /////////////////////////////////////-->
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>	
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>근태현황</h3>
	    </div>
    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    	<div class="form-group row"> 
			  <div class="col-xs-1">
	    		<button type="button" id="checkin" class="btn btn"  >출석</button>
	    	  </div>
			  <div class="col-xs-1">
	    		<button type="button" id="checkout" class="btn btn">퇴근</button>
	    	  </div>		    	  	
			</div>			
		</div>
		
		<div class="row">	    		    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">	    			      
			      
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>부서</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>이름</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>				  
				  <input type="hidden" id="employeeNo" name="employeeNo" value="${sessionScope.employee.employeeNo}"/>
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >부서</th>
            <th align="left">직급</th>
            <th align="left">이름</th>
            <th align="left">출근일자</th>
            <th align="left">출근시간</th>
            <th align="left">출근IP</th>
            <th align="left">퇴근일자</th>
            <th align="left">퇴근시간</th> 
            <th align="left">퇴근IP</th>
            <th align="left">비고</th>           
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="attendance" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			   <td align="left" >${attendance.departmentName}</td>
			  <td align="left">${attendance.positionName}</td>
			  <td align="left">${attendance.employeeName}</td> 
			  <td align="left">${attendance.attendateDate}</td>				  
			  <td align="left">${attendance.startTime}</td>	
			  <td align="left">${attendance.startIp}</td> 
			  <td align="left">${attendance.leaveDate}</td> 
			  <td align="left">${attendance.endTime}</td> 
			  <td align="left">${attendance.endIp}</td>	
			  <td align="left">${attendance.memo}</td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>