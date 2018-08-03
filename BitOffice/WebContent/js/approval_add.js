	$(function () {  	
		
		   
		if ($("#employeeNo").val().trim().length<1){
			alert("세션 유지실패! 다시 로그인하세요!");
		}
		
		$(function () {
			//summernote
			$('#content').summernote({
				placeholder : 'Write contents',
				height : 300,
				callbacks : {
					onImageUpload : function(files, editor, welEditable) {
						for (var i = files.length - 1; i >= 0; i--) {
							sendFile(files[i], this);
						}
					}
				},
				minHeight : null, // set minimum height of editor
				maxHeight : null, // set maximum height of editor
				focus : false, // 페이지가 열릴때 포커스를 지정함
				lang : 'ko-KR' // 한국어 지정(기본값은 en-US)
			});
		
		})
		
		function sendFile(file, editor) {
			var form_data = new FormData();
			form_data.append('file', file);
		
			$.ajax({
						data : form_data,
						type : "POST",
						url : "/board/json/imageUpload",
						cache : false,
						contentType : false,
						enctype : 'multipart/form-data',
						processData : false,
						success : function(url) {
							console.log(JSON.stringify(url));
			        		console.log(url.url);
			          		$('#content').summernote('editor.insertImage',url.url);
		
						}
					});
		}		
		
	    $("#authorizationPerson").sortable();
	    $("#authorizationPerson").disableSelection();
	    $("#referencePerson").sortable();
	    $("#referencePerson").disableSelection();	
	    
   		//조직도 조회
        $.ajax( 
			{				
				url : "/organization/json/listOrganization",	
				method : "POST" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
						createJSTree(JSONData);		
				},	
				error : function(error) {
			        alert("조직도조회실패!");
			    }

		});  //////////조직도 조회
		
		
   		//결재라인 조회
        $.ajax( 
			{				

				url : "/approvalEmployee/json/listApprovalEmployee/"+$('#approvalNo').val(),
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"			
				},
				success : function(jsonInfo , status) {						
						
						//alert("여기:"+jsonInfo);
						
						if (jsonInfo){
							
							//결재라인
							var approvalTable="";	
							
							//결재라인 히든 추가
							var app_member="";
							//참조라인 히든 추가
							var ref_member="";
							
							$('#seungin').remove();
							 
							var middleTdWidth=50;
							
							$.each(jsonInfo,function(key,value) {
								var approvalDate="";
								var signImage="";
								middleTdWidth-=(key*5);
								
								if (value.gubun==1){//결재라인
									 if (value.approvalDate!=null){
									 	approvalDate = value.approvalDate;
									 }
									 if (value.status=="1"){
										 status = "";
									 }else if(value.status=="2"){
										 status = "승인";
									 }else if(value.status=="3"){
										 status = "반려";
									 }
									 
					       	        if (key==0){
						       	    	approvalTable+="<td id='seungin' style='width:5%;vertical-align:middle;background-color:#D5D5D5;'>승<br><br><br>인</td>";					       	    	
					       	        }										 
									 
				       	      		 approvalTable+="<td style='width:13%;' name='eachApprovalPerson'><table class='table table-bordered' style='text-align: center; vertical-align:middle;boder: 1px solid #dddddd'>";
				        		 	 approvalTable+="<tr><td'>"+value.positionName+"</td></tr>";											
				        		 	 approvalTable+="<tr><td>"+value.employeeName+"</td></tr>";
				        		 	 approvalTable+="<tr height='20px'><td>"+approvalDate+"</td></tr>";	
				        		 	 approvalTable+="<tr height='20px'><td style='color:#FF0000;'>"+status+"</td></tr>";        		 	
				        		 	 approvalTable+="</table></td>"; 
				        		 	 
				        		 	 app_member+="<input type='hidden' name='approvalArray' value='"+value.employeeNo+"'>";
								}else{//참조라인
									 ref_member+="<input type='hidden' name='referenceArray' value='"+value.employeeNo+"'>";
								}
								
								
							});		
							
							$("#middleTd").css('width',middleTdWidth+'%');
							
							$("#approvalLine").append(approvalTable);
							$("#approval_member").append(app_member);
							$("#reference_member").append(ref_member);
						}
				},	
				error : function(request, status,error) {
			        alert("결재라인조회실패!");
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	
			    }


		});  //////////결재라인 조회		
	
	});


	
	
	
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
            var parent = data.instance.get_node(data.selected).parent;        //parent 가져오기
            var text = data.instance.get_node(data.selected).text;        //text 가져오기
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
     

   		
   		//============= "결재자 선택"  Event  처리 =============	
         $("#sel1").click(function(){

           	var approvalEmployeeNo = $('#SimpleJSTree').jstree('get_selected');      	               	
         
            if (approvalEmployeeNo.length >7){
            	alert("결재자는 최대 7명 등록 가능합니다");
            	return;
            }
          	for (var i=0;i<approvalEmployeeNo.length;i++) {
          		if (approvalEmployeeNo[i].length>2){
          			
          			var approvalEmployeeName = $("#SimpleJSTree").jstree('get_selected', true)[i].text;	
          			var li_span ="";
          			li_span +="<li style='background-color:#ffffff;width:160px;height:30px;' id='auth_"+approvalEmployeeNo[i]+"' employInfo='"+approvalEmployeeName+"'>";
      				li_span +="<span class='ui-icon ui-icon-arrowthick-2-n-s'></span><h6>"+approvalEmployeeName+" <a onclick=del('auth_"+approvalEmployeeNo[i]+"')>삭제</a></h6></li>";
      				$("#authorizationPerson").append(li_span);
         		
         			
          		}
         	}  

         	$('#SimpleJSTree').jstree(true).deselect_all();
         		
		}); 
   		
   		
       //============= "참조인 선택"  Event  처리 =============	 
         $("#sel2").click(function(){

          	var approvalEmployeeNo = $('#SimpleJSTree').jstree('get_selected');
               	
            if (approvalEmployeeNo.length >7){
            	alert("참조인은 최대 7명 등록 가능합니다");
            	return;
            }
            
           	for (var i=0;i<approvalEmployeeNo.length;i++) {           		
           		if (approvalEmployeeNo[i].length>2){           			
           			
          			var approvalEmployeeName = $("#SimpleJSTree").jstree('get_selected', true)[i].text;	
          			var li_span ="";
	          			li_span +="<li style='background-color:#ffffff;width:180px;height:30px;' id='ref_"+approvalEmployeeNo[i]+"'>";
	      				li_span +="<h6>"+approvalEmployeeName+" <a onclick=del('ref_"+approvalEmployeeNo[i]+"')>삭제</a></h6></li>";
     			$("#referencePerson").append(li_span); 
     			
           		}
          	}  

          	$('#SimpleJSTree').jstree(true).deselect_all();
          		
 		});   
         
        //모달창에서 선택된 결재자, 참조인 기안폼으로 보내기 
         $("#personSubmit").click(function(){
       	 	
       	 	//승인 결재자 초기화
       	 	$("td[name=eachApprovalPerson]").remove();
       	 	
       	 	//모달창 결재라인 초기화
       	    $("input[name=approvalArray]").remove();
       	 
       	    $('#seungin').remove();
       	 
       	 	var middleTdWidth=50;
       	 
       	 	
       	 	//승인 결재자  선택 역순으로 가져오기 
       	 	

       	    $($('#authorizationPerson li').get().reverse()).each(function(i){       	       
       	         
       	         var approvalTable ="";       	      	 
       	         var thisId = $(this).attr('id').replace('auth_','');       	         
       	         var employInfo = $(this).attr('employInfo').split(' ');
	       	     var thisPosion = employInfo[0];
	       	   	 var thisName = employInfo[1];
       	       
	       	  	 middleTdWidth-=(i*10);
	       	  	 
	       	     if( i==0){
		       	   	approvalTable+="<td id='seungin' style='width:5%;vertical-align:middle;background-color:#D5D5D5;'>승<br><br><br>인</td>";
		       	 }	       	  	 
       	         
       	         if (thisId.trim().length>5){           	    
       	      		 approvalTable+="<td style='width:13%' name='eachApprovalPerson'><table class='table table-bordered' style='text-align: center; boder: 1px solid #dddddd'>";
        		 	 approvalTable+="<tr><td>"+thisPosion+"</td></tr>";											
        		 	 approvalTable+="<tr><td>"+thisName+"</td></tr>";
        		 	 approvalTable+="<tr height='20px'><td></td></tr>";	
        		 	 approvalTable+="<tr height='20px'><td></td></tr>";        		 	
        		 	 approvalTable+="</table></td>";        		 	
        		 	 
        		 	$("#middleTd").css('width',middleTdWidth+'%'); 
        		 	
        		 	$("#approvalLine").append(approvalTable); 
        		 	$("#approval_member").append("<input type='hidden' name='approvalArray' value='"+thisId+"'>");
        		 	
       	         }
	   			      	        
       	    });	
			
			//참조인은 Hiddenm으로 추가
       	 	//모달창 결재라인 초기화
       	    $("input[name=referenceArray]").remove();
			
       	    $('#referencePerson li').each(function(){
       	    	
       	    	var thisId = $(this).attr('id').replace('ref_','');
       	    	$("#reference_member").append("<input type='hidden' name='referenceArray' value='"+thisId+"'>"); 
       	    	
       	    });	        	  

          	$('#selectTypeModal').modal('hide');
         });        
         
         
        //조직도 접기,펴기
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
    
    //선택된 결재자 ,참조인 삭제시
    function del(a){
      		$("li").remove("#"+a);
       }      

	function fncAddApproval() {		

		var docType = $("#docType").val().trim();
		var approvalOrder = $("#approvalOrder").val().trim();
		
		var title = $("#title").val().trim();
		var content = $("#content").val().trim();		

		var cnt = 0;
		
		var reqDate = $("#reqDate").val().trim().replace(/-/g,'');
				
		var approvalCnt = 0;
		var referenceCnt = 0;
		
		var reqDate = $("#reqDate").val().trim().replace(/-/g,'');
				
		
		//결재자 수
 		$("input[name='approvalArray']").each(function(i){
			//alert("hello"+$("input[name='approvalArray']").eq(i).val());		
 			approvalCnt += 1;
		});
		
		//참조인 수
 		$("input[name='referenceArray']").each(function(i){
			//alert("hello"+$("input[name='approvalArray']").eq(i).val());		
 			referenceCnt += 1;
		});	
		
 		if(approvalCnt==0){
 			alert("결재라인을 선택하세요");
 			return;
 		}
		
 		
		
		if(docType.indexOf("1")>=0){
			var start_date = $("#start_date").val().trim();
			var end_date = $("#end_date").val().trim();
			var use_day = $("#use_day").val().trim();
			
			if(start_date.length<10){
				alert("시작일자를 입력하세요");
				$("#start_date").focus();
				return;
			}
			
			if(end_date.length<10){
				alert("종료일자를 입력하세요");
				$("#end_date").focus();
				return;
			}			
		}
		
		if(title.length<1){
			alert("제목을 입력하세요");
			$("#title").focus();
			return;
			
		}
		
		if(content.length<1){
			alert("내용을 입력하세요");
			$("#content").focus();
			return;
		}
		

		if(docType.indexOf("1")>=0){ 
			var data1={ 	
					"docNo": 			$("#approvalNo").val().trim(),
					"startDate": 		$("#start_date").val().replace(/-/g,''),
					"endDate": 			$("#end_date").val().replace(/-/g,''),									
					"useDay":			$("#use_day").val(),
					"title": 			$("#title").val().trim(),							
					"content": 			$("#content").val().trim(),	
					"modEmployeeNo":	$("#employeeNo").val().trim(),
					"memo": 			null,
					"fileName1": 		$("#fileName1").val().trim().replace(/.*(\/|\\)/, ''),
					"fileName2": 		$("#fileName2").val().trim().replace(/.*(\/|\\)/, ''),
					"fileName3": 		$("#fileName3").val().trim().replace(/.*(\/|\\)/, '')				
						}
		}else{
			var data1={ 	
					"docNo": 			$("#approvalNo").val().trim(),
					"title": 			$("#title").val().trim(),							
					"content": 			$("#content").val().trim(),	
					"modEmployeeNo":	$("#employeeNo").val().trim(),
					"memo": 			null,
					"fileName1": 		$("#fileName1").val().trim().replace(/.*(\/|\\)/, ''),
					"fileName2": 		$("#fileName2").val().trim().replace(/.*(\/|\\)/, ''),
					"fileName3": 		$("#fileName3").val().trim().replace(/.*(\/|\\)/, '')				
						}
		}
	
				//기안 수정
			    	$.ajax({
		    		url : "/approval/json/updateApproval",
					method : "POST" ,
					data : data1 ,	
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					dataType : "text" ,
					success : function(resultValue, status) {
						//alert("resultValue:"+resultValue);
						if (resultValue.indexOf(1)>=0){ 
							
							//alert("등록되었습니다");
							
							var regApprovalOk = 0;
							var regReferenceOk = 0;
							
 						    //결재라인, 참조인 삭제
				            $.ajax( 
									{
										
										url : "/approvalEmployee/json/deleteApprovalEmployee",	
										method : "POST" ,
										data : { 	
											"docNo": $("#approvalNo").val().trim()		
													} ,	
										contentType : "application/x-www-form-urlencoded; charset=UTF-8",
										dataType : "text" ,							
										success : function(returnValue, status) {
													//결재자 재등록					
											 		$("input[name='approvalArray']").each(function(i){
													//alert("approval:"+$("input[name='approvalArray']").eq(i).val());	
														
											 	    	$.ajax({
											 	    		url : "/approvalEmployee/json/addApprovalEmployee",
															method : "POST" ,									
															data : { 
																"gubun"			: '1',
																"status"		: '1',
																"approvalOrder" : approvalCnt-i,								
																"employeeNo"	: $("input[name='approvalArray']").eq(i).val(),
																"docEmployeeNo" : $("#employeeNo").val().trim()									
																		} ,	
															contentType : "application/x-www-form-urlencoded; charset=UTF-8",
															dataType : "text" ,
															success : function(resultValue, status) {
																
																if (resultValue.indexOf(1)>=0){ 											
																	//alert("결재자등록되었습니다 i:"+i);											
																	
																}else{
																	//alert("결재자등록실패되었습니다 i:"+i);
																	regApprovalOk -= 1
																}
															},
															error : function(error) {
														        alert("결재자등록 접속 error");
														        regApprovalOk -= 1
														    }
														});//ajax
										 		});//each(function(i) 
								 				
												//참조인 재등록					
											 		$("input[name='referenceArray']").each(function(i){
													//alert("refence:"+$("input[name='referenceArray']").eq(i).val());	
														
											 	    	$.ajax({
											 	    		url : "/approvalEmployee/json/addApprovalEmployee",
															method : "POST" ,									
															data : { 
																"gubun"			: '2',
																"status"		: '1',
																"approvalOrder" : i+1,								
																"employeeNo"	: $("input[name='referenceArray']").eq(i).val(),
																"docEmployeeNo" : $("#employeeNo").val().trim()										
																		} ,	
															contentType : "application/x-www-form-urlencoded; charset=UTF-8",
															dataType : "text" ,
															success : function(resultValue, status) {	
																
																//alert("참조인 resultValue:"+resultValue);
																
																if (resultValue.indexOf(1)>=0){ 											
																	//alert("참조인등록되었습니다 i:"+i);											
																	
																}else{
																	//alert("참조인등록실패되었습니다 i:"+i);
																	regApprovalOk -= 1
																}
															},
															error : function(error) {
														        alert("참조인등록 접속 error");
														        regApprovalOk -= 1
														    }
														});//ajax
										 		});//each(function(i) 											
										},
										error : function(request, statu, error) {
									        alert("결재자, 참조인 삭제 접속 error");
									        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
									    }			
							
							});  	 				
							
					 				
					 		if (regApprovalOk<0 || regReferenceOk<0){
					 			//alert("문서 등록 성공/ 결재자&참조자 등록 실패\n 관리자에게 문의 regApprovalOk="+regApprovalOk+"/ regReferenceOk="+regReferenceOk);
					 		    alert("확인!!!!");
					 		}else{	 	
					 			//등록후 nav
					 			alert("수정되었습니다");
					 			location.reload();
								//location.href = "/approval/listApproval";
					 		}
						}else{
							alert("기안수정 실패! 관리자에게 문의!");									
						}
					},
					error : function(error) {
				        alert("기안수정 접속 error");
				    }							
			}); ////ajax 
		
	}////fncAddApproval

	//기안 등록 
	$(function() {
		$("#writeApproval").on("click", function() {
			fncAddApproval();
		});
	});
	
    //승인 반려 버튼 클릭시
	$(function() {
		 $("#permitApproval, #rejectApproval").on("click", function() {
			
			$('#permit_modal').modal('show');
			
			if ($(this).attr('id')=="permitApproval"){
			   $("#headerTitle").css("color","#0099FF")
			   $("#headerTitle").text('승인');
			   $("#say").val("Y");
			}else{
			   $("#headerTitle").css("color","#CC3333")
			   $("#headerTitle").text('반려');
			   $("#say").val("N");
			}

		});
		
		//승인모달닫기
		 $( "#modalClose" ).on("click" , function() {
			 $('#permit_modal').modal('show');    
		});
		
		//승인, 반려처리
	     $('#save-event').on('click', function() {
	    	   
	    	   // 1: 대기 2: 승인 3: 반려
	    	   var myStatus = "";
	    	   ($("#say").val() == "Y") ? myStatus="2" : myStatus="3";	    	   
	    	   
	    	   if($("#say").val() == "N" &&  $("#memo").val().length<1){
	    		   alert("반려시 메모는 필수입력입니다");
	    		   $("#memo").focus();
				   return;
	    	   }
	    	   
	    	   $.ajax( 
				{						
					url : "/approvalEmployee/json/updateApprovalEmployeeStatus",	
					method : "POST" ,
					data : { 	
						"docNo" : $('#approvalNo').val(),
						"status": myStatus,
						"memo"  : $("#memo").val(),
						"employeeNo": $('#employeeNo').val()							
								} ,	
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					dataType : "text" ,							
					success : function(returnValue, status) {
						//alert("승인처리 returnValue:"+returnValue);
						
							//기안 상태 수정  1. 대기   2. 진행중   3. 완료
					    	   $.ajax( 
								{						
									url : "/approval/json/updateApprovalStatus",	
									method : "POST" ,
									data : { 	
										"docNo" : $('#approvalNo').val(),
										"modEmployeeNo": $('#employeeNo').val()							
												} ,	
									contentType : "application/x-www-form-urlencoded; charset=UTF-8",
									dataType : "text" ,							
									success : function(returnValue, status) {
										//alert("승인처리 returnValue:"+returnValue);
										
										
										
										
										location.reload();
									},
									error : function(request, status, error) {
								        alert("승인처리 접속 error");
								        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								    }			
								});  						
						
						
						location.reload();
					},
					error : function(request, statu, error) {
				        alert("승인처리 접속 error");
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }			
				});  	   	 
	     });
	});	
    
		
		
	$(function() {
		 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#myFormSubmit").on("click" , function() {					
				if ($('#employeeNo').val().trim().length<1){
					alert("session 종료! 다시로그인해주세요.");
					return;
				}              
			
				jQuery("#selectTypeModal").modal('show');
			});

					 
	 });
	
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


	 
	
	 $(function() {
		 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 $( "#deleteApproval" ).on("click" , function() {
			  var approvalNo = $('#approvalNo').val();
			  
			  
			    //결재라인, 참조인 삭제
	            $.ajax( 
						{
							
							url : "/approvalEmployee/json/deleteApprovalEmployee",	
							method : "POST" ,
							data : { 	
								"docNo": approvalNo			
										} ,	
							contentType : "application/x-www-form-urlencoded; charset=UTF-8",
							dataType : "text" ,							
							success : function(returnValue, status) {
							},
							error : function(request, statu, error) {
						        alert("결재자, 참조인 삭제 접속 error");
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    }			
				
				}); 			    
			  
			    //기안문 삭제
	            $.ajax( 
						{
							
							url : "/approval/json/deleteApproval",	
							method : "POST" ,
							data : { 	
								"docNo": approvalNo			
										} ,	
							contentType : "application/x-www-form-urlencoded; charset=UTF-8",
							dataType : "text" ,							
							success : function(returnValue, status) {
								if (returnValue.indexOf(1)>=0){ 
									alert("삭제되었습니다");
									fncGetList(1);
								}else{
									alert("삭제 실패! 관리자에게 문의!");									
								}
							},
							error : function(error) {
						        alert("삭제 접속 error");
						    }			
				
				}); 
		});
	 }); 

	 
	 $(function() {
		 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 $( "#updateApproval" ).on("click" , function() { 
			 fncAddApproval();			  
		});
	 }); 	 
	 
	 $(function() {	
	     //승인,반려 권한 버튼 보이기 
		 $("input[name='approvalArray']").each(function(i){			 
			 alert("버튼");
			// alert("thisId:"+$("input[name='approvalArray']").eq(i).val());
		 });    
	 });
	 	 
	

	
	 // 파일 리스트 번호
    var fileIndex = 0;
    // 등록할 전체 파일 사이즈
    var totalFileSize = 0;
    // 파일 리스트
    var fileList = new Array();
    // 파일 사이즈 리스트
    var fileSizeList = new Array();
    // 등록 가능한 파일 사이즈 MB
    var uploadSize = 50;
    // 등록 가능한 총 파일 사이즈 MB
    var maxUploadSize = 500;
 
    $(function (){
        // 파일 드롭 다운
        fileDropDown();
    });
 
    // 파일 드롭 다운
    function fileDropDown(){
        var dropZone = $("#dropZone");
        //Drag기능 
        dropZone.on('dragenter',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#E3F2FC');
        });
        dropZone.on('dragleave',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#FFFFFF');
        });
        dropZone.on('dragover',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#E3F2FC');
        });
        dropZone.on('drop',function(e){
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#FFFFFF');
            
            var files = e.originalEvent.dataTransfer.files;
            if(files != null){
                if(files.length < 1){
                    alert("폴더 업로드 불가");
                    return;
                }
                selectFile(files)
            }else{
                alert("ERROR");
            }
        });
    }
 
    // 파일 선택시
    function selectFile(fileObject){
        var files = null;
 
        if(fileObject != null){
            // 파일 Drag 이용하여 등록시
            files = fileObject;
        }else{
            // 직접 파일 등록시
            files = $('#multipaartFileList_' + fileIndex)[0].files;
        }
        
     // 다중파일 등록
        if(files != null){
            for(var i = 0; i < files.length; i++){
                // 파일 이름
                var fileName = files[i].name;
                var fileNameArr = fileName.split("\.");
                // 확장자
                var ext = fileNameArr[fileNameArr.length - 1];
                // 파일 사이즈(단위 :MB)
                var fileSize = files[i].size / 1024 / 1024;

                if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml']) >= 0){
                    // 확장자 체크
                    alert("등록 불가 확장자");
                    break;
                }else if(fileSize > uploadSize){
                    // 파일 사이즈 체크
                    alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
                    break;
                }else{
                    // 전체 파일 사이즈
                    totalFileSize += fileSize;
                    
                    // 파일 배열에 넣기
                    fileList[fileIndex] = files[i];
                    
                    // 파일 사이즈 배열에 넣기
                    fileSizeList[fileIndex] = fileSize;
 
                    // 업로드 파일 목록 생성
                    addFileList(fileIndex, fileName, fileSize);
 
                    // 파일 번호 증가
                    fileIndex++;
                }
            }
        }else{
            alert("ERROR");
        }
    }
 
    // 업로드 파일 목록 생성
    function addFileList(fIndex, fileName, fileSize){
        var html = "";
        html += "<tr id='fileTr_" + fIndex + "'>";
        html += "    <td colspan='2' class='left' >";
        html +=         fileName + " / " + fileSize + "MB "  + "<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn small bg_02'>삭제</a>"
        html += "    </td>"
        html += "</tr>"
 
        $('#fileTableTbody').append(html);
    }
 
    // 업로드 파일 삭제
    function deleteFile(fIndex){
        // 전체 파일 사이즈 수정
        totalFileSize -= fileSizeList[fIndex];
        
        // 파일 배열에서 삭제
        delete fileList[fIndex];
        
        // 파일 사이즈 배열 삭제
        delete fileSizeList[fIndex];
        
        // 업로드 파일 테이블 목록에서 삭제
        $("#fileTr_" + fIndex).remove();
    }
 
    // 파일 등록
    function uploadFile(){
        // 등록할 파일 리스트
        var uploadFileList = Object.keys(fileList);
 
        // 파일이 있는지 체크
        if(uploadFileList.length == 0){
            // 파일등록 경고창
            alert("파일이 없습니다.");
            return;
        }
        
        // 용량을 500MB를 넘을 경우 업로드 불가
        if(totalFileSize > maxUploadSize){
            // 파일 사이즈 초과 경고창
            alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB");
            return;
        }
            
        if(confirm("등록 하시겠습니까?")){
            // 등록할 파일 리스트를 formData로 데이터 입력
            var form = $('#uploadForm');
            var formData = new FormData(form);
            for(var i = 0; i < uploadFileList.length; i++){
                formData.append('files', fileList[uploadFileList[i]]);
            }
            
            alert(formData);
            
//             $.ajax({
//                 url:"업로드 경로",
//                 data:formData,
//                 type:'POST',
//                 enctype:'multipart/form-data',
//                 processData:false,
//                 contentType:false,
//                 dataType:'json',
//                 cache:false,
//                 success:function(result){
//                     if(result.data.length > 0){
//                         alert("성공");
//                         location.reload();
//                     }else{
//                         alert("실패");
//                         location.reload();
//                     }
//                 }
//             });
        }
    }
    
  //예약날짜
    $(function(){  	
     	
        $("#start_date, #end_date").datepicker({
        	//format: 'YYYY-MM-DD',
        	dateFormat: "yy-mm-dd"
        	//sideBySide:false  
        	//pick12HourFormat: false
        });     	
     });  
    
    function getDateDiff(){

    	var date1 = $("#start_date").val();  
    	var date2 = $("#end_date").val();
    	
    	if (date1.length>0 && date1.length>0){
    	
        var arrDate1 = date1.split("-");
        var getDate1 = new Date(parseInt(arrDate1[0]),parseInt(arrDate1[1])-1,parseInt(arrDate1[2]));
        var arrDate2 = date2.split("-");
        var getDate2 = new Date(parseInt(arrDate2[0]),parseInt(arrDate2[1])-1,parseInt(arrDate2[2]));
        
        var getDiffTime = getDate2.getTime()-getDate1.getTime();

        $("#use_day").val(Math.floor(getDiffTime / (1000 * 60 * 60 * 24))+1);
    	}

    }
    
  
	 //숫자만	
	 function onlyNumber(obj) {
		    $(obj).keyup(function(){
		         $(this).val($(this).val().replace(/[^0-9]/g,""));
		    }); 
		}  

