<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
</head>
<body>

	<button class="btn btn-outline-dark" id="btnInsert" type="button"> 자재 추가 </button>
	<button class="btn btn-outline-dark" id="btnSave" type="button"> 저장 </button>
	<button class="btn btn-outline-dark" id="btnDel" type="button"> 삭제 </button>
		
	<div class="row">				
		<div id="matList" class="col-4">
		</div>
		
		<div class="col-8 input-group input-group-sm">
			<form id="frm" class="form-inline" role="form" action="matUpdate.do" method="post">
			
				<div class="input-group-prepend" >
					<span class="input-group-text" id="inputGroup-sizing-sm">자재코드</span>
					<input id="materialCode" name="materialCode" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
				</div>
				<div class="input-group-prepend" >
					<span class="input-group-text" id="inputGroup-sizing-sm">자재명</span>
					<input id="materialName" name="materialName" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
				</div>
				<div class="input-group-prepend">
					<span class="input-group-text" id="inputGroup-sizing-sm">자재구분</span>
					<input id="matNm" name="matNm" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
				</div><br>
				
				
				<div class="input-group-prepend" >
					<span class="input-group-text" id="inputGroup-sizing-sm">입고업체</span>
					<input id="companyCode" name="companyCode" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
				</div>
				<div class="input-group-prepend" >
					<span class="input-group-text" id="inputGroup-sizing-sm">업체명</span>
					<input id="companyName" name="companyName" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
				</div>
				<div class="input-group-prepend">
					<span class="input-group-text" id="inputGroup-sizing-sm">관리단위</span>
					<input id="unitNo" name="unitNo" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
				</div> <br>
				
					<div class="input-group-prepend" >
					<span class="input-group-text" id="inputGroup-sizing-sm">안전재고</span>
					<input id="saveStock" name="saveStock" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
				</div>
				<div class="input-group-prepend" >
					<span class="input-group-text" id="inputGroup-sizing-sm">MIN재고</span>
					<input id="minStock" name="minStock" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
				</div>
				<div class="input-group-prepend">
					<span class="input-group-text" id="inputGroup-sizing-sm">MAX재고</span>
					<input id="maxStock" name="maxStock" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
				</div>
					<div class="input-group-prepend">
					<span class="input-group-text" id="inputGroup-sizing-sm">1M소요량</span>
					<input id="monthStock" name="monthStock" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
				</div>
			</form>
		</div>
	</div>
<script type="text/javascript" src="js/app/mat/matForm.js"></script>

</body>
</html>