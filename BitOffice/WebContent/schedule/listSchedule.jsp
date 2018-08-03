<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset='utf-8' />

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />



 <link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css' rel='stylesheet'> 
 <link type="text/css" href='/css/fullcalendar.min.css' rel='stylesheet' /> 
 <link href='/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
 <script type="text/javascript" src='/javascript/moment.min.js'></script> 
  <!-- //주석해야 조직도가 나옴 <script type="text/javascript" src='/javascript/jquery.min.js'></script>  --> 
 <script type="text/javascript" src='/javascript/fullcalendar.min.js'></script>  
 
  <script type="text/javascript" src='/javascript/theme-chooser.js'></script>   
 
  <script type="text/javascript" src='/javascript/gcal.js'></script>   
  <script type="text/javascript" src='/javascript/locale-all.js'></script>  


<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>


<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com"></script>  

	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->

 <!-- bootstrap datetimepicker -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" integrity="sha256-yMjaV542P+q1RnH6XByCPDfUFhmOafWbeLPmqKh11zo=" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js" integrity="sha256-5YmaxAwMjIpMrVlK84Y/+NjCpKnFYa8bWWBbUHSBGfU=" crossorigin="anonymous"></script>

<script>
	
  $(document).ready(function() { 				

    initThemeChooser({

      init: function(themeSystem) {
        $('#calendar').fullCalendar({
        	
        /*******************/	
        
        
       	//local: 'ko',			
		//lang: 'ko',			
		firstDay: '0',  
		//nowIndicator: true,
	    //now: '2018-06-20T09:25:00', // just for demo
		displayEventTime: true,	// 
		//displayEventEnd: false, //
		
		//height:700,
		contentHeight: 650,
		selectable: true, 
		//selectHelper: false,
		eventLimit: true,
		
		/*******************/
		
          //themeSystem: 'bootstrap3',
          header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay,listMonth'
          },
          
          //defaultDate: '2018-06-12',          

          weekNumbers: false,
          navLinks: true, // can click day/week names to navigate views
          editable: false,
          eventLimit: true, // allow "more" link when too many events   

          googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE",      // Google API KEY

          eventSources : [
                      
              {            	  
                   googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com"
                 , className : "koHolidays"
                 , color : "#FF0000"
                 , textColor : "#FFFFFF"                
              }
 		   ]
          ,events: 	 '/schedule/json/listSchedule/'+$('#employeeNo').val()       
          
  
       	//  ,eventTextColor: 'yellow'
		//, eventColor: '#378006'	
		//, eventBackgroundColor: '#378006'
		//, eventBorderColor: '#378006'          
           ,timeFormat: 'HH(:mm)'
        
          
           	// , selectHelper: true     		
     		   // ,select: function(startDate, endDate) {
     		   //       alert('selected ' + startDate.format() + ' to ' + endDate.format());
     		   //     } 
   			
        	   ,select: function(startDate, endDate	) {
              
                   var view = $('#calendar').fullCalendar('getView');                   
                                    
                   $('#schedule_modal').modal('show');                   
                   $('#schedule_modal').find('input').val('');
                   $('#schedule_modal').find('#starts-at').val(startDate.format());
                   if (view.name == 'month'){
                  	 $('#schedule_modal').find('#ends-at').val(date_add(endDate.format(), -1));
                   }else{
                	 $('#schedule_modal').find('#ends-at').val(endDate.format());  
                   } 
                   
                   $('#shareGubun').val('2').prop("selected", true);                   
                   $('#headerTitle').text('일정작성'); 
                   $('#save-event').text('등록');                 
                   $('#save-event').show();  
                   $('#delete-event').hide();
                   $('#writer_title').hide(); 
                   $('#writername').hide(); 
  

               }
               ,eventClick: function(event, element) {
             	   $('#schedule_modal').modal('show');   
                   $('#schedule_modal').find('input').val('');                   
                   $('#schedule_modal').find('#scheduleNo').val(event.id);
                   $('#schedule_modal').find('#title').val(event.title);
                   $('#schedule_modal').find('#content').val(event.description);
                   $('#schedule_modal').find('#starts-at').val(event.start.format('YYYY-MM-DD'));
                   $('#schedule_modal').find('#ends-at').val(event.end.format('YYYY-MM-DD'));
                   $('#schedule_modal').find('#start-time').val(event.start.format('HH:mm'));
                   $('#schedule_modal').find('#end-time').val(event.end.format('HH:mm'));    
                   $('#schedule_modal').find('#writername').val(event.writername);  
                   $('#schedule_modal').find('#writer').val(event.writer);     
                   
                   hearBgColor
                   $('#hearBgColor').css('background-color',event.backgroundColor);
                   $('#headerTitle').text('일정조회');   
                   $('#shareGubun').val(event.sharerange).prop("selected", true);
              		$('#writername').show();
               		$('#writer_title').show(); 			
            	   //alert( $('#employeeNo').val()+"=="+$('#writer').val());
            	   
            	   //작성자와 세션 일치할 경우
            	   if ($('#employeeNo').val().indexOf($('#writer').val())>=0){                  		
    					$('#schedule_modal').find('#save-event').text('수정'); 
            		    $('#save-event').show();                   	
                   		$('#delete-event').show();
            	   }else{
                  		$('#save-event').hide();
                   		$('#delete-event').hide();  
            	   }
               },
               
/* 		  eventClick: function(calEvent, jsEvent, view) {

			    alert('Event: ' + calEvent.title);
			    //alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
			    //alert('View: ' + view.name);

			    // change the border color just for fun
			    //$(this).css('border-color', 'red');
			    



			  }  */		
  			
  			/* 			
  			,
  			dayClick: function(date, jsEvent, view) {
  				alert('Clicked on: ' + date.format());
  				//alert('Resource ID: ' + resourceObj.id);
  				//alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
  				//alert('Current view: ' + view.name);
  				//alert('Current id: ' + resourceObj.id);
  			}
  			
  			
  			
  			,
  			dayClick: function(date, jsEvent, view) {
  				alert('Clicked on: ' + date.format());
  				var m = moment();
  				//alert('Resource ID: ' + resourceObj.id);
  				//alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
  				//alert('Current view: ' + view.name);
  				//alert('Current id: ' + resourceObj.id);
  			}
  			
  		
  			,
  			eventMouseover: function(event, jsEvent, view) {
  				alert('Mouse over: ' + date.format());
  				//alert('Resource ID: ' + resourceObj.id);
  				//alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
  				//alert('Current view: ' + view.name);
  				//alert('Current id: ' + resourceObj.id);
  			}	 	

  			,
  			unselect: function(jsEvent, view) {
  				alert('Clicked on: ' + view.name);
  				//alert('Resource ID: ' + resourceObj.id);
  				//alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
  				//alert('Current view: ' + view.name);
  				//alert('Current id: ' + resourceObj.id);
  			}	*/          
        });
        
        //$("#starts-at, #ends-at").datetimepicker({
        	//format: 'LT',
        //	locale: 'ru',
        //	sideBySide:true        	
        //});

        $("#starts-at, #ends-at").datetimepicker({
        	format: 'YYYY-MM-DD',
        	sideBySide:false  
        	//pick12HourFormat: false
        });
    
       
       $("#start-time, #end-time").datetimepicker({
       	format: 'HH:mm',
       	sideBySide:false  
       	//pick12HourFormat: false
       });       
        
        
        // 일정등록
        $('#save-event').on('click', function() {
        	var scheduleNo = $('#scheduleNo').val();
        	var title = $('#title').val(); 
            var content = $('#content').val();      
            var sdate = $('#starts-at').val();   
            var edate = $('#ends-at').val();
            var stime = $('#start-time').val();   
            var etime = $('#end-time').val();            
            var title = $('#title').val();     
            var employeeNo = $('#employeeNo').val();
            var shareGubun =  $( "#shareGubun option:selected" ).val();    

            //alert("shareGubun:"+shareGubun);
            
            if(sdate.length<8){
            	alert("Insert Start-time");
            	$('#starts-at').focus();
            	return
            }
            
            if(edate.length<8){
            	alert("Insert End-time");
            	$('#ends-at').focus();
            	return
            }
            
            if(sdate > edate){
            	alert("rewrite sdate <= edate ");
            	$('#ends-at').focus();
            	return
            }            
            
            if(stime.length<5){
            	alert("Insert Start-time");
            	$('#start-time').focus();
            	return
            }
            
            if(etime.length<5){
            	alert("Insert End-time");
            	$('#end-time').focus();
            	return
            }
            
            if(stime > etime){
            	alert("rewrite star-time <=End-time");
            	$('#end-time').focus();
            	return
            }            
            
            if(title.length<1){
            	alert("Insert Title");
            	$('#title').focus();
            	return
            }             
            
            
            if (title) {
	            //save  

	            if ($('#save-event').text().trim().indexOf('등록')>=0){	            	
		            	$.ajax({
		            		url : "/schedule/json/addSchedule",
							method : "POST" ,
							data : { 	
								"title": title,
								"content": content,
								"startDate":sdate ,
								"endDate":edate ,
								"startTime":stime ,
								"endTime":etime ,									
								"shareRange":shareGubun,
								"color": '#0099ff',							
								"employeeNo":employeeNo
										} ,	
							contentType : "application/x-www-form-urlencoded; charset=UTF-8",
							dataType : "json" ,
							success : function(returnValue, status) {
								if (returnValue == 1){ 
									alert("등록되었습니다");
									location.reload();
								}else{
									alert("등록 실패! 관리자에게 문의!");									
								}
							},
							error : function(request, status,error) {
						        alert("등록 접속 error");
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    }							
					}); 	            	
	            	
	            }else{  //moify
	            	
			            	$.ajax({
			            		url : "/schedule/json/updateSchedule",
								method : "POST" ,
								data : { 	
									"scheSerialNo":scheduleNo,
									"title": title,
									"content": content,
									"startDate":sdate ,
									"endDate":edate ,
									"startTime":stime ,
									"endTime":etime ,	
									"shareRange":shareGubun,
									"color": '#0099ff'
								} ,	
								contentType : "application/x-www-form-urlencoded; charset=UTF-8",
								dataType : "json" ,
								success : function(returnValue, status) {
									if (returnValue == 1){ 
										alert("수정되었습니다");
										location.reload();
									}else{
										alert("수정 실패! 관리자에게 문의!");									
									}
								},
								error : function(error) {
							        alert("수정 접속 error");
							    }	
						}); 
          

	            }//if
            }
            
            // Clear modal inputs
            $('#schedule_modal').find('input').val('');

            // hide modal
            $('#schedule_modal').modal('hide');
        });
        /////end save-event

        // 일정 삭제
        $('#delete-event').on('click', function() {
            var scheduleNo = $('#scheduleNo').val();
        	//var title = $('#title').val();            
            var employeeNo = $('#employeeNo').val().trim();
            //var shareGubun =  $('input[name=shareGubun]:checked').val();         
            var writer = $('#writer').val();

             if (scheduleNo.length>0 && employeeNo.indexOf(writer)>=0) {

	            //delete  	          
	            
	 	            $.ajax( 
							{
								
								url : "/schedule/json/deleteSchedule/"+scheduleNo,	
								method : "POST" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},								
								success : function(returnValue, status) {
									if (returnValue == 1){ 
										alert("삭제되었습니다");
										location.reload();
									}else{
										alert("삭제 실패! 관리자에게 문의!");									
									}
								},
								error : function(error) {
							        alert("삭제 접속 error");
							    }	
									
					
				});             

                
            }else{
            	alert("자신이 작성한 글만 삭제가능합니다");	 
            }
            
         
           // $('#calendar').fullCalendar('unselect');

            // Clear modal inputs
            $('#schedule_modal').find('input').val('');

            // hide modal
            $('#schedule_modal').modal('hide');
        });   //  $('#delete-event')    
        
        
      },  //init: function(themeSystem)   
   

      change: function(themeSystem) {
        $('#calendar').fullCalendar('option', 'themeSystem', 'bootstrap3');
      }  

    });  //initThemeChooser({

  });//$(document).ready(function() { 


  
  function date_add(sDate, nDays) {

	    var yy = parseInt(sDate.substr(0, 4), 10);
	    var mm = parseInt(sDate.substr(5, 2), 10);
	    var dd = parseInt(sDate.substr(8), 10);	 

	    d = new Date(yy, mm - 1, dd + nDays);	 

	    yy = d.getFullYear();
	    mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
	    dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;	 

	    return '' + yy + '-' +  mm  + '-' + dd;

	}
  
