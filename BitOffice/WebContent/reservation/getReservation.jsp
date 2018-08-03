<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


	<div class="container">
		<div class="row">

			<table class="table table-striped"
				style="text-align: center; boder: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">${reservation.employeeNo } 님의 예약 상세 조회</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%">회의실</td>
						<td colspan="2" style="text-align: left;">${reservation.mettingRoomName }</td>
					</tr>
					<tr>
						<td>예약 날짜</td>
						<td colspan="2" style="text-align: left;">${reservation.reserveDate }</td>
					</tr>
					<tr>
						<td>시작 시간</td>
						<td colspan="2" style="text-align: left;">${reservation.startTime }</td>
					</tr>
					<tr>
						<td>종료 시간</td>
						<td colspan="2" style="text-align: left;">${reservation.endTime }</td>
					</tr>
					<tr>
						<td>이용 목적</td>
						<td colspan="2" style="text-align: left;">${reservation.usePurpose }</td>
					</tr>
					
				</tbody>
			</table>
			<div class="col-md-12 text-center">
			<a class="btn btn-info btn" href="/reservation/updateReservation?reNum=${reservation.reNum}" role="button">수 &nbsp;정</a>		
<!-- 	  			<button type="button" class="btn btn-info" id="getMR">회의실 수정</button> -->
	  		<a class="btn btn-danger btn" href="/reservation/myReservation" role="button">목 &nbsp;록</a>
			</div>
		</div>
	</div>
