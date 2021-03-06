	//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action",
				"/department/listDepartment").submit();
	}

	//============= "검색"  Event  처리 =============	
	$(function() {
		$("button.btn.btn-default:contains('검색')").on("click", function() {
			fncGetList(1);
		});
	});

	$(function() {
		var dialog, form, departmentNo = $("#departmentNo"), departmentName = $("#departmentName"), allFields = $(
				[]).add(departmentNo).add(departmentName), tips = $(".validateTips");

		function updateTips(t) {
			tips.text(t).addClass("ui-state-highlight");
			setTimeout(function() {
				tips.removeClass("ui-state-highlight", 1500);
			}, 500);
		}

		function checkLength(o, n, min, max) {
			if (o.val().length > max || o.val().length < min) {
				o.addClass("ui-state-error");
				updateTips("Length of " + n + " must be between " + min
						+ " and " + max + ".");
				return false;
			} else {
				return true;
			}
		}

		function checkRegexp(o, regexp, n) {
			if (!(regexp.test(o.val()))) {
				o.addClass("ui-state-error");
				updateTips(n);
				return false;
			} else {
				return true;
			}
		}

		function addDepartment() {
			self.location.href = '/department/addDepartment?departmentNo='
					+ document.getElementById("departmentNo").value
					+ "&departmentName="
					+ document.getElementById("departmentName").value
		}

		dialog = $("#dialog-form").dialog({
			autoOpen : false,
			show : {
				effect : "blind",
				duration : 1000
			},
			hide : {
				// 		 		        effect: "explode",
				effect : "drop",
				duration : 1000
			},
			height : 400,
			width : 350,
			modal : true,
			buttons : {
				"부서생성" : addDepartment,
				Cancel : function() {
					dialog.dialog("close");
				}
			},
			close : function() {
				form[0].reset();
				allFields.removeClass("ui-state-error");
			}
		});

		form = dialog.find("form").on("submit", function(event) {
			event.preventDefault();
			addDepartment();
		});

		$("#addDepartment").button().on("click", function() {
			dialog.dialog("open");
		});
	});

	//=======수정삭제 Event 처리 ========================
	$(function() {

		$("span:contains('수정')").on("click", function() {
			self.location ="/department/updateDepartment?departmentNo="+$(this).attr("value")
			
		});

	$("span:contains('삭제')").on("click", function() {
			var departmentNo=$(this).attr("value")
		    $.ajax({
		        url:'/employee/json/useDepartmentCheck',
		        type:'post',
		        data:{"departmentNo":departmentNo},
		        success:function(data){
		        	
		            if(data==0){
		            	self.location ="/department/deleteDepartment?departmentNo="+departmentNo;              
		            }else{
		            	alert("근무중인 임직원이 존재하여 삭제가 불가능합니다.");  
		            }
		        },
		        error:function(){
		                alert("에러입니다");
		        }
		    });
		});

	});
