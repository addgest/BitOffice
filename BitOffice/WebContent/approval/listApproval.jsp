<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- 전자결재 관련 function 사용을 위한 선언 -->
<script src="/js/approval_list.js"></script>

	<div class="app-title">
		<div>
			<h1>결재대기문서</h1>			
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

	<!-- 새결재등록 1단계 Modal -->
	<div class="modal fade" id="selectTypeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel2">Bitoffice</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div style="padding-left:20px;">
		        * 연차사용 : 기간&사용일수 필수 입력 ex)연차,하계휴가 등<br>
		        * 비연차사용: 기간&사용일수 입력없음 ex)비용처리, 증명서 신청 등<br>      
	      	 	* 순차합의 : 결재자 순서대로 결재<br>
	      	 	* 병렬합의 : 결재자의 순서없이 결재<br>
	      </div>
	      <div class="modal-body">
	      		 <form class="form-inline" id="modalForm" name="modalForm">
					  <div class="form-group">					   
					    <select id="docType" name="docType" class="form-control">
							<option value="1">연차관련</option>
							<option value="2">비연차관련</option>					
						</select>
					  </div>
					  <div class="form-group">					   
					    <select id=approvalOrder name="approvalOrder" class="form-control">
							<option value="1">순차합의</option>
							<option value="2">병렬합의</option>					
						</select>
					  </div> 
				  				  					  
				  </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
 	        <button type="button" id="myFormSubmit" class="btn btn-primary">다음</button> 
	      </div>
	    </div>
	  </div>
	</div>	

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="tab-pane fade active show">
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row" style="padding-left:30px">
	    	<div class="form-group row"> 
			  <div class="col-xs-1">
	    		<button type="button" id="writeApproval" class="btn btn"  >새결재등록</button>
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
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제목</option>
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
      <table class="table table-hover table-striped" id="myTable2">
      
        <thead>
          <tr>
            <th align="center" >No</th>
            <th align="left" onclick="sortTable(1);" style="cursor:pointer">기안일</th>
            <th align="left" onclick="sortTable(2);" style="cursor:pointer">문서번호</th>
            <th align="left" onclick="sortTable(3);" style="cursor:pointer">결재양식</th>
          	<th align="left" onclick="sortTable(4);" style="cursor:pointer">합의방식</th>            
            <th align="left" onclick="sortTable(5);" style="cursor:pointer">제목</th>  
            <th align="left" onclick="sortTable(6);" style="cursor:pointer">결재상태</th>
            <th align="left" onclick="sortTable(7);" style="cursor:pointer">작성자</th>         
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="approval" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left">${approval.regDate}</td> 
			  <td align="left" style="color:#0054FF;cursor:pointer;"><c:out value="${fn:substring(approval.docNo,0,8)}-${fn:substring(approval.docNo,8,12)}"/></td>
			  <td align="left"><c:if test = "${fn:trim(approval.docType) == '1'}">연차</c:if>
			  				   <c:if test = "${fn:trim(approval.docType) == '2'}">일반</c:if></td> 
			  <td align="left"><c:if test = "${fn:trim(approval.docApprovalOrder) == '1'}">순차</c:if>
			  				   <c:if test = "${fn:trim(approval.docApprovalOrder) == '2'}">병렬</c:if></td> 				   
			  <td align="left">${approval.title}</td>			   
			  <td align="left"><c:choose><c:when test = "${fn:trim(approval.docStatus) == '1'}">대기</c:when>
			  							 <c:when test = "${fn:trim(approval.docStatus) == '2'}">진행중</c:when>
			  							 <c:when test = "${fn:trim(approval.docStatus) == '3'}">완료</c:when>
			  							 <c:when test = "${fn:trim(approval.docStatus) == '9'}">반려</c:when></c:choose></td>
			  <td align="left">${approval.departmentName} ${fn:trim(approval.positionName)} ${approval.regEmployeeName}</td>	
			</tr>
          </c:forEach>
        
        
        </tbody>
      
	
		   
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
	 	<!-- PageNavigation Start... -->
		<jsp:include page="../common/pageNavigator_new.jsp"/>
		<!-- PageNavigation End... -->   
				  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	

