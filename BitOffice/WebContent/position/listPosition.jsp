<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

	<div class="modal" style="position: relative; top: auto; right: auto; left: auto; bottom: auto; z-index: 1;" id="aaaa">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">등록하실 직급 정보를 입력하세요</h5>
                      <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	      <span aria-hidden="true">×</span></button>
                    </div>
                    <div class="modal-body">
                      <label for="positionNo">직급 번호</label>
				 <input type="text"
					name="positionNo" id="positionNo"
					value="${position.positionNo}"
					class="text ui-widget-content ui-corner-all">
					 <label
					for="positionName">직 급 명</label> 
					<input type="text"
					name="positionName" id="positionName"
					value="${position.positionName}"
					class="text ui-widget-content ui-corner-all">
					<label for="rankCode">직급 순차번호</label>
				 <input type="text"
					name="rankCode" id="rankCode"
					value="${position.rankCode}"
					class="text ui-widget-content ui-corner-all">
                    </div>
                    <div class="modal-footer">
                      <button class="btn btn-primary" type="button">Save</button>
                      <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
                    </div>
                  </div>
                </div>
              </div>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header text-info">
			<h3>직급 관리</h3>
		</div>

		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		<div class="row">

			<div class="col-md-6 text-left">
				<p class="text-primary">전체 ${resultPage.totalCount } 건수, 현재
					${resultPage.currentPage} 페이지</p>
			</div>

			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">

					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0"
								${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>부서번호</option>
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>부서명</option>
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
					<input type="hidden" id="currentPage" name="currentPage" value="0" />

				</form>
			</div>

		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->


		<!--  table Start /////////////////////////////////////-->
		<table class="table table-hover table-striped">

			<thead>
				<tr>
					<th align="center"><button id="addPosition">직급 추가</button></th>
				</tr>

			</thead>

			<thead>
				<tr>
					<th align="left">No</th>
					<th align="left">직급 번호</th>
					<th align="left">직 급 명</th>
					<th align="left">직급순차번호</th>
					<th align="left">수정</th>
					<th align="left">삭제</th>
				</tr>
			</thead>

			<tbody>

				<c:set var="i" value="0" />
				<c:forEach var="position" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
						<td align="left">${ i }</td>
						<td align="left">${position.positionNo}</td>
						<td align="left">${position.positionName}</td>
						<td align="left">${position.rankCode}</td>
						<td align="left"><span value='${position.positionNo}'>수정</span></td>
						<td align="left"><span value='${position.positionNo}' >삭제</span></td>
					</tr>
				</c:forEach>

			</tbody>

		</table>
		<!--  table End /////////////////////////////////////-->

	</div>
	<!--  화면구성 div End /////////////////////////////////////-->


	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp" />
	<!-- PageNavigation End... -->
