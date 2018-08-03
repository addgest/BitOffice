<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<div class="tab-pane fade active show" id="user-settings" style="    width: 1300px;
    height: 680px;">
	<div class="tile user-settings" >
		<h4 class="line-head">
		<i class="fa fa-pie-chart"></i>
		 연차 사용 내역</h4>


		<c:choose>
			<c:when test="${employee.annualLeave !='0'}">
				<div id="g1"
					style="width: 550px; height: 400px; display: inline-block; margin: 0 auto;"></div>
			</c:when>
			<c:otherwise>
				<img src="../images/uploadFiles/좌절네오.png" width="245">
			</c:otherwise>
		</c:choose>
		<h2 class="sub-header">연차 상세내역</h2>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>번호</th>
						<th>사용기간</th>
						<th>사유</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>

					<c:set var="i" value="0" />
					<c:forEach var="employee" items="${list}">
						<c:set var="i" value="${ i+1 }" />
						<tr>
							<td>${ i }</td>
							<td>${employee.startDate}~
								${employee.leaveEndDate}(${employee.useDay}일)</td>
							<td>${employee.title }</td>
							<td></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</div>

