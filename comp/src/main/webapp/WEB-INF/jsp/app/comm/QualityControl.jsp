<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<title>Insert title here</title>

<style type="text/css">
.table {
	border-bottom: 1px;
}

th {
	width: 120px;
}

td {
	width: 300px;
}
</style>
</head>
<body>
	<div>
		<h3>제품 품질 표준서 관리</h3>
	</div>
	<div class="flex row" style="height: 300px">
	<div class="col-9" style="height: 300px">
		<table class="table">
			<tr>
				<th scope="row">제품코드 <span style="color: red">*</span>
				</th>
				<td width="300px">

					<form id="searchCheck" name="searchCheck" style="float: left">
						<input type="text" size="20" tabindex="1" id='pdc'
							name="productCode" style="background-color: #e2e2e2;" readonly
							style="margin-top: 4px" value="${proInfo.productCode}">
					</form> <a id="search" href="qcModal.do" rel="modal:open"
					class="btn btn-primary" style="margin-left: 10px"> <img
						src="<c:url value='/images/egovframework/com/cmm/btn/btn_search.png'/>">
				</a>
				</td>
				<th scope="row">제품명</th>
				<td><input id ="productName" name="productName" type="text" value="${proInfo.productName}"></td>
				<th>Q.C담당자</th>
				<td colspan="3"><input id = "employeeName" name="employeeName" type="text" value="${proInfo.employeeName}"></td>
			</tr>
			<tr>
			
				<th scope="row">규격</th>
				<td><input id="stdId" name="stdId" type="text" value="${proInfo.stdId}"></td>
				<th>관리단위</th>
				<td><input id="unitNo" name="unitNo" type="text" value="${proInfo.unitNo}" ></td>
				<th>사용여부</th>
				<td style="width: 40px"><input type="checkbox" name="useAt" id="useAt"
					style="width: 20px; height: 20px"
					<c:if test="${proInfo.useAt eq 'Y'} ">checked="checked"</c:if>
					></td>
				<th style="width: 90px; padding-right: 1px; border-right: 1px" align="center">성적서</th>
				<td style="padding-left: 0px">
					<input type="file" id="qcImg" name="uploadFile" accept="image/*"
					style="display: none" onchange="setThumbnail(event);">
					<button type="button" class="btn btn-primary" id="btnQcImg" style="font-size: 5px">추가</button>
				</td>
			</tr>

			</table>
		</div>
		<div class = "col-3" style="height: 300px">
	
			<div id="imagePreview">
				<img id="image" style="height: 250px; width: 350px"/>
			</div>
			
		
		</div>
	</div>
	
	<div class="row">
		<div class="col-6">
			
		</div>
	
	</div>
	<div class="row" >
		<div class="col-6">제품</div>
		<div class="col-6" align="right">
			<button type="button" class="btn btn-primary" id="RowInsert">+</button>
			<button type="button" class="btn btn-primary" id="btnInsert">저장</button>
			<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
		</div>
	</div>

		<div id="proGrid"></div>
  
</body>
<script type="text/javascript" src="js/app/comm/Quality.js"></script>
</html>