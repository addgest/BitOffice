<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- Sidebar menu-->
<!-- 프로필 영역  -->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
	<div class="app-sidebar__user">
     <img class="app-sidebar__user-avatar" src="/profileFiles/${employee.profileImage}" alt="User Image" style="width: 80px; height: 80px;">
        <div>
          <p class="app-sidebar__user-name">이름 : ${employee.employeeName}</p>
          <p class="app-sidebar__user-designation">부서 : ${employee.departmentName}</p>
        </div>
      </div>
<!-- 프로필 영역  -->

<!-- sidebar 메뉴 모음 -->      
      <ul class="app-menu">
        
        <li class="treeview"><a class="app-menu__item active" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-laptop"></i><span class="app-menu__label">내 정보</span>
        <i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="/employee/updateEmployee?employeeNo=${employee.employeeNo}"><i class="icon fa fa-circle-o"></i>내 정보 수정</a></li>
            <li><a class="treeview-item" href="/employee/useAnnualLeave?employeeNo=${employee.employeeNo}"><i class="icon fa fa-circle-o"></i>연차 사용 내역</a></li>
          </ul>
        </li>
        
        <li><a class="app-menu__item" href="/employee/listEmployee"><i class="app-menu__icon fa fa-address-card"></i><span class="app-menu__label">임직원 목록</span></a></li>

        <li class="treeview"><a class="app-menu__item" href="" data-toggle="treeview"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">근태</span>
        <i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="/ip/updateIpView"><i class="icon fa fa-circle-o"></i>IP 설정</a></li>
            <li><a class="treeview-item" href="/attendance/listAttendance"><i class="icon fa fa-circle-o"></i>근태현황</a></li>
          </ul>
        </li>
        
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-users"></i><span class="app-menu__label">회의실</span>
        <i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="/reservation/listReservation"><i class="icon fa fa-circle-o"></i>회의실 예약</a></li>
            <li><a class="treeview-item" href="/reservation/myReservation"><i class="icon fa fa-circle-o"></i>내 예약 보기</a></li>
            </ul>
        </li>
            
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-calendar"></i><span class="app-menu__label">일정</span>
        <i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="/schedule/schedule"><i class="icon fa fa-circle-o"></i> 일정 관리</a></li>
            <li><a class="treeview-item" href="/share/updateShareView"><i class="icon fa fa-circle-o"></i>일정 공유 현황</a></li>
          </ul>
        </li>
        
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-exchange"></i><span class="app-menu__label">전자결재</span>
        <i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="/approval/listApproval"><i class="icon fa fa-circle-o"></i>결재대기문서</a></li>
            <li><a class="treeview-item" href="table-data-table.html"><i class="icon fa fa-circle-o"></i>참조대기문서</a></li>
          <li><a class="treeview-item" href="table-data-table.html"><i class="icon fa fa-circle-o"></i>기안완료함</a></li>
          <li><a class="treeview-item" href="table-data-table.html"><i class="icon fa fa-circle-o"></i>참조완료함</a></li>
          </ul>
        </li>
        
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-cloud"></i><span class="app-menu__label">파일공유</span>
        <i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="table-basic.html"><i class="icon fa fa-circle-o"></i> Basic Tables</a></li>
            <li><a class="treeview-item" href="table-data-table.html"><i class="icon fa fa-circle-o"></i> Data Tables</a></li>
          </ul>
        </li>

        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">공지사항</span>
        <i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="/board/listBoard?orderby="><i class="icon fa fa-circle-o"></i>공지사항 목록</a></li>
            <li><a class="treeview-item" href="/board/addBoard"><i class="icon fa fa-circle-o"></i>공지사항 작성</a></li>
          </ul>
        </li>
        
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-cogs"></i><span class="app-menu__label">관리자</span>
        <i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="/department/listDepartment"><i class="icon fa fa-circle-o"></i> 부서등록</a></li>
            <li><a class="treeview-item" href="/position/listPosition"><i class="icon fa fa-circle-o"></i>직급등록</a></li>
            <li><a class="treeview-item" href="/employee/addEmployee"><i class="icon fa fa-circle-o"></i> 임직원등록</a></li>
            <li><a class="treeview-item" href="/standardtime/updateStandardTimeView"><i class="icon fa fa-circle-o"></i> 출퇴근 기준시간</a></li>
           <li><a class="treeview-item" href="/meetingRoom/listMeetingRoom"><i class="icon fa fa-circle-o"></i>회의실 관리</a></li>
           <li><a class="treeview-item" href="/employee/resignList"><i class="icon fa fa-circle-o"></i>퇴사자 목록</a></li>
          </ul>
        </li>
      </ul>
  