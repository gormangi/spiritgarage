<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/js/admin/left.js"></script>

<input type="hidden" id="activeUrl" value="${activeUrl }"/>
<aside class="main-sidebar sidebar-dark-primary elevation-4">

	<a href="/admin/mngrManagement" class="brand-link">
		<img src="/images/admin_img/adminIco.jpg" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
		<span class="brand-text font-weight-light">SPIRIT ADMIN</span>
	</a>

	<div class="sidebar">
	
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img src="/images/admin_img/AdminLTELogo.png" class="img-circle elevation-2" alt="User Image">
			</div>
			<div class="info">
				<a href="javascript:void(0);" class="d-block" id="left_welcomeMessage"></a>
			</div>
		</div>

		<nav class="mt-2" id="spiritAdmMenuList">
			<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
				<li class="nav-item" id="menu_mngrManagement">
					<a href="/admin/mngrManagement" class="nav-link">
						<i class="nav-icon fas fa-table"></i>
						<p>관리자 계정 관리</p>
					</a>
				</li>
				<li class="nav-item" id="menu_reservationManagement">
					<a href="/admin/reservationManagement" class="nav-link">
						<i class="nav-icon fas fa-table"></i>
						<p>예약 관리</p>
					</a>
				</li>
				<li class="nav-item" id="menu_noticeManagement">
					<a href="/admin/noticeManagement" class="nav-link">
						<i class="nav-icon fas fa-table"></i>
						<p>공지사항 관리</p>
					</a>
				</li>
			</ul>
		</nav>
		
	</div>
</aside>