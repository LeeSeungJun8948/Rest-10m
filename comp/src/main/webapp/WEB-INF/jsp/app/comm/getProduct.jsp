<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta charset="UTF-8">
<style type="text/css">
/* The Modal (background) */
.searchModal {
display: none; /* Hidden by default */
position: fixed; /* Stay in place */
z-index: 10; /* Sit on top */
left: 0;
top: 0;
width: 100%; /* Full width */
height: 100%; /* Full height */
overflow: auto; /* Enable scroll if needed */
background-color: rgb(0,0,0); /* Fallback color */
background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content {
background-color: #fefefe;
margin: 15% auto; /* 15% from the top and centered */
padding: 20px;
border: 1px solid #888;
width: 70%; /* Could be more or less, depending on screen size */
}
</style>

<title>Insert title here</title>
</head>
<body>
	<div id="modal" class="searchModal">
		<div class="search-modal-content">
			<div class="page-header">
				<h1>MODAL</h1>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-12">
							<h2>Modal창 테스트입니다.</h2>
						</div>
					</div>
				</div>
			</div>
			<hr>
<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="closeModal();">
<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">
</span>
</div>
</div>
	</div>
<script>
jQuery(document).ready(function () {
$("#modal").show();
});
function closeModal() {
$('.searchModal').hide();
};
</script>



	
</body>
</html>