<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

    <!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<div class="reservation_div">
			<h2 class="page-header">${employee.employeeNo }님의 회의실 예약</h2>
			<form class="form-horizontal" enctype="multipart/form-data">
				
				<div class="form-group">
					<label for="reserveEmployee" class="col-sm-offset-1 col-sm-3 control-label">예약자</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="employeeNo"
							name="employeeNo" value="${employee.employeeNo}">
					</div>
				</div>
				
				<div class="form-group">
					<label for="meetingRoom" class="col-sm-offset-1 col-sm-3 control-label">회의실</label>
					<div class="col-sm-2">
						<select class="form-control" name="mettingRoomName" id="mettingRoomName">
						<option disabled selected>회의실 선택</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label for="reserveDate" class="col-sm-offset-1 col-sm-3 control-label">예약 날짜</label>
					<div class="col-xs-8 col-md-4">
						<input type="text" class="form-control" id="reserveDate" name="reserveDate">
				</div>
			</div>

			<div class="form-group">
				<label for="startTime" class="col-sm-offset-1 col-sm-3 control-label">시작 시간</label>
				<div class="col-xs-8 col-md-4">
					<input type="text" class="form-control" id="startTime" name="startTime">
				</div>
			</div>

			<div class="form-group">
				<label for="endTime" class="col-sm-offset-1 col-sm-3 control-label">종료 시간</label>
				<div class="col-xs-8 col-md-4">
					<input type="text" class="form-control" id="endTime" name="endTime">
				</div>
			</div>

			<div class="form-group">
				<label for="usePurpose" class="col-sm-offset-1 col-sm-3 control-label">이용 목적</label>
				<div class="col-xs-8 col-md-4">
					<textarea class="form-control" id="usePurpose" name="usePurpose"/>
				</div>
			</div>
			</form>
			
			<button type="button" class="btn btn-success" style="float: right;">
			<i class="fa fa-magic"></i>&nbsp; 작성</button>
		
		</div>
	</div>
  <!--  화면구성 div End /////////////////////////////////////-->
