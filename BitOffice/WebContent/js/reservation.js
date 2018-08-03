//ADD RESERVATION
function fncAddReservation(){	
	$("form").attr("method","POST").attr("action","/reservation/addReservation").submit();
}

$(function(){		
	
	$("button.btn.btn-default:contains('예약')").on("click",function(){
		
		fncAddReservation();
});
	
	$( "button.btn.btn-default:contains('취소')" ).on("click" , function() {
		$("form")[0].reset();
	});
	
});

$(function () {

	$.ajax({
		url:"/meetingRoom/json/getReserveMeetingRoom",
		method:"GET",
		datatype : "json",
		headers:{
			"Accept" : "application/json",
			"Content-Type" : "application/json"
			
		},
		success:function(data){
			console.log(data)

			for(var i=0; i<data.meetingRoom.length; i++ ){
				$("#mettingRoomName").append($('<option value='+data.meetingRoom[i].mettingRoomName+'>'+data.meetingRoom[i].mettingRoomName+'</option>'));
			}
		}
	});
});

//예약날짜

$(function(){
	
	$("#reserveDate").datepicker({
	
		dateFormat:"yy-mm-dd",
	    selectOtherMonths: true,
	    minDate: 0, 
	    maxDate: "+7D"
	});
});

$(function(){
	
	$("#startTime").timepicker({
		
		timeFormat : 'HH:mm',
		interval : 60,
		minTime : '9',
		maxTime : '20',
		dropdown: true,
	    scrollbar: true
	});

});

	$(function(){
		
		$("#endTime").timepicker({
			
			timeFormat : 'HH:mm',
			interval : 60,
			minTime : '10',
			maxTime : '21',
			dropdown: true,
		    scrollbar: true
		});
	});

	
	//============= 예약 GET 처리 =============	
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 $( "button.btn.btn-primary:contains('수정')" ).on("click" , function() {
				self.location = "/reservation/updateReservation?reNum=${reservation.reNum}"
			});
	});
	
	 $(function(){
		
		 $("button.btn.btn-cancel:contains('취소')").on("click",function(){
			
			 self.location = "/reservation/listReservation"	 
		 });
	 });
	 
	//=============MY RESERVATION=============	
	 $(function() {
		$( "td:nth-child(1)" ).on("click" , function() {
			
			 self.location ="/reservation/getReservation?reNum="+$(this).attr("value");   
		});
		$( "td:nth-child(1)" ).css("color" , "blue");
	});	
		 
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method", "POST").attr("action",
					"/reservation/listReservation").submit();
		}

		//============= "검색"  Event  처리 =============	
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button.btn.btn-default").on("click", function() {
				fncGetList(1);
			});
		});
		
		//========== 회의실 예약 ==========
		$(function(){
			
			$("#addReservation").on("click", function(){
				
				self.location="../reservation/addReservation"
			});
		});
		
		
		
		//========== 회의실 셀렉트메뉴 ========
		$(function () {

			$.ajax({
				url:"/meetingRoom/json/getReserveMeetingRoom",
				method:"GET",
				datatype : "json",
				headers:{
					"Accept" : "application/json",
					"Content-Type" : "application/json"
					
				},
				success:function(data){
					console.log(data)

					for(var i=0; i<data.meetingRoom.length; i++ ){
						$("#mettingRoomName").append($('<option value='+data.meetingRoom[i].mettingRoomName+'>'+data.meetingRoom[i].mettingRoomName+'</option>'));
					}
				}
			});
		});	
		
		//예약 슬라이더
		$( function() {
		    $( "#slider-range" ).slider({
		      range: true,
		      min: 0,
		      max: 500,
		      values: [ 75, 300 ],
		      slide: function( event, ui ) {
		        $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
		      }
		    });
		    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
		      " - $" + $( "#slider-range" ).slider( "values", 1 ) );
		    $("#slider-range").slider("enable");
		  } );
		
		//============= "수정"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncUpdateReservation();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		//UPDATE RESERVATION
		function fncUpdateReservation() {
			
			$("form").attr("method" , "POST").attr("action" , "/reservation/updateReservation").submit();
		}


	