<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<div class="app-title">
	<div>
	<h1>
	<i class="fa fa-list-alt"></i>
		공지사항</h1>
		<p>제목을 클릭하시면 상세내용을 보실 수 있습니다.</p>
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
							<p class="text-primary">전체 ${resultPage.totalCount } 건수, 현재
								${resultPage.currentPage} 페이지</p>
						</div>

						<div class="col-md-6 text-right"
							style="display: flex; justify-content: flex-end;">
							<form class="form-inline" name="detailForm">
								<div class="form-group">
									<span class="newBoard">최신글순</span> |<span class="oldBoard">예전글순</span>
									|<span class="boardCount">높은조회수</span> <select
										class="form-control" name="searchCondition">
										<option value="0"
											${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>작성자</option>
										<option value="1"
											${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>글제목</option>
										<option value="2"
											${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>글내용</option>
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
					<table class="table" style="margin-top: 10px;">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>작성자</th>
								<th>조회수</th>
								<c:if test="${employee.role=='admin'}">
									<th>삭제</th>
								</c:if>
							</tr>
						</thead>
						<tbody>
							<c:set var="i" value="0" />
							<c:forEach var="board" items="${list}">
								<c:set var="i" value="${ i+1 }" />
								<tr>
									<td>${i}</td>
									<td class="getBoard" value="${board.boardNo}">${board.boardTitle}</td>
									<td>${board.boardDate}</td>
									<td>${board.employeeName}</td>
									<td>${board.boardCount}</td>
									<c:if test="${employee.role=='admin'}">
										<td class="deleteBoard" value="${board.boardNo}">삭제</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- <!-- PageNavigation Start... -->
			<jsp:include page="../common/pageNavigator_new.jsp" />
			<!-- <!-- PageNavigation End... -->
		</div>
	</div>
</div>

