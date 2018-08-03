<%@ page contentType="text/html; charset=EUC-KR"%>

	<div id="dialog-form" title="부서 등록">
		<p class="validateTips">등록하실 부서 정보를 입력하세요.</p>

		<form>
			<fieldset>
				<label for="departmentNo">부서 번호</label> 
				<input type="text" name="departmentNo" id="departmentNo"
					value="${department.departmentNo}" class="text ui-widget-content ui-corner-all"> 
					
					<label for="departmentName">부 서 명</label>
					 <input type="text" name="departmentName" id="departmentName"
					value="${department.departmentName}" class="text ui-widget-content ui-corner-all">


<!-- 				Allow form submission with keyboard without duplicating the dialog button -->
				<input type="submit" tabindex="-1"
					style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header text-info">
			<h3>부서 관리</h3>
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
					<th align="center"><button id="addDepartment">부서 추가</button></th>
				</tr>

			</thead>

			<thead>
				<tr>
					<th align="left">No</th>
					<th align="left">부서 번호</th>
					<th align="left">부서명</th>
					<th align="left">수정</th>
					<th align="left">삭제</th>
				</tr>
			</thead>

			<tbody>

				<c:set var="i" value="0" />
				<c:forEach var="department" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
						<td align="left">${ i }</td>
						<td align="left">${department.departmentNo}</td>
						<td align="left">${department.departmentName}</td>
					<td align="left"><span value='${department.departmentNo}'>수정</span></td>
					<td align="left"><span value='${department.departmentNo}' >삭제</span></td>
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

