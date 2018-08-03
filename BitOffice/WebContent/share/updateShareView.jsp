<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

	<div class="app-title">
		<div>
			<h1>공유신청자조회</h1>			
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
	        
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->	
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
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>이름</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>부서</option>
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
            <th align="center">NO</th>
            <th align="center">신청일자</th>
            <th align="left">부서</th>
            <th align="left">직급</th>
            <th align="left">공유요청자</th>
            <th align="left">수락여부</th>
            <th align="left">삭제</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="share" items="${list}"> 
					
			<c:set var="employ_No" value="${sessionScope.employee.employeeNo}" />
				 <c:if test="${employ_No eq share.acceptEmployeeNo}"> 
					<c:set var="i" value="${ i+1 }" />
					<tr>
					  <td align="center">${i}</td>
					   <td align="left">${share.regDate}</td>
					  <td align="left">${share.requestDepartmentName}</td>
					  <td align="left">${share.requestPostionName}</td> 
					  <td align="left">${share.requestEmployeeName}</td> 	
					  <td align="left">			  								   
								    <select id="shareStatus" class="form-control" name="shareStatus" onchange="fnc_accept(this.value, '${share.shareNo}');">
										<option value="N" ${share.acceptStatus== 'N' ? 'selected="selected"' : '' }>NO</option>
										<option value="Y" ${share.acceptStatus== 'Y' ? 'selected="selected"' : '' }>YES</option>				
									</select></td>					 	  
					  <td align="left"><a onclick="delShare('${share.shareNo}')"><button type="button" class=”btn”>삭제</button></a>
					  	</td> 			  	
					</tr>
				 </c:if>				 
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
		  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	

