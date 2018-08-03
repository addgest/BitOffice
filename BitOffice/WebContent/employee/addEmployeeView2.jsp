<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div class="row">
	<div class="col-md-6">
		<div class="tab-pane fade active show" id="user-settings">
			<div class="tile user-settings" style="height: 680px;">
				<h4 class="line-head">임직원 등록</h4>
				<form enctype="multipart/form-data">

					<div class="row mb-4">
						<div class="col-md-4">
							<label>비밀번호</label> <input class="form-control" name="password"
								id="password" value="" placeholder="비밀번호">
						</div>
						<!--                     <div class="col-sm-3"> -->
						<!-- 					<button type="button" class="btn btn-default">비밀번호생성</button> -->
						<!-- 				</div> -->
						<div class="col-md-4">
							<label>입사일</label> <input class="form-control hasDatepicker"
								type="text" id="hireDate" name="hireDate" placeholder="입사일">
						</div>
					</div>

					<div class="row mb-4">
						<div class="col-md-4">
							<label>부서</label> <select class="form-control"
								name="departmentNo" id="departmentNo">
								
							</select>
						</div>
						<div class="col-md-4">
							<label>직급</label> <select class="form-control" name="positionNo"
								id="positionNo">
								
							</select>
						</div>
					</div>

					<div class="row mb-4">
						<div class="col-md-4">
							<label>사번</label> <input class="form-control" type="text"
								id="employeeNo" name="employeeNo" placeholder="사번">
						</div>
						<div class="col-md-4">
							<label>이름</label> <input class="form-control" type="text"
								id="employeeName" name="employeeName" placeholder="이름">
						</div>
					</div>

					<div class="row mb-4">
						<div class="col-md-4">
							<label>이메일</label> <input class="form-control" type="text"
								id="email" name="email" placeholder="이메일">
						</div>
						<div class="col-md-4">
							<label>생년월일</label> <input class="form-control hasDatepicker"
								type="text" id="birthDate" name="birthDate" placeholder="생년월일">
						</div>
					</div>

					<div class="row mb-4">
						<div class="col-md-4">
							<label>연차</label> <input class="form-control" type="text"
								id="annualLeave" name="annualLeave" placeholder="연차">
						</div>
						<div class="col-md-4">
							<label>전자서명이미지</label> <input class="form-control" type="file"
								id="fileName" name="file" placeholder="전자서명이미지"
								onchange="readURL(this);">
						</div>
						<img id="LoadImg" class="img-thumbnail"
							src="http://placehold.it/180"
							style="width: 100px; height: 100px;">
					</div>

					<div class="row mb-10">
						<div class="col-md-12">
							<button class="btn btn-primary" type="button">
								<i class="fa fa-fw fa-lg fa-check-circle"></i>제출
							</button>
							<button class="btn btn-secondary" type="button">
								<i class="fa fa-fw fa-lg fa-check-circle"></i>취소
							</button>
						</div>
					</div>
				</form>

			</div>

		</div>
	</div>
	<div class="col-md-6">
	<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
	<input type="hidden" id="currentPage" name="currentPage"
		value="0" />
		<div class="tile">
			<h4 class="line-head">임직원 목록</h4>
			<div class="col-md-6 text-left">
				<p class="text-primary"></p>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>부서</th>
						<th>직급</th>
						<th>사번</th>
						<th>이름</th>
					</tr>
				</thead>
				<tbody id="listEmployee">
			</table>
			<!-- <!-- PageNavigation Start... -->
			<jsp:include page="../common/pageNavigator_new.jsp" />
			<!-- <!-- PageNavigation End... -->
		</div>

	</div>
</div>
