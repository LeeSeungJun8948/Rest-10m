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

	<div>
		<table class="table">
			<tr>
				<th scope="row">제품코드 <span style="color: red">*</span>
				</th>
				<td width="300px">

					<form id="searchCheck" name="searchCheck" style="float: left">
						<input type="text" size="20" tabindex="1" id='pdc'
							name="productCode" value="${proInfo.productCode }"
							style="margin-top: 4px">
					</form> <a id="search" href="qcModal.do" rel="modal:open"
					class="btn btn-primary" style="margin-left: 10px"> <img
						src="<c:url value='/images/egovframework/com/cmm/btn/btn_search.png'/>">
				</a>
				</td>
				<th scope="row">제품명</th>
				<td><input type="text" value="${proInfo.productName }"></td>
				<th scope="row">규격</th>
				<td><input type="text" value="${proInfo.stdId }"></td>
				<th>Q.C담당자</th>
				<td><input type="text" value="${proInfo.employeeName }"></td>
			</tr>
			<tr>
				<th>고객코드</th>
				<td><input type="text" value="${company.compCode}"></td>
				<th>고객명</th>
				<td><input type="text" value="${company.compName}"></td>
				<th>관리단위</th>
				<td><input type="text" value="${proInfo.unitNo }"></td>
				<th>사용여부</th>
				<td><input type="checkbox" name="checkYn" id="checkYn"
					style="width: 20px; height: 20px"
					<c:if test="${proInfo.useAt eq 'Y'}">checked="checked"</c:if>
					value="${proInfo.useAt }"></td>
			</tr>

		</table>
	</div>
	<div>
		<h3>이미지 첨부</h3>
	</div>
	<div class="row">
		<div class="col-6">
			<input type="file" id="pimg" name="uploadFile" accept="image/*"
				style="display: none" onchange="setTumbnail(event);">
			<button type="button" class="btn btn-primary" id="btnPimg">이미지업로드</button>
			<h4>이미지 미리보기</h4>
			<div id="pImgPreview">
				<img id="pimg" />
			</div>
		</div>
		<div class="col-6">품질표준서 들어가는 곳</div>
	</div>
	<div class="row">
		<div class="col-6">제품</div>
		<div class="col-6" align="right">
			<button type="button" class="btn btn-primary" id="RowInsert">+</button>
			<button type="button" class="btn btn-primary" id="btnInsert">저장</button>
			<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
		</div>
	</div>
<!--
		<div id="proGrid"></div>
		<script type="text/javascript">
			const pdataSource = {
				api : {
					readData : {url : 'ajax/getProductList.do', method : 'GET'}
			

				},
				contentType : 'application/json'
			};
			const progrid = new tui.Grid({
				el : document.getElementById('proGrid'),
				data : pdataSource,
				rowHeaders: ['checkbox'],
				scrollX : false,
				scrollY : false,
				columns : [ 
					{
						header : '제품코드',
						name : 'productCode',
						editor : 'text'

					}, 
					{
						header : '제품명',
						name : 'productName',
						editor : 'text'
					}, 
					{
						header : '규격',
						name :  'stdId'
						
					},
					{
						header : '규격코드',
						name :  'stdNo'
						
					},
					{
						header : '단위코드',
						name :  'unitId'
						
					},
					{
						header : '관리단위',
						name :  'unitNo',
						
					},
					{
						header : '사원코드',
						name :  'empCode',
						editor : 'text'
					},
					{
						header : '사용여부',
						name :  'useAt',
						formatter:'listItemText',
						editor:{
							type:'select',
							options:{
								listItems:[
									{text:'사용',value:'Y'},
									{text:'미사용', value:'N'}
								]
							}
						}
					},

					]
			    });
			$("#RowInsert").on("click", function(){
				progrid.appendRow();
			});
			
			</script>
  -->
</body>
<script type="text/javascript" src="js/app/modal/qcModal.js"></script>
<script type="text/javascript" src="js/app/comm/product.js"></script>
</html>