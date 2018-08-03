<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-default navbar-fixed-top">

	<div class="container">


		<a class="navbar-brand" href="/main.jsp">Bit Office</a>

		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
			<button class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#target">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<!-- toolBar Button End //////////////////////// -->

		<!--  dropdown hover Start -->
		<div class="collapse navbar-collapse" id="target"
			data-hover="dropdown"
			data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">

			<!-- Tool Bar 를 다양하게 사용하면.... -->
			<ul class="nav navbar-nav">

				<!--  임직원 DrowDown -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"> <span>임직원</span>
						<span class="caret"></span>
				</a>
<!-- 					<ul class="dropdown-menu"> -->
<!-- 						<li><a href="#">임직원리스트</a></li> -->
<!-- 						<li><a href="#">연차사용내역</a></li> -->
<!-- 						<li><a href="#">내정보수정</a></li> -->
			

<%-- 						<c:if test="${sessionScope.employee.role == 'admin'}"> --%>
<!-- 							<li class="divider"></li> -->
<!-- 							<li><a href="#">부서등록</a></li> -->
<!-- 							<li><a href="#">직급등록</a></li> -->
<!-- 							<li><a href="#">임직원등록</a></li> -->
<!-- 							<li><a href="#">퇴사자목록</a></li> -->
<%-- 						</c:if> --%>
<!-- 					</ul> -->
					</li>

				<!--  근태관리 DrowDown -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"> <span>근태관리</span>
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<c:if test="${sessionScope.employee.role == 'admin'}">
							<li><a href="#">IP설정</a></li>
							<li><a href="#">출퇴근기준시간설정</a></li>
						</c:if>
						<li><a href="#">근태현황</a></li>
						<li><a href="#">연락망</a></li>
						<li><a href="http://192.168.0.40:8010">채팅</a></li>

					</ul></li>

				<!--  회의실 관리 DrowDown -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"> <span>회의실</span>
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">회의실 관리 목록</a></li>
						<li><a href="#">회의실 예약</a></li>
					</ul></li>

				<!--  일정 관리 DrowDown -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"> <span>일정관리</span>
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">일정조회</a></li>
						<li><a href="#">공유신청자조회</a></li>
					</ul></li>

				<!--  전자결재 DrowDown -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"> <span>전자결재</span>
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">결재대기문서</a></li>
						<li><a href="#">참조대기문서</a></li>
						<li><a href="#">기안완료함</a></li>
						<li><a href="#">참조완료함</a></li>
					</ul></li>

				<!--  공지사항 DrowDown -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"> <span>공지사항</span>
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">공지사항작성</a></li>
					</ul></li>

				<li><a href="#">로그아웃</a></li>
			</ul>
		</div>

		<!-- dropdown hover END -->


	</div>
</div>
<!-- ToolBar End /////////////////////////////////////-->



<script type="text/javascript">
	//============= logout Event  처리 =============	
	$(function() {
		$("a:contains('로그아웃')").on("click", function() {
			$(self.location).attr("href", "/employee/logout");

		});
	});
	//============= 부서등록 Event  처리 =============
	$(function() {
		$("a:contains('부서등록')").on("click", function() {
			self.location = "/department/listDepartment"
		});
	});
	//============= 직급등록 Event  처리 =============
	$(function() {
		$("a:contains('직급등록')").on("click", function() {
			self.location = "/position/listPosition"
		});
	});
	//=============임직원등록 Event  처리 =============
	$(function() {

		$("a[href='#' ]:contains('임직원등록')").on("click", function() {
			self.location = "/employee/addEmployee"
		});
	});
	//=============내정보수정  Event  처리 =============
	$(function() {

		$("a[href='#' ]:contains('내정보수정')")
				.on("click",function() {
					self.location = "/employee/updateEmployee?employeeNo=${sessionScope.employee.employeeNo}"
		});
	});

	//============= 임직원리스트 Event  처리 =============
	$(function() {

		$("a[href='#' ]:contains('임직원리스트')").on("click", function() {
			self.location = "/employee/listEmployee"
		});
	});

	//============= 퇴사자 목록 Event  처리 =============
	$(function() {

		$("a[href='#' ]:contains('퇴사자목록')").on("click", function() {
			self.location = "/employee/resignList"
		});
	});

	//============= 연차사용내역 Event  처리 =============
	$(function() {

		$("a[href='#' ]:contains('연차사용내역')").on("click", function() {
			self.location = "/employee/useAnnualLeave?employeeNo=${sessionScope.employee.employeeNo}"
		});
	});

	//============= 근태관리 Event  처리 =============

	$(function() {
		$("a:contains('IP설정')").on("click", function() {
			self.location = "/ip/updateIpView"
		});
	});

	$(function() {
		$("a:contains('출퇴근기준시간설정')").on("click", function() {
			self.location = "/standardtime/updateStandardTimeView"
		});
	});

	$(function() {
		$("a:contains('근태현황')").on("click", function() {
			self.location = "/attendance/listAttendance"
		});
	});

	$(function() {
		$("a:contains('연락망')").on("click", function() {
			self.location = "/organization/listOrganization"
		});
	});

	//============= 회의실관리 Event  처리 =============
	$(function() {
		$("a:contains('회의실 관리 목록')").on("click", function() {
			self.location = "/meetingRoom/listMeetingRoom"
		})

	})

	//============== 회의실예약 Event 처리 =============
	$(function() {

		$("a:contains('회의실 예약')").on("click", function() {
			self.location = "/reservation/listReservation"
		})
	})

	//============= 일정관리 Event  처리 =============	
	$(function() {
		$("a:contains('일정조회')").on("click", function() {
			self.location = "/schedule/index"
		})

	})

	//============= 일정관리 Event  처리 =============	
	$(function() {
		$("a:contains('공유신청자조회')").on("click", function() {
			self.location = "/share/updateShareView"
		})

	})

	//============= 전자결재 Event  처리 =============

	$(function() {
		$("a:contains('결재대기문서')").on("click", function() {
			self.location = "/approval/listApproval"
		})

	})

	$(function() {
		$("a:contains('참조대기문서')").on("click", function() {
			self.location = "/approval/listApproval"
		})

	})

	$(function() {
		$("a:contains('기안완료함')").on("click", function() {
			self.location = "/approval/listApproval"
		})

	})

	$(function() {
		$("a:contains('참조완료함')").on("click", function() {
			self.location = "/approval/listApproval"
		})

	})
	//============= 공지사항 Event  처리 =============	
	$(function() {
		$("a:contains('공지사항')").on("click", function() {
			self.location = "/board/listBoard?orderby="
		})

		$("a:contains('공지사항작성')").on("click", function() {
			self.location = "/board/addBoard"
	
		})

	})
</script>