</script>
<style>

  body {
    margin: 0;
    padding: 0;
    font-size: 14px;
  }

  #top,
  #calendar.fc-unthemed {
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
  }

  #top {
    background: #eee;
    border-bottom: 1px solid #ddd;
    padding: 0 10px;
    line-height: 40px;
    font-size: 12px;
    color: #000;
  }

  #top .selector {
    display: inline-block;
    margin-right: 10px;
  }

  #top select {
    font: inherit; /* mock what Boostrap does, don't compete  */
  }

  .left { float: left }
  .right { float: right }
  .clear { clear: both }

  #calendar {
    max-width: 850px;
    margin: 40px auto;
    padding: 0 10px;
  }
  
	.fc-sun {color:#e31b23}
	.fc-sat {color:#007dc3}

</style>
</head>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<%-- <jsp:include page="/layout/toolbar.jsp" /> --%>
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	
  <div id='top' style="display:none;">

    <div class='left'>

      <div id='theme-system-selector' class='selector'>
        Theme System:

        <select>
          <option value='bootstrap4' selected>Bootstrap 4</option>
          <option value='bootstrap3'>Bootstrap 3</option>
          <option value='jquery-ui'>jQuery UI</option>
          <option value='standard'>unthemed</option>
        </select>
      </div>

      <span id='loading' style='display:none'>loading theme...</span>

    </div>


  </div>

  <div id='calendar'><input type="hidden" id="employeeNo" name="employeeNo" value="${sessionScope.employee.employeeNo}"/>		</div>



	<div id='datepicker'></div>
	
		<!-- Modal -->
	
	
	<div id="schedule_modal" class="modal fade" tabindex="-1" role="dialog">
		<form name="detailForm">	
			    	<br><br><br><br><br><br><br>
			  		<br><br><br><br><br><br><br>						
			    <div class="modal-dialog" role="document">
			        <div class="modal-content">
			            <div class="modal-header p-3 mb-2 bg-success text-white" id="hearBgColor" >                
			                <h4 class="modal-title text-center" id="headerTitle"></h4>
			            </div>
			            <div class="modal-body">   
			                <div class="row">
			                    <div class="col-xs-12">
			                        
			                        <input type="hidden" name="scheduleNo" id="scheduleNo"/>		                                        
			                    </div>
			                </div>		                              
			                <div class="row">
			                    <div class="col-xs-12">
			                        <label class="col-xs-4" for="starts-at">시작일자</label>
			                        <input type="text" name="starts_at" id="starts-at" />		                                        
			                    </div>
			                </div>
			                <div class="row">
			                    <div class="col-xs-12">
			                        <label class="col-xs-4" for="ends-at">종료일자</label>
			                        <input type="text" name="ends_at" id="ends-at" />
			                    </div>
			                </div>
			                <div class="row">
			                    <div class="col-xs-12">
			                         <label class="col-xs-4" for="start-time">시작시간</label>
			                        <input type="text" name="start_time" id="start-time" />		                                        
			                    </div>
			                </div>
			                <div class="row">
			                    <div class="col-xs-12">
			                        <label class="col-xs-4" for="end-time">종료시간</label>
			                        <input type="text" name="end_time" id="end-time" />
			                    </div>
			                </div>   
			                <div class="row">
			                    <div class="col-xs-12">
			                        <label class="col-xs-4" for="share">공유범위</label>		                        
									    <select id="shareGubun" class="selectpicke" name="shareGubun" id="shareGubun" style="width:auto;">
											<option value="1">나만보기</option>
											<option value="2" >나&공유요청자</option>	
											<option value="3" >전체공유</option>			
										</select>
								                  
			                    </div>
			                </div>                               
			                <div class="row">
			                    <div class="col-xs-12">
			                        <label class="col-xs-4" for="title">제목</label>
			                        <input type="text" name="title" id="title" maxlength="40"/>
			                        
			                    </div>
			                </div>
			                <div class="row">
			                    <div class="col-xs-12">
			                        <label class="col-xs-4" for="content">내용</label>
			                        <input type=text name="content" id="content" maxlength="70" />
			                    </div>
			                </div> 
			                <div class="row">
			                    <div class="col-xs-12">
			                        <label class="col-xs-4" for="writername" id="writer_title">작성자</label>
			                        <input type=text name="writername" id="writername" style="border:0"/>
			                    </div>
			                </div> 
			                <input type=hidden name="writer" id="writer"/>               	                  
			            </div>
			            <div class="modal-footer">
			            	<button type="button" class="btn btn-primary" id="save-event">등록</button> 
			            	<button type="button" class="btn btn-primary" id="delete-event">삭제</button> 
			                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>                
			            </div>
			        </div><!-- /.modal-content -->
			    </div><!-- /.modal-dialog -->
		</form>		
	</div><!-- /.modal -->


	
</body>
</html>
