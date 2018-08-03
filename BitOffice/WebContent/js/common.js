//=========게시판 목록 구성 ===================================
$(document).ready(function(){
        $.ajax({
           url:"/board/json/listBoard",
           method:"GET",
           datatype:"json",
           headers : {
                  "Accept" : "application/json",
                  "Content-Type" : "application/json"
               },
               success:function(data){

                  
                  for(var i=0; i<data.list.list.length; i++){
                     
                     $("#listBoard").append(
                        
                              '<tr><td>'+
                                 (i+1)+
                                 '</td><td id="getBoard" value="'+data.list.list[i].boardNo+'">'+
                                 data.list.list[i].boardTitle+
                                 '</td><td>'+
                                 data.list.list[i].boardDate+
                                 '</td><td>'+
                                 data.list.list[i].employeeName+
                                 '</td><td>'+
                                 data.list.list[i].boardCount+
                                 '</td></tr>'
                           );
                     
                  }
               }
        });
        });


$(document).on("click","#getBoard", function() {

		self.location = "/board/countView?boardNo=" + $(this).attr("value")
	});
//=========임직원 목록 구성 ====================================
$(document).ready(function(){
    $.ajax({
       url:"/employee/json/listEmployee",
       method:"GET",
       datatype:"json",
       headers : {
              "Accept" : "application/json",
              "Content-Type" : "application/json"
           },
           success:function(data){

              $("#countEmployee").append(
            		  '<h4>임직원</h4><p><b>'+
            		  data.resultPage.totalCount+
            		  '</b></p>'
              
              );
              
        	   
              for(var i=0; i<data.list.list.length; i++){
                 
                 $("#listEmployee").append(
                    
                          '<tr><td>'+
                             (i+1)+
	    '</td><td>'+
                             data.list.list[i].departmentName+
	    '</td><td>'+
                             data.list.list[i].positionName+
                             '</td><td id="getEmployee" value="'+data.list.list[i].employeeNo+'">'+
                             data.list.list[i].employeeName+
                             '</td><td>'+
                             data.list.list[i].email+
                             '</td><td>'+
                             data.list.list[i].extension+
                             '</td></tr>'
                       );
                 
              }
           }
    });
    });


	$(document).on("click" ,"#getEmployee", function() {
		
		 self.location ="/employee/getEmployee?employeeNo="+$(this).attr("value")
	});
	
	//=========전자결재 상태별 건수 docStatus: 1 대기 2 진행 3 완료  9 반려 목록 구성 ====================================
	$(document).ready(function(){      
		      
		    	$.ajax({
		    		url : "/approval/json/getTotalCountStatus",
					method : "POST" ,
					data : { 
						"docStatus": 		'1' ,			
						"regEmployeeNo":	'333333'			
								} ,	
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					dataType : "text" ,
					success : function(resultValue, status) {
						alert("returnValue:"+resultValue);
						if (resultValue.indexOf(1)>=0){ 							
							alert("전자결재 상태(1)조회되었습니다.");										
						}else{
							alert("전자결재 상태(1)조회실패! 관리자에게 문의!");									
						}
					},
					error : function(request, status,error) {
				        alert("전자결재 상태 조회 접속 error");
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }							
			}); ////ajax 
	    });	

