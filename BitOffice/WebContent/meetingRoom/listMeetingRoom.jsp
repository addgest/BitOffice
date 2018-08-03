<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="dialog-form" title="회의실 생성">
		<p class="validateTips">모든 값을 입력하셔야 합니다</p>

		<form>
			<fieldset>
				<label for="meetingRoomCode">회의실 코드</label> 
				<input type="text" name="meetingRoomCode" id="meetingRoomCode" value="${meetingRoom.meetingRoomCode}"
					class="text ui-widget-content ui-corner-all" oninput="codeCheck()"
					placeholder="회의실 코드"> 
<!-- 					<span id="mc"></span> -->
				
				<label for="mettingRoomName">회의실 이름</label> 
				<input type="text" name="mettingRoomName" id="mettingRoomName" value="${meetingRoom.mettingRoomName}"
					class="text ui-widget-content ui-corner-all" 
					placeholder="회의실 이름"> 
					

				<!-- Allow form submission with keyboard without duplicating the dialog button -->
				<input type="submit" tabindex="-1"
					style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>

<div class="app-title">
        <div>
          <h1> 회의실 목록</h1>
        </div>
      </div>
      
<div class="row">
	<div class="col-md-12">
		<div class="tile">
			<div class="tile-body">
				<div id="sampleTable_wrapper"
					class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
					<div class="row">
						<div class="col-md-6 text-left">
			<p class="text-primary">전체 ${resultPage.totalCount }개 회의실, 현재
				${resultPage.currentPage} 페이지</p>
				<button id="create-meetingRoom">회의실 추가</button>
		</div>

					</div>
					<div class="row">
						<div class="col-sm-12">
							<table
								class="table table-hover table-bordered dataTable no-footer"
								id="sampleTable" role="grid" aria-describedby="sampleTable_info">
								
								<thead>
									<tr role="row">
										<th class="sorting_asc" tabindex="0"
											aria-controls="sampleTable" rowspan="1" colspan="1"
											aria-sort="ascending"
											aria-label="Name: activate to sort column descending"
											style="width: 7px;">수정</th>
										<th class="sorting" tabindex="0" aria-controls="sampleTable"
											rowspan="1" colspan="1"
											aria-label="Position: activate to sort column ascending"
											style="width: 70px;">회의실 코드</th>
										<th class="sorting" tabindex="0" aria-controls="sampleTable"
											rowspan="1" colspan="1"
											aria-label="Office: activate to sort column ascending"
											style="width: 70px;">회의실 이름</th>
										<th class="sorting" tabindex="0" aria-controls="sampleTable"
											rowspan="1" colspan="1"
											aria-label="Age: activate to sort column ascending"
											style="width: 7px;">삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="i" value="0" />
									<c:forEach var="meetingRoom" items="${list}">
										<c:set var="i" value="${ i+1 }" />
										<tr role="row" class="odd">
											<td value="${meetingRoom.mR }">${meetingRoom.mR }</td>
											<td>${meetingRoom.meetingRoomCode}</td>
											<td>${meetingRoom.mettingRoomName}</td>
			 								<td><button type="button" onclick="location.href='deleteMeetingRoom?meetingRoomCode=${meetingRoom.meetingRoomCode}'">삭제</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>							
<!-- <!-- PageNavigation Start... --> 
<jsp:include page="../common/pageNavigator_new.jsp" />
<!-- <!-- PageNavigation End... --> 
		</div>
	</div>
</div>

