<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--  화면구성 div Start /////////////////////////////////////-->
			<div class="tab-pane fade active show" id="user-settings">
              <div class="tile user-settings">
                <h4 class="line-head">
                <i class="fa fa-pencil "></i>
                내 정보 수정</h4>
                <form enctype="multipart/form-data">
                
                <div class="row mb-4">
                <div class="col-md-4">
                      <label>부서</label>
                      <input class="form-control"  type="text"name="department"  id="department" value="${employee.departmentName}"readonly >
                    </div>
                    <div class="col-md-4">
                      <label>직급</label>
                      <input class="form-control" type="text" id="position"
						name="position" value="${employee.positionName}" readonly>
                    </div>
                    </div>

                  <div class="row mb-4">
                    <div class="col-md-4">
                      <label>입사일</label>
                      <input class="form-control" type="text" name="hireDate" id="hireDate" value="${employee.hireDate}" readonly>
                    </div>
                    <div class="col-md-4">
                      <label>연차</label>
                      <input class="form-control"   type="text" name="annualLeave" id="annualLeave"value="${employee.annualLeave}" readonly>
                    </div>
                  </div>
                    
                    <div class="row mb-4">
                    <div class="col-md-4">
                      <label>사번</label>
                      <input class="form-control" type="text" id="employeeNo"
						name="employeeNo"  value="${employee.employeeNo }" readonly>
                    </div>
                    <div class="col-md-4">
                      <label>이름</label>
                      <input class="form-control" type="text" id="employeeName"
						name="employeeName"  value="${employee.employeeName }" readonly>
                    </div>
                    </div>
                    
                    <div class="row mb-4">
                    <div class="col-md-4">
                      <label>비밀번호</label>
                      <input class="form-control" type="password" id="password"
						name="password"  placeholder="비밀번호">
                    </div>
                    <div class="col-md-4">
                    <label>&nbsp;&nbsp;&nbsp;</label>
                      <input class="form-control" type="password" id="password2"
						name="password2"  placeholder="비밀번호 확인">
                    </div>
                    </div>
                    
                    <div class="row mb-4">
                    <div class="col-md-4">
                      <label>이메일</label>
                      <input class="form-control" type="text" id="email"
						name="email"  value="${employee.email }">
                    </div>
                    <div class="col-md-4">
                   <label>생년월일</label>
                      <input class="form-control" type="text" id="birthDate"
						name="birthDate" value="${employee.birthDate }">
                    </div>
                    </div>
                    
                    <div class="row mb-4">
                    <div class="col-mb-4">
                      <label> 휴대폰 번호</label>
                      <select class="form-control" name="phone1" id="phone1">
						<option value="010" ${ !empty employee.phone1&&employee.phone1=="010" ? "selected" : ''}>010</option>
						<option value="011" ${ !empty employee.phone1&&employee.phone1=="011" ? "selected" : ''}>011</option>
						<option value="016" ${ !empty employee.phone1&&employee.phone1=="016" ? "selected" : ''}>016</option>
						<option value="018" ${ !empty employee.phone1&&employee.phone1=="018" ? "selected" : ''}>018</option>
						<option value="019" ${ !empty employee.phone1&&employee.phone1=="019" ? "selected" : ''}>019</option>
					</select>
                    </div>
                    <div class="col-mb-4">
                    <label>&nbsp;&nbsp;&nbsp;</label>
					<input type="text" class="form-control" id="phone2" name="phone2" value="${ !empty employee.phone2 ? employee.phone2 : ''}">
					</div>
					<div class="col-mb-4">
					<label> &nbsp;&nbsp;&nbsp;</label>
					<input type="text" class="form-control" id="phone3" name="phone3" value="${ !empty employee.phone3 ? employee.phone3 : ''}">
						</div>
				<input type="hidden" name="phone" />
                    <div class="col-md-4">
                      <label>집 주소</label>
                      <input class="form-control" type="text" id="address"
						name="address"  value="${employee.address }" >
                    </div>
                    </div>
                    
                    <div class="row mb-4">
                    <div class="col-md-4">
                      <label>내선번호</label>
                      <input class="form-control" type="text" id="extension"
						name="extension" value="${employee.extension }">
                    </div>
                    <div class="col-md-4">
                      <label>프로필 이미지</label>
                      <input class="form-control" type="file" id="fileName"
						name="file"  onchange="readURL(this);" >
                    </div>
                    <img id="LoadImg" class="img-thumbnail"
					src="http://placehold.it/180" style="width: 100px; height: 100px;">
                    </div>
                    
                    
<!-- 			<div class="form-group"> -->
<!-- 				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">우편번호</label> -->
<!-- 				<div class="col-sm-4"> -->
<!-- 					<input type="hidden" id="confmKey" name="confmKey" value=""> -->
<!-- 					<input type="text" id="zipNo" name="zipNo" readonly style="width: 100px">  -->
<!-- 						<input type="button" value="주소검색" onclick="goPopup();">  -->
<!-- 						<input type="hidden" name="resultType" value="1" /> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 			<div class="form-group"> -->
<!-- 				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">도로명주소</label> -->
<!-- 				<div class="col-sm-4"> -->
<!-- 					<input type="text" id="roadAddrPart1"  name="roadAddrPart1" style="width: 85%"> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 			<div class="form-group"> -->
<!-- 				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상세주소</label> -->
<!-- 				<div class="col-sm-4"> -->
<!-- 					<input type="text" id="addrDetail"  name="addrDetail" style="width: 40%" value=""> -->
<!-- 				</div> -->
<!-- 				<input type="hidden" name="address" /> -->
<!-- 			</div> -->
			

			

                  <div class="row mb-10">
                    <div class="col-md-12">
                      <button class="btn btn-primary" type="button" value="${employee.employeeNo }" ><i class="fa fa-fw fa-lg fa-check-circle"></i>등록</button>
                    <button class="btn btn-secondary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>취소</button>
                    </div>
                  </div>
			
		</form>
		<!-- form End /////////////////////////////////////-->
		</div>
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
