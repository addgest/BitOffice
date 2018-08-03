<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

	<div class="app-title">
		<div>
			<h1>근태현황</h1>
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

	<!-- 퇴근 Modal -->
	<div class="modal fade" id="getCheckOutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel2">Bitoffice</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      		 <form class="form-inline" name="modalForm">
					  <div class="form-group">					   
					    <select id="memo" name="memo" class="form-control" name="memo" >
							<option value="">퇴근</option>
							<option value="외근">외근</option>
							<option value="교육">교육</option>
							<option value="반휴">반휴</option>						
							<option value="조퇴">조퇴</option>	
							<option value="기타">기타</option>						
						</select>
					  </div>
				  </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
 	        <button type="button" id="myFormSubmit" class="btn btn-primary">등록</button> 
	      </div>
	    </div>
	  </div>
	</div>	
 
	<!-- Timepicker Start /////////////////////////////////////-->
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>	
	

	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="tab-pane fade active show">
    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row" style="padding-left:40px;">
	    	<div class="form-group row"> 
			  <div class="col-xs-1">
	    		<button type="button" id="checkin" class="btn btn"  >출석</button>
	    	  </div>
				&nbsp;&nbsp;&nbsp;&nbsp;		    	  
			  <div class="col-xs-1">
	    		<button type="button" id="checkout" class="btn btn">퇴근</button>
	    	  </div>		    	  	
			</div>			
		</div>
		
		<div class="row">	    		    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">	    			      
			      
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>부서</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>이름</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>				  
				  <input type="hidden" id="employeeNo" name="employeeNo" value="${sessionScope.employee.employeeNo}"/>
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >부서</th>
            <th align="left">직급</th>
            <th align="left">이름</th>
            <th align="left">출근일자</th>
            <th align="left">출근시간</th>
            <th align="left">출근IP</th>
            <th align="left">퇴근일자</th>
            <th align="left">퇴근시간</th> 
            <th align="left">퇴근IP</th>
            <th align="left">비고</th>           
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="attendance" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			   <td align="left" >${attendance.departmentName}</td>
			  <td align="left">${attendance.positionName}</td>
			  <td align="left">${attendance.employeeName}</td> 
			  <td align="left">${attendance.attendateDate}</td>				  
			  <td align="left">${attendance.startTime}</td>	
			  <td align="left">${attendance.startIp}</td> 
			  <td align="left">${attendance.leaveDate}</td> 
			  <td align="left">${attendance.endTime}</td> 
			  <td align="left">${attendance.endIp}</td>	
			  <td align="left">${attendance.memo}</td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
