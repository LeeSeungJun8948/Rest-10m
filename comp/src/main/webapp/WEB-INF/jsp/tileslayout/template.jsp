<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>


<!-- 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 -->
 
<link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">


<head>
<meta charset="EUC-KR" name="viewport" content="width=device-width, initial-scale=1">
<title>MES</title>

</head>
<body>
	<div id="wrapper">
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
			<tiles:insertAttribute name="left" />
		</ul>
		
		<div id="content-wrapper" class="d-flex flex-column">
		
			<div id="content">
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
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

	<!-- Bootstrap core JavaScript-->
	<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>
</body>
</html>