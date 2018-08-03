<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  화면구성 div Start /////////////////////////////////////-->
<div class="app-title">
	<div>
		<h1>
		<i class="fa fa-users" aria-hidden="true"></i>
		임직원 목록</h1>
		<p>이름을 클릭하시면 상세정보를 보실 수 있습니다.</p>
	</div>
</div>


		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
<div class="row">
	<div class="col-md-12">
		<div class="tile">
			<div class="tile-body">
				<div id="sampleTable_wrapper"
					class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
					<div class="row">
						<div class="col-md-6 text-left">
							<p class="text-primary">전체 ${resultPage.totalCount } 건수, 
							현재 ${resultPage.currentPage} 페이지</p>
						</div>

						<div class="col-md-6 text-right"
							style="display: flex; justify-content: flex-end;">
							<form class="form-inline" name="detailForm">
								<div class="form-group">
									<select class="form-control" name="searchCondition">
										<option value="0"
											${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>부서</option>
										<option value="1"
											${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>직급</option>
										<option value="2"
											${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>임직원명</option>
									</select>
								</div>

								<div class="form-group">
									<label class="sr-only" for="searchKeyword">검색어</label> <input
										type="text" class="form-control" id="searchKeyword"
										name="searchKeyword" placeholder="검색어"
										value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
								</div>

								<button type="button" class="btn btn-default">검색</button>

								<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
								<input type="hidden" id="currentPage" name="currentPage"
									value="0" />

							</form>
						</div>

					</div>
					<!-- table 위쪽 검색 Start /////////////////////////////////////-->


					<!--  table Start /////////////////////////////////////-->
					<table class="table" style="margin-top: 10px;">
						<thead>
							<tr>
								<th>번호</th>
								<th>부서</th>
								<th>직위</th>
								<th>이름</th>
								<th>입사년도</th>
								<th>이메일</th>
								<th>내선번호</th>
								<c:if test="${employee.role=='admin'}">
									<th>퇴사처리</th>
								</c:if>
							</tr>
						</thead>
						<tbody>
							<c:set var="i" value="0" />
							<c:forEach var="employee" items="${list}">
								<c:set var="i" value="${ i+1 }" />
								<tr>
									<td>${ i }</td>
									<td>${employee.departmentName}</td>
									<td>${employee.positionName}</td>
									<td class="getEmployee" title="Click : 임직원 정보 상세보기"
										value='${employee.employeeNo}'>${employee.employeeName}</td>
									<td>${employee.hireDate}</td>
									<td>${employee.email}</td>
									<td>${employee.extension}</td>
									<c:if test="${sessionScope.employee.role == 'admin'}">
										<td class="resignationEmp" value='${employee.employeeNo }'>퇴사처리</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!--  table End /////////////////////////////////////-->
				</div>
			</div>
			<!-- PageNavigation Start... -->
			<jsp:include page="../common/pageNavigator_new.jsp" />
			<!-- PageNavigation End... -->
			<!--  화면구성 div End /////////////////////////////////////-->
		</div>
	</div>
</div>