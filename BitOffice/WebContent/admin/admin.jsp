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


    
   <script src="/js/resignEmployee.js.js"></script>
  
   
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
		<c:when test="${menu=='resignList' }">
			<%@include file="/employee/resignList.jsp"%>
		</c:when>
		
    </c:choose>
    
	
    </main>
    
    <!-- Essential javascripts for application to work-->
    <script src="/js/main.js"></script>

  </body>
</html>
