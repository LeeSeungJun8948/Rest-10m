<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- Topbar Navbar -->
<ul class="navbar-nav ml-auto">

	<div class="topbar-divider d-none d-sm-block"></div>

	<!-- Nav Item - User Information -->
	<li class="nav-item dropdown no-arrow">
		<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
			<span class="mr-2 d-none d-lg-inline text-gray-600 small">${loginVO.name}</span> 
		</a> 
	<!-- Dropdown - User Information -->
		<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
			<a class="dropdown-item" href="${pageContext.request.contextPath}/uat/uia/actionLogout.do"> 
				<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400" ></i> 로그아웃
			</a>
		</div>
	</li>
</ul>