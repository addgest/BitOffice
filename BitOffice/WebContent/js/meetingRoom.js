		 $( function() {
			    var dialog, form,
			    
			 
			      meetingRoomCode=$("#meetingRoomCode"),
			      mettingRoomName=$("#mettingRoomName"),
			      allFields = $( [] ).add(meetingRoomCode).add(mettingRoomName),
			      tips = $( ".validateTips" );
			 
			    function updateTips( t ) {
			      tips
			        .text( t )
			        .addClass( "ui-state-highlight" );
			      setTimeout(function() {
			        tips.removeClass( "ui-state-highlight", 1500 );
			      }, 500 );
			    }
			 
			    function checkLength( o, n, min, max ) {
			      if ( o.val().length > max || o.val().length < min ) {
			        o.addClass( "ui-state-error" );
			        updateTips( "Length of " + n + " must be between " +
			          min + " and " + max + "." );
			        return false;
			      } else {
			        return true;
			      }
			    }
			 
			    function checkRegexp( o, regexp, n ) {
			      if ( !( regexp.test( o.val() ) ) ) {
			        o.addClass( "ui-state-error" );
			        updateTips( n );
			        return false;
			      } else {
			        return true;
			      }
			    }
			 
			    function addMeetingRoom() {
// 			    	var valid = true;
			        allFields.removeClass( "ui-state-error" );
			    	//유효성 체크
// 			    	var numcheck = document.getElementById("meetingRoomCode");
// 			    	var isnum = /^[0-9]+$/;
// 			    	if(!isnum.test(numcheck.value)){
// 			    		alert("코드는 숫자만 입력하세요");
// 			    		numcheck.value="";
// 			    		numcheck.focus();
// 			    		return;
// 			    	}
// 			    	valid = valid && checkLength( meetingRoomCode, "meetingRoomCode", 3, 5 );
//       				valid = valid && checkLength( mettingRoomName, "mettingRoomName", 4, 6 );

//       				valid = valid && checkRegexp( meetingRoomCode, /^[0-9]+$/, "코드는 숫자로만 이루어져야 합니다" );
      				
//       				if ( valid ) {
//       			        $( "#table table-hover table-striped tbody" ).append( "<tr>" +
//       			          "<td>" + meetingRoomCode.val() + "</td>" +
//       			          "<td>" + mettingRoomName.val() + "</td>" +
//       			          "</tr>" );
//       			        dialog.dialog( "close" );
//       			      }
//       			      return valid;
			//return valid하려면 add가안됨, add하려면 valid가 안됨	      
      			      self.location.href='/meetingRoom/addMeetingRoom?meetingRoomCode='+document.getElementById("meetingRoomCode").value
			    						+"&mettingRoomName="+document.getElementById("mettingRoomName").value;
	    	//$("form").attr("method", "GET").attr("action", "/meetingRoom/addMeetingRoom").submit();
			    }
			 
			    dialog = $( "#dialog-form" ).dialog({
			      autoOpen: false,
			      show: {
		 		        effect: "blind",
		 		        duration: 1000
		 		  },
		 		 hide: {
// 		 		        effect: "explode",
						effect: "drop",
		 		        duration: 1000
		 		  },
			      height: 400,
			      width: 350,
			      modal: true,
			      buttons: {
 			        "생성": addMeetingRoom ,
			        "닫기": function() {
			          dialog.dialog( "close" );
			        }
			      },
			      close: function() {
			        form[ 0 ].reset();
			        allFields.removeClass( "ui-state-error" );
			      }
			    });
			 
			    form = dialog.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
			      addMeetingRoom();
			    });
			 
			    $( "#create-meetingRoom" ).button().on( "click", function() {
			      dialog.dialog( "open" );
			    });
			  } );
		
		
		//====update Dialog
	
		 $(function() {
		
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(1)" ).on("click" , function() {
				 self.location ="/meetingRoom/getMeetingRoom?mR="+$(this).attr("value");
			});
						
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( "td:nth-child(1)" ).css("color" , "blue");
			
		});	
		
		// 		$( function() {
		// 		    $( "#dialog" ).dialog({
		// 		      autoOpen: false,
		// 		      show: {
		// 		        effect: "blind",
		// 		        duration: 1000
		// 		      },
		// 		      hide: {
		// 		        effect: "explode",
		// 		        duration: 1000
		// 		      }
		// 		    });

		// 		    $( "#opener" ).on( "click", function() {
		// 		      $( "#dialog" ).dialog( "open" );
		// 		    });
		// 		  } );

		//============= "검색"  Event  처리 =============	
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button.btn.btn-default").on("click", function() {
				fncGetList(1);
			});
		});