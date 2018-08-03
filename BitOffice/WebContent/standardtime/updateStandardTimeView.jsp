<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

	<div class="app-title">
		<div>
			<h1>출퇴근시간 설정(관리자)</h1>
			<p>우리 회사 출퇴근 시간을 입력하세요. 임직원이 등록한 시간과 비교자료에 활용됩니다</p>
		</div>
	</div>
	    	
	<!-- Modal -->
	<div class="modal fade" id="getMessageModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Bitoffice</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <form>
		      <div id="modalmessage" class="modal-body">
		       
		      </div>
	      </form>
	      <div class="modal-footer">
	        <button type="button" id="modalClose" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	


	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="tab-pane fade active show">

	      		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
			
		    <div class="row">   			
				<div >
			     		<input type="hidden" id="regEmployeeNo" name="regEmployeeNo" value="${sessionScope.employee.employeeNo}"/>	
						 <c:if test = "${!empty list[0].stdStartTime}"><input type="hidden" id="serialNo" name="serialNo" value ="${list[0].serialNo }"/></c:if> 
				    	
				    		<label>출근시간</label>     	
							<input type="text" class="form-control form-control-lg" name="stdStartTime" id="starts-at" value="${list[0].stdStartTime }"/>
							<br>
							<label>퇴근시간</label>   	
							<input type="text" class="form-control form-control-lg" name="stdEndTime" id="ends-at" value="${list[0].stdEndTime }"/>				  
							
							<br>
					  		<button type="button" class="btn btn-primary"><c:if test = "${empty list[0].stdStartTime}">등록</c:if>
					  													  <c:if test = "${!empty list[0].stdStartTime}">수정</c:if></button>
			    	  		
			  	</div>
			</div>
		</form>	        

	  <!--  form End /////////////////////////////////////-->
	  
 	</div>
