//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/employee/resignList").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			$( "button.btn.btn-default:contains('검색')").on("click" , function() {
				fncGetList(1);
			}); 
		 });
		
		 $(function () {
				
				$.ajax({
					url:"/employee/json/treeEmployee",
					method:"GET",
					datatype : "json",
					headers:{
						"Accept" : "application/json",
						"Content-Type" : "application/json"
						
					},
					success:function(data){
						
						console.log(data)
						
						
						}
					
				});
			});
			 