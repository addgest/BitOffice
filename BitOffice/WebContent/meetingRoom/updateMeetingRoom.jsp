<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


	<div class="container">
		<div class="row">

			<table class="table table-striped"
				style="text-align: center; boder: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">${meetingRoom.mettingRoomName } 수정</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>SEQ</td>
						<td><input type="text" class="form-control" id="mR" name="mR" value="${meetingRoom.mR }" readonly>
		      			 <span id="helpBlock" class="help-block">
		      			<strong class="text-danger">SEQ 수정 불가</strong></td>
					</tr>
					<tr>
						<td style="width: 20%">회의실 코드</td>
						<td><input type="text" class="form-control" id="meetingRoomCode" name="meetingRoomCode" value="${meetingRoom.meetingRoomCode }" placeholder="변경할 회의실 코드"></td>
					</tr>
					<tr>
						<td>회의실 이름</td>
						<td><input type="text" class="form-control" id="mettingRoomName" name="mettingRoomName" value="${meetingRoom.mettingRoomName }" placeholder="변경할 회의실 이름"></td>
					</tr>
					
				</tbody>
			</table>
			<div class="col-md-12 text-center">
		      <button type="button" class="btn btn-info" id="updateMR">수 &nbsp;정</button>
<!-- 	  			<button type="button" class="btn btn-info" id="getMR">회의실 수정</button> -->
			<a class="btn btn-danger btn" href="#" role="button">취&nbsp;소</a>
			</div>
		</div>
	</div>
