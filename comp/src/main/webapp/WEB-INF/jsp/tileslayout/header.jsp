<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- Sidebar Toggle (Topbar) -->
<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
	<i class="fa fa-bars"></i>
</button>

<!-- Topbar Navbar -->
<ul class="navbar-nav ml-auto">
	<!-- Nav Item - Search Dropdown (Visible Only XS) -->
	<li class="nav-item dropdown no-arrow d-sm-none">
		<a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
			<i class="fas fa-search fa-fw"></i>
		</a> 
		<!-- Dropdown - Messages -->
		<div class="dropdown-menu dropdown-menu-right p-3 animated--grow-in" aria-labelledby="searchDropdown">
			<form class="form-inline mr-auto w-100 navbar-search">
				<div class="input-group">
					<input type="text" class="form-control bg-light border-0 small"	placeholder="Search for..." aria-label="Search"	aria-describedby="basic-addon2">
					<div class="input-group-append">
						<button class="btn btn-primary" type="button">
							<i class="fas fa-search fa-sm"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
	</li>

	<div class="topbar-divider d-none d-sm-block"></div>

	<!-- Nav Item - User Information -->
	<li class="nav-item dropdown no-arrow">
		<a class="nav-link dropdown-toggle" href="#" id="userDropdown" 
			role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
		<span class="mr-2 d-none d-lg-inline text-gray-600 small">${loginVO.name} </span> 
		</a> 
	<!-- Dropdown - User Information -->
		<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
			<a class="dropdown-item" href="${pageContext.request.contextPath}/uat/uia/actionLogout.do"> 
				<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400" ></i> 로그아웃
			</a>
		</div>
	</li>
</ul>