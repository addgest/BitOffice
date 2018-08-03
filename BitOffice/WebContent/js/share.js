		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/share/updateShareView").submit();
		}		
	
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default, #modalClose" ).on("click" , function() {
				fncGetList(1);
			});
		 });
		
	
		 //숫자만	
		function onlyNumber(obj) {
			    $(obj).keyup(function(){
			         $(this).val($(this).val().replace(/[^0-9]/g,""));
			    }); 
		}
		 
		//삭제 
		function delShare(share_No) {
            $.ajax( 
				{
					
					//url : "/ip/json/addIp",	
					url : "/share/json/deleteShare/"+share_No,	
					method : "GET" ,
					dataType : "text" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},					
					success : function() {
							$("#modalmessage").text("삭제되었습니다");
							jQuery("#getMessageModal").modal('show');	

					},	
					error : function() {
						$("#modalmessage").text("삭제실패! 관리자에게 문의!");
						jQuery("#getMessageModal").modal('show');	
				    }							
			
			}); //ajax */ 			
	    }	
		
		function fnc_accept(status, shareNo) {	
				var msg;
				if(status.indexOf('N')>=0){
					var msg = "거절";
				}else{
					var msg = "수락";
				}			
			
	        	$.ajax({
	        		url : "/share/json/updateShare",
					method : "POST" ,
					data : { 	
						shareNo: shareNo,
						acceptStatus: status,
						shareColor: '#ABF200'
					} ,	
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					dataType : "text" ,
					success : function(JSONData , status) {	
						//출석 처리 조회되는 경우
						$("#modalmessage").text(msg+"처리 되었습니다");
						jQuery("#getMessageModal").modal('show');	
					
					},    	
					error : function(request, error) {
						$("#modalmessage").text(msg+" 처리 오류");
						jQuery("#getMessageModal").modal('show');		    						       
				    }	
				}); 			
			
		   }