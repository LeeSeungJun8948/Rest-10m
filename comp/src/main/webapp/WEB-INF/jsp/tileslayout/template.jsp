<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>MES</title>
 
<link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Bootstrap core JavaScript-->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script src="${pageContext.request.contextPath}/js/json.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
	
	
</head>
<body>
	<div id="wrapper">
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
			<tiles:insertAttribute name="left" />
		</ul>
		
		<div id="content-wrapper" class="d-flex flex-column">
		
			<div id="content">
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top">
					<tiles:insertAttribute name="header" />
				</nav>
				<div class="container-fluid">
					<tiles:insertAttribute name="body" />
				</div>
			</div>
			
			<footer class="sticky-footer bg-white">
				<tiles:insertAttribute name="footer" />
			</footer>
			
		</div>
		
	</div>


	<!-- End of Page Wrapper -->


	<!-- Core plugin JavaScript-->
	<script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>
	<!-- Page level plugins
	<script src="vendor/chart.js/Chart.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script> -->
</body>
</html>