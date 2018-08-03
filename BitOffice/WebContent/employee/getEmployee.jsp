<%@ page contentType="text/html; charset=EUC-KR"%>
	

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container" style="background-color: white;">

		<div class="page-header">
			<h3 class=" text-info">임직원 정보 상세조회</h3>
			<h5 class="text-muted">
				내 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.
			</h5>
		</div>

		<div class="row">
				<img class="rounded-circle"
				src="/profileFiles/${employee.profileImage}"
				alt="Generic placeholder image" width="140" height="140">
		</div>

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>부서</strong>
			</div>
			<div class="col-xs-8 col-md-4">${employee.departmentName}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>직급</strong>
			</div>
			<div class="col-xs-8 col-md-4">${employee.positionName}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>사번</strong>
			</div>
			<div class="col-xs-8 col-md-4">${employee.employeeNo}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>입사일</strong>
			</div>
			<div class="col-xs-8 col-md-4">${employee.hireDate}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>사원명</strong>
			</div>
			<div class="col-xs-8 col-md-4">${employee.employeeName}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>전화번호</strong>
			</div>
			<div class="col-xs-8 col-md-4">${ !empty employee.phone ? employee.phone : ''}
			</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>내선번호</strong>
			</div>
			<div class="col-xs-8 col-md-4">${employee.extension}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>주소</strong>
			</div>
			<div class="col-xs-8 col-md-4">${employee.address}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>이 메 일</strong>
			</div>
			<div class="col-xs-8 col-md-4">${employee.email}</div>
		</div>

		<hr />


<div class="row">
<div class="col-md-12 text-center ">

<c:if test="${sessionScope.employee.employeeNo == employee.employeeNo}">
<button type="button" class="btn btn-primary" value="${employee.employeeNo}">정보수정</button> 
</c:if>
<button type="button" class="btn btn-primary">확인</button>    
</div>
</div>
			<br />

		</div>
		<!--  화면구성 div Start /////////////////////////////////////-->
