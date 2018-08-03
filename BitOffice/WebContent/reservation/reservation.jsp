<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link rel="stylesheet" href="http://trentrichardson.com/examples/timepicker/jquery-ui-timepicker-addon.css">
	
	
<!-- The javascript plugin to display page loading on top-->
<script src="/js/plugins/pace.min.js"></script>

<!--리스트 사용을 위한 선언-->
<script type="text/javascript" src="/js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/js/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
$('#sampleTable').DataTable();
</script>


<!-- include summernote css/js -->
<script src="/js/reservation.js"></script>
<script type="text/javascript">

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
	
	<main class="app-content"> <c:choose>
		<c:when test="${menu=='addReservation'}">
			<%@include file="/reservation/addReservation.jsp"%>
		</c:when>
		<c:when test="${menu=='listReservation'}">
			<%@include file="/reservation/listReservation.jsp"%>
		</c:when>
		<c:when test="${menu=='updateReservation'}">
			<%@include file="/reservation/updateReservation.jsp"%>
		</c:when>
		<c:when test="${menu=='getReservation'}">
			<%@include file="/reservation/getReservation.jsp"%>
		</c:when>
		<c:when test="${menu=='myReservation'}">
			<%@include file="/reservation/myReservation.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="/reservation/myReservation.jsp"%>
		</c:otherwise>
	</c:choose> 
	</main>

<script src="/js/main.js"></script>

</body>
</html>