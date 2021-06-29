<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style type="text/css">
.findbtn{
	vertical-align: middle;
	font-size: inherit; !important;
	width: 21px;
	height: 21px;
	min-height: 21px !important;
	border-radius: .25em;
	border: 0;
	background-size: 60%;
}
</style>	
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="stylesheet"
   href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
</head>
<body>
	<div>
		<h1>제품BOM관리</h1>
	</div>
	<div>
		<table>
			<tr>
				<th width="100px" scope="row">
				제품코드
					<span style="color: red">*</span>
				</th>
				<td width="380px">
					<input type="text" maxlength="20" tabindex="1"  id="prdCode">
					<a href="modal.do" rel="modal:open" class="btn btn-info btn-lg">검색</a>
					<button type="button" class="btn btn-primary" id="btnSearch">값조회</button>
				</td>
				<th scope="row">제품명</th>
				<td width="380px">${info.productName }</td>
				<th scope="row">규격</th>
				<td width="380px">${info.unitNo }</td>
			</tr>
			<tr>
				<th>고객코드</th>
				<td>${info.companyCode }</td>
				<th>고객사명</th>
				<td>${info.companyName }</td>
				
			</tr>
		</table>
	</div>
	<div style="margin-top: 40px">
		<h3>제품 소요량 관리</h3>
	</div>
		<div id="bomgrid" >
		       <script type="text/javascript">
         			const dataSource = {
						api : {
							readData : {url: 'ajax/getInfoProduct.do', method:'get'},
						},
						contentType: 'application/json'
				}; 
				const grid = new tui.Grid({
					el : document.getElementById('bomgrid'),
					data : dataSource,
					scrollX : false,
					scrollY : false,
					columns : [
					{
						header : '자재코드',
						name : 'materialCode',
					},
					{
						header :'자재명',
						name : 'materialName',
					}, 
					{
						header :'사용공정',
						name : 'processName',
					}
					]
				});

		</script>
	</div>   
	 
	
	<div>
		<table>
			<tr>
				<th>자재코드</th>
				<th>자재명</th>
				<th>사용공정</th>
			</tr>
			<c:forEach items="${binfo }" var="bl">
				<tr>
					<td>${bl.materialCode }</td>
					<td>${bl.materialName }</td>
					<td>${bl.processCode }</td>
				</tr>
			</c:forEach>
		</table>
	</div> 

</body>
</html>