

$(document).ready(function() {
	
	// 부서
	$.ajax({
		url : "/department/json/getAllDepartment",
		method : "GET",
		datatype : "json",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"

		},
		success : function(data) {

			console.log(data)

			for (var i = 0; i < data.department.length; i++) {
				$("#departmentNo").append(
						$('<option value='
								+ data.department[i].departmentNo + '>'
								+ data.department[i].departmentName
								+ '</option>'));
			}
		}
	});

	// 직급
	$.ajax({
		url : "/position/json/getAllPosition",
		method : "GET",
		datatype : "json",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"

		},
		success : function(data) {

			console.log(data)

			for (var i = 0; i < data.position.length; i++) {
				$("#positionNo").append(
						$('<option value='
								+ data.position[i].positionNo + '>'
								+ data.position[i].positionName
								+ '</option>'));
			}
		}
	});
	
	//직원리스트
	$.ajax({
				url : "/employee/json/listEmployee",
				method : "GET",
				datatype : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(data) {

					$(".text-primary").append(
							'전체 ' + data.resultPage.totalCount + ' 건수, 현재'
									+ data.resultPage.currentPage + ' 페이지');

					for (var i = 0; i < data.list.list.length; i++) {

						$("#listEmployee").append(

								'<tr><td>' + (i + 1) + '</td><td>'
										+ data.list.list[i].departmentName
										+ '</td><td>'
										+ data.list.list[i].positionName
										+ '</td><td>'
										+ data.list.list[i].employeeNo
										+ '</td><td id="getEmployee" value="'
										+ data.list.list[i].employeeNo + '">'
										+ data.list.list[i].employeeName
										+ '</td></tr>');

					}
				}
			});

			
		});
//========== 임직원 등록 Event 처리 및 연결=========
function fncAddEmployee() {

		$("form").attr("method", "POST")
				.attr("action", "/employee/addEmployee").submit();
	}

	
	$(function() {

		$("button.btn.btn-default:contains('비밀번호생성')").on("click", function() {
			self.location = "/employee/getRandomPassword"
		});
	});

	$(function() {
		$("button.btn.btn-primary:contains('제출')").on("click", function() {
			fncAddEmployee();
		});

		$("button.btn.btn-secondary:contains('취소')").on("click", function() {
			$(".tab-pane fade active show")[0].reset();
		});
	});

		$(function() {
			$("#hireDate").datepicker({
				dateFormat : "yy-mm-dd"
			});
			$("#birthDate").datepicker({
				dateFormat : "yy-mm-dd"
			});
		
		});
		$.datepicker.setDefaults({
			prevText : '이전 달',
			nextText : '다음 달',
			changeYear : true,
			yearRange : 'c-80:c+100',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ], //월 이름
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ], //
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			showMonthAfterYear : true,
			yearSuffix : '년'
		});


	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#LoadImg').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}

	}
	
	//============= 임직원정보수정 Event  처리 =============	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button.btn.btn-primary:contains('수정')").on("click",function() {
		self.location = "/employee/updateEmployee?employeeNo="+ $(this).attr("value");
		});
		$( "button.btn.btn-primary:contains('확인')" ).on("click" , function() {
			 self.location ="/employee/listEmployee"
			});
	});
	

	function goPopup() {
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/employee/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	/** API 서비스 제공항목 확대 (2017.02) **/
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.addrDetail.value = addrDetail;
		document.form.zipNo.value = zipNo;
	}

	//============= "가입"  Event 연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button.btn.btn-primary:contains('등록')").on("click", function() {
			fncUpdateEmployee();
		});
	});

	function fncUpdateEmployee() {

		var pw = $("input[name='password']").val();
		var pw_confirm = $("input[name='password2']").val();
		
		if(pw == null || pw.length <1){
			alert("정보변경을 위해 패스워드는  반드시 입력하셔야 합니다.");
			$("input:text[name='password1']").focus();
			return;
		}

		if (pw != pw_confirm) {
			alert("비밀번호 확인이 일치하지 않습니다.");
			$("input:text[name='password2']").focus();
			return;
		}

		var value = "";
		if ($("input:text[name='phone2']").val() != ""
				&& $("input:text[name='phone3']").val() != "") {
			var value = $("option:selected").val() + "-"
					+ $("input[name='phone2']").val() + "-"
					+ $("input[name='phone3']").val();
		}

		$("input:hidden[name='phone']").val(value);
		
//		var addr="";
//		if($("input:text[name='roadAddrPart1']").val() !=""
//				&& $("input:text[name='addrDetail']").val() !=""){
//			var addr=$("input[name='zipNo']").val()+"/"
//			+$("input[name='roadAddrPart1']").val()+"/"
//			+$("input[name='addrDetail']").val()
//		}
//		
//		$("input:hidden[name='address']").val(addr);
		

		$("form").attr("method", "POST").attr("action",
				"/employee/updateEmployee").submit();
	}
	

	//=========임직원 리스트========================
	//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/employee/listEmployee").submit();
	}
	
	
	//============= "검색"  Event  처리 ===============================	
	 $(function() {
		$( "button.btn.btn-default:contains('검색')").on("click" , function() {
			fncGetList(1);
		}); 
	 });
	
	 $(function() {
		$( ".getEmployee" ).on("click" , function() {
			
			 self.location ="/employee/getEmployee?employeeNo="+$(this).attr("value")
		});
		
		//퇴사 Event 처리
		$(".resignationEmp" ).on("click", function() {
			if(confirm("사번 : "+$(this).attr("value")+"인 임직원을 퇴사처리를 하시겠습니까?")==true){
				self.location=	"/employee/resignationEmp?employeeNo="+$(this).attr("value");
			}else{
				return false;
			}
			
			});

	});	
		
