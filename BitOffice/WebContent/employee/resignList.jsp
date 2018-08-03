<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  화면구성 div Start /////////////////////////////////////-->
<div class="app-title">
	<div>
		<h1>
		<i class="fa fa-th-list" aria-hidden="true"></i>
		퇴사자목록</h1>
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
							<p class="text-primary">전체 ${resultPage.totalCount } 건수, 현재
								${resultPage.currentPage} 페이지</p>
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
								<th align="center">번호</th>
								<th align="left">부서</th>
								<th align="left">직위</th>
								<th align="left">이름</th>
								<th align="left">입사일</th>
								<th align="left">퇴사일</th>
								<th align="left">이메일</th>
							</tr>
						</thead>

						<tbody>


							<c:set var="i" value="0" />
							<c:forEach var="employee" items="${list}">
								<c:set var="i" value="${ i+1 }" />
								<tr>
									<td align="center">${ i }</td>
									<td align="left">${employee.departmentName}</td>
									<td align="left">${employee.positionName}</td>
									<td align="left">${employee.employeeName}</td>
									<td align="left">${employee.hireDate}</td>
									<td align="left">${employee.endDate}</td>
									<td align="left">${employee.email}</td>
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
		</div>
	</div>
</div>
<!--  화면구성 div End /////////////////////////////////////-->
