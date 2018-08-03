
//////////////////////////////list///////////////////////////
	            		
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
 		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/approval/listApproval").submit();
		}		
	
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default, #modalClose" ).on("click" , function() {
				fncGetList(1);
			});
		 }); 
		
			
			//============= "새결재등록 처리"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$("#writeApproval").on("click" , function() {					
					if ($('#employeeNo').val().trim().length<1){
						alert("session 종료! 다시로그인해주세요.");
						return;
					}              

					jQuery("#selectTypeModal").modal('show');
   
				});

						 
		 });
			
			//============= "새결재등록 다음 처리"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$("#myFormSubmit").on("click" , function() {					
					if ($('#employeeNo').val().trim().length<1){
						alert("session 종료! 다시로그인해주세요.");
						return;
					}              

					$("#modalForm").attr("method" , "POST").attr("action" , "/approval/addApprovalView").submit();
				});

						 
		 });	
			
		 $(function() {
				$( "td:nth-child(3)" ).on("click" , function() {
					 self.location ="/approval/getApproval?approvalNo="+$(this).text().replace(/-/g,'');
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
	
	
    function createJSTree(jsondata) {        	
        $('#SimpleJSTree').jstree({
            'core': {
                'data':
                		jsondata                    		
                	} 
                 ,'types': {
	                    'default' : {
                        'icon' :  'glyphicon glyphicon-user'
                    },                  	

          	      }
                 ,"contextmenu":{         
                	    "items": function($node) {
                	        var tree = $("#tree").jstree(true);
                	        return {
                	            "email": {
                	                "separator_before": false,
                	                "separator_after": false,
                	                "label": "메일",
                	                "action": function (obj) {                    	                	                 	                	
                	                	alert("메일호출");
                	                    //$node = tree.create_node($node);
                	                    //tree.edit($node);
                	                }
                	            },
                	            "채팅": {
                	                "separator_before": false,
                	                "separator_after": false,
                	                "label": "채팅",
                	                "action": function (obj) { 
                	                	alert("채팅호출");
                	                }
                	            },                         
                	            "화상회의": {
                	                "separator_before": false,
                	                "separator_after": false,
                	                "label": "화상회의",
                	                "action": function (obj) { 
                	                	alert("화상회의호출");
                	                }
                	            }
                	        };
                	    }
                	}                    
            ,'plugins' : [                	
            	"checkbox",
            	"contextmenu",
            	//"dnd",
            	//"massload",
            	//"search",
            	//"sort",
            	//"state",
            	//"html_data",
            	//"ui",
            	//"themes",                	
            	//"unique",
            	//"wholerow",
            	//"changed",
            	//"conditionalselect",
            	"types"
            ]
        });  
        
           //조직도하기
           $('#SimpleJSTree').bind('select_node.jstree', function(event, data){
            var id = data.instance.get_node(data.selected).id;        //id 가져오기
            var parent = data.instance.get_node(data.selected).parent;        //id 가져오기
            var text = data.instance.get_node(data.selected).text;        //id 가져오기
            var id2 = data.node.id;
           
            var employeeNo = $('#employeeNo').val();
            	if(employeeNo.length>0){
/*            	 		if(id.length>3){

                        if(parent !="#"){
                        	
                           }   	 					
   	 					
           	 		}else{
           	 			alert("부서 전체선택은 불가합니다");
           	 		} */
                }else{
                	alert("세션끊김. 다시 로그인해주세요");
                }
        }); 
           
   		//============= "조회"  Event  처리 =============	
   		 $(function() {
   			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
   			 $( "#modalClose" ).on("click" , function() {
   				location.reload();
   			});
   		 });
     
       
         $("#sel1").click(function(){

         	var jsfields = $('#SimpleJSTree').jstree('get_selected'); 
         	
         	var obj = $('#authorizationPerson li');

         	//alert(obj.length);
        	
 			obj.each( function(){
  				//alert("=="+$(this).text());
 			}); 			               	
         
          	for (var i=0;i<jsfields.length;i++) {
          		if (jsfields[i].length>2){
         			$("#authorizationPerson").append("<li class='ui-state-default' id='auth_"+jsfields[i]+"'><span class='ui-icon ui-icon-arrowthick-2-n-s'></span>"+jsfields[i]+"<a onclick=del('auth_"+jsfields[i]+"')>삭제</a></li>");
          		}
         	}  

         	$('#SimpleJSTree').jstree(true).deselect_all();
         		
		}); 
         
         $("#sel2").click(function(){

          	var jsfields = $('#SimpleJSTree').jstree('get_selected'); 
          	
          	var obj = $('#referencePerson li');
          	
  			obj.each( function(){

  			}); 			               	
          
           	for (var i=0;i<jsfields.length;i++) {
           		if (jsfields[i].length>2){  
           			$("#referencePerson").append("<li class='ui-state-default' id='ref_"+jsfields[i]+"'><span class='ui-icon ui-icon-arrowthick-2-n-s'></span>"+jsfields[i]+"<a onclick=del('ref_"+jsfields[i]+"')>삭제</a></li>");
           		}
          	}  

          	$('#SimpleJSTree').jstree(true).deselect_all();
          		
 		});          
         
         $("#allsee").click(function(){           	 
        	 if ($('#allsee').text() == '[조직도펼치기]'){      
        		$('#SimpleJSTree').jstree('open_all');					
				$('#allsee').text('[조직도접기]');             	 	
        	 }else{       
        		$('#SimpleJSTree').jstree('close_all');    
        		$('#allsee').text('[조직도펼치기]');
        	 }
        	 
        	 
         });
         

    }	
    
    function del(a){
      	 alert("삭제해줘:"+a);
      		$("li").remove("#"+a);
       }   
   
  
    	//
    
    //테이블 소팅
    function sortTable(n) {
    	  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
    	  table = document.getElementById("myTable2");
    	  switching = true;
    	  // Set the sorting direction to ascending:
    	  dir = "asc"; 
    	  /* Make a loop that will continue until
    	  no switching has been done: */
    	  while (switching) {
    	    // Start by saying: no switching is done:
    	    switching = false;
    	    rows = table.getElementsByTagName("TR");
    	    /* Loop through all table rows (except the
    	    first, which contains table headers): */
    	    for (i = 1; i < (rows.length - 1); i++) {
    	      // Start by saying there should be no switching:
    	      shouldSwitch = false;
    	      /* Get the two elements you want to compare,
    	      one from current row and one from the next: */
    	      x = rows[i].getElementsByTagName("TD")[n];
    	      y = rows[i + 1].getElementsByTagName("TD")[n];
    	      /* Check if the two rows should switch place,
    	      based on the direction, asc or desc: */
    	      if (dir == "asc") {
    	        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
    	          // If so, mark as a switch and break the loop:
    	          shouldSwitch = true;
    	          break;
    	        }
    	      } else if (dir == "desc") {
    	        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
    	          // If so, mark as a switch and break the loop:
    	          shouldSwitch = true;
    	          break;
    	        }
    	      }
    	    }
    	    if (shouldSwitch) {
    	      /* If a switch has been marked, make the switch
    	      and mark that a switch has been done: */
    	      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
    	      switching = true;
    	      // Each time a switch is done, increase this count by 1:
    	      switchcount ++; 
    	    } else {
    	      /* If no switching has been done AND the direction is "asc",
    	      set the direction to "desc" and run the while loop again. */
    	      if (switchcount == 0 && dir == "asc") {
    	        dir = "desc";
    	        switching = true;
    	      }
    	    }
    	  }
    	}    