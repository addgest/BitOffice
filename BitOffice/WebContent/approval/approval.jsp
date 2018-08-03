<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="toDay" class="java.util.Date" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:formatDate value='${toDay}' pattern='yyyyMMdd' var="nowDate"/>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta name="description"
		content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
	<title>Bit Office</title>
	<meta charset="EUC-KR">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Main CSS-->
	<link rel="stylesheet" type="text/css" href="/css/main.css">
	<!-- Font-icon css-->
	<link rel="stylesheet" type="text/css"
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!-- Essential javascripts for application to work-->
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	
	<!-- The javascript plugin to display page loading on top-->
	<script src="/js/plugins/pace.min.js"></script>
	
	<!--리스트 사용을 위한 선언-->
	<script type="text/javascript" src="/js/plugins/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="/js/plugins/dataTables.bootstrap.min.js"></script>
   
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>  -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>	 <!-- tree -->
	<!-- <script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

   <!-- 결재순서 -->
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	
	<!-- tree -->
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script> 
   
    <!-- bootstrap datetimepicker -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    
	<!--Timepicker Start /////////////////////////////////////-->
	
	<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>   -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    
    
	<!-- include summernote css/js --> 
	<link
		href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css"
		rel="stylesheet">
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 


   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>  
  
  
  
  <!-- jstree css -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
	  
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
     
	  #authorizationPerson { list-style-type: none; margin: 0; padding: 0; width: 80%; }
	  #authorizationPerson li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.4em; height: 18px; }
	  #authorizationPerson li span { position: absolute; margin-left: -1.3em; }      
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->



	
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

	<main class="app-content"> <c:choose>
		<c:when test="${menu=='addApprovalView'}">
			<%@include file="/approval/addApprovalView.jsp"%>
		</c:when>
		<c:when test="${menu=='listApproval'}">
			<%@include file="/approval/listApproval.jsp"%>
		</c:when>
		<c:when test="${menu=='updateApproval'}">
			<%@include file="/approval/addApproval.jsp"%>
		</c:when>
				<c:when test="${menu=='getApproval'}">
			<%@include file="/approval/getApproval.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="/approval/listApproval.jsp"%>
		</c:otherwise>
	</c:choose> 
	</main>

<script src="/js/main.js"></script>


</body>

</html>