<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 전자결재 관련 function 사용을 위한 선언 -->
<script src="/js/approval_get.js"></script>


	<div class="app-title">
		<div>
			<h1>결재상세보기
			       <c:if test="${fn:trim(approval.docStatus)=='1'}">(대기</c:if>
			       <c:if test="${fn:trim(approval.docStatus)=='2'}">(진행</c:if>
			       <c:if test="${fn:trim(approval.docStatus)=='3'}">(완료</c:if>
			       <c:if test="${fn:trim(approval.docStatus)=='9'}">(반려</c:if>
			       <c:if test="${fn:trim(approval.docApprovalOrder)=='1'}">/순차합의)</c:if>
				   <c:if test="${fn:trim(approval.docApprovalOrder)=='2'}">/병렬합의)</c:if></h3></h1>			
		</div>
	</div>
	
	
	<div id="permit_modal" class="modal fade" tabindex="-1" role="dialog">
		<form name="detailForm">	
			    	<br><br><br><br><br><br><br>
			  		<br><br><br><br><br><br><br>						
			    <div class="modal-dialog" role="document">
			        <div class="modal-content">
			            <div class="modal-header p-3 mb-2 bg-success text-white" id="hearBgColor" >                
			                <h4 class="modal-title text-center" id="headerTitle">승인</h4>
			            </div>
			            <div class="modal-body">  
                      
							<div class="row">
								<div class="col-xs-3">
									<label class="col-xs-3" for="title">메모</label>
								</div>
			                    <div class="col-xs-12">
			                        
			                        <input  class="form-control" type="text" id="memo" name="memo"  />
			                        <input type="hidden" id="say" name="say"  />
			                    </div>
			                </div>             	                  
			            </div>
			            <div class="modal-footer">
			            	<button type="button" class="btn btn-primary" id="save-event">등록</button> 
			                <button type="button" class="btn btn" id="modalClose" data-dismiss="modal">닫기</button>                
			            </div>
			        </div><!-- /.modal-content -->
			    </div><!-- /.modal-dialog -->
		</form>		
	</div><!-- /.modal -->
	
	<div class="tab-pane fade active show">


			<div class="row">
				<form class="form-horizontal" enctype="multipart/form-data">
					<input type="hidden" id="docType" value="${approval.docType}">
					<input type="hidden" id="approvalOrder" value="${approval.docApprovalOrder}">
					<input type="hidden" id="employeeNo" name="employeeNo" value="${sessionScope.employee.employeeNo}">
					<input type="hidden" id="approvalNo" name="approvalNo" value="${approval.docNo}">
					<div id="approval_member"></div>
					<div id="reference_member"></div>
	
					<!-- 		<input type="submit"  class="btn btn-primary pull-right" value="글쓰기"> -->
					<button type="button" class="btn btn-default">목록</button>
					
				
					
					<c:if test = "${fn:trim(sessionScope.employee.employeeNo) == fn:trim(approval.regEmployeeNo) }">
						<c:if test = "${fn:trim(approval.docStatus)=='1' }"> 	
						    <button type="button" id="updateApproval" class="btn btn" >수정</button>
							<button type="button" id="deleteApproval" class="btn btn" >삭제</button>
						</c:if>	
					</c:if>
					<c:if test = "${fn:trim(approval.docStatus)<='2' }"> 	
						<button type="button" id="permitApproval" class="btn btn" >승인</button>				
						<button type="button" id="rejectApproval" class="btn btn" >반려</button>
					</c:if>
					<table class="table table-bordered" style="text-align: center; boder: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="2" style="background-color: #eeeeee; text-align: center;">
									<c:if test="${fn:trim(approval.docType)=='1'}">연차기안</c:if>
									<c:if test="${fn:trim(approval.docType)=='2'}">일반기안</c:if>
									</th>
							</tr>
						</thead>
					</table>				
					<table class="table table-bordered" style="text-align: center;boder: 0px;background-color:#FFFFFF;" cellpadding=0 cellspacing=0>						
						<tbody >
							<tr>
								<td style="width:25%">
									<table width="100%" height="100%" class="table table-bordered" style="text-align: center; boder: 1px solid #dddddd;" cellpadding=0 cellspacing=0>						

											<tr>	
												<td style="background-color:#D5D5D5;">기안자</td>
												<td class="text-left">${approval.regEmployeeName}</td>	
										    </tr>
										    <tr>								
												<td style="background-color:#D5D5D5;">소 속</td>
												<td class="text-left">${approval.departmentName}</td>							
											</tr>	
											<tr>
												<td style="background-color:#D5D5D5;">기안일</td>
												<td class="text-left">${approval.regDate}</td>							
											</tr>	
											<tr>
												<td style="background-color:#D5D5D5;">문서번호</td>
												<td class="text-left">${fn:substring(approval.docNo,0,8)}-${fn:substring(approval.docNo,8,13)}</td>							
											</tr>

									</table>	
								</td>
								<td id="middleTd">
								</td>
								<td>
									<table class="table table-bordered" style="text-align: center; boder: 1px solid #dddddd">
										<tr id="approvalLine">																														
										</tr>											
									</table>										
								</td>																			
							</tr>						
						</tbody>
						
					</table>
									
					<table class="table table-bordered" style="text-align: center; boder: 1px solid #dddddd;background-color:#FFFFFF;">
						<tbody  id="fileTableTbody">	
					
							<tr>
								<td width="10%" style="background-color:#D5D5D5;">제 목</td>						
								<td class="text-left">${approval.title}</td>						
							</tr>
							<c:if test = "${fn:trim(approval.docType) =='1'}">
								<tr>
									<td style="background-color:#D5D5D5;">기 간</td>						
									<td class="text-left">${fn:substring(approval.startDate,0,4) }-${fn:substring(approval.startDate,4,6) }-${fn:substring(approval.startDate,6,8) }
									~${fn:substring(approval.endDate,0,4) }-${fn:substring(approval.endDate,4,6) }-${fn:substring(approval.endDate,6,8) }</td></tr>	
								<tr>
									<td style="background-color:#D5D5D5;">사용일수</td>						
									<td class="text-left">${approval.useDay }</td>						
								</tr>
							</c:if>							
							<tr>
								<td  style="background-color:#D5D5D5;">내 용</td>						
								<td height="250px" class="text-left">${approval.content}</td>
							</tr>						
							<tr>
								<td  style="background-color:#D5D5D5;">첨부파일</td>
							    <td  id="dropZone" class="text-left">
								    ${approval.fileName1} ${approval.fileName2} ${approval.fileName3}</td>
							</tr>
						</tbody>
						
					</table>
					       <c:if test ="${!empty approval.memo}">
					            <span class="badge badge-pill badge-info">${approval.departmentName} ${approval.positionName} ${approval.regEmployeeName}</span> ${approval.memo} [${approval.modDate}] <br><br>
						   </c:if>
						   <div id="approvalMemo"></div>
				</form>
			</div>

	</div>	
