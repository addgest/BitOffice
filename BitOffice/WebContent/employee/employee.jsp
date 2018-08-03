<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">

<head>
    <title>Bit Office</title>
    <meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    
     <!-- Essential javascripts for application to work-->
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/popper.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    
     <!-- The javascript plugin to display page loading on top-->
    <script src="/js/plugins/pace.min.js"></script>
    
    <!-- Data table plugin-->
    <script type="text/javascript" src="/js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="/js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script>
    
    <!-- 달력 사용을 위한 CDN -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!--  justgage charts사용  -->
<script src="/javascript/raphael-2.1.4.min.js"></script>
 <script src="/javascript/justgage.js"></script>

    
   <script src="/js/employee.js"></script>
   <script type="text/javascript">
   
   var g1;
	var result = ${returnList}

	if(result != null){
		

	    document.addEventListener("DOMContentLoaded", function(event) {
	        g1 = new JustGage({
	            id: "g1",
	            value: result[0],
	            min: 0,
	            max: result[0]+result[1],
	            title: "잔여연차 : "+result[1]+"일",
	            label: "bitOffice"
	        });

	    });
		
	} else {
		alert("현재 등록된 연차가 없습니다.");
		
	}
   </script>
   
  </head>
  <body class="app sidebar-mini rtl">
    <!-- Navbar-->
    <header class="app-header">

 <%@include file="/layout/header.jsp"%>
    </header>
   	
   	<!-- Sidebar menu-->
<!-- 프로필 영역  -->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
     <%@include file="/layout/side.jsp"%>
 <!-- sidebar 메뉴 모음 -->    
    </aside>
    
    <main class="app-content">
    <c:choose>
		<c:when test="${menu=='addEmployeeView' }">
			<%@include file="/employee/addEmployeeView.jsp"%>
		</c:when>
		<c:when test="${menu=='getEmployee' }">
			<%@include file="/employee/getEmployee.jsp"%>
		</c:when>
		<c:when test="${menu=='updateEmployeeView' }">
			<%@include file="/employee/updateEmployeeView.jsp"%>
		</c:when>
		<c:when test="${menu=='useAnnualLeave' }">
			<%@include file="/employee/useAnnualLeave.jsp"%>
		</c:when>
		<c:when test="${menu=='listEmployee' }">
			<%@include file="/employee/listEmployee.jsp"%>
		</c:when>
    </c:choose>
    
	
    </main>
    
    <!-- Essential javascripts for application to work-->
    <script src="/js/main.js"></script>

  </body>
</html>
