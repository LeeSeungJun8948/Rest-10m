<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<form id="frm" name="frm" method="post" action="viewErrorExcel.do">
	<div class="row">
		<div class="col-md-8">
			<h1 class="h3 mb-4 text-gray-700">불량 내역 조회</h1>
		</div>
		<div class="col-md-4 mb-4" align="right" role="form">
			<button type="button" class="btn btn-primary" id="btnRead">조회</button>
			<input type="submit" class="btn btn-primary" id="btnExcel" value="엑셀">
		</div>
	</div>
	<div class="row">
		<div class="mb-2 col-md-6">
			<table class="table">
				<tbody>
					<tr>
						<th>작업일자</th>
						<td>
							<div class="row">
								<div class="col-md-5">
									<input type="date" class="form-control" id="startDate" name="startDate">
								</div>
								~ 
								<div class="col-md-5">
									<input type="date" class="form-control" id="endDate" name="endDate">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>제품코드</th>
						<td>
							<div class="row">
								<div class="col-md-4">
									<input readonly class="form-control" type="text" id="productCode" name="productCode">
								</div>
								<a id="search" href="errorProductModal.do" rel="modal:open" style="margin-left: 10px">
									<img src="<c:url value='/images/app/all/btn_search.png'/>">
								</a>
								<div class="col-md-6">					
									<input readonly class="form-control" type="text" id="productName" name="productName">
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="mb-4 col-lg-6">
		</div>
	</div>
</form>

<div class="col-lg-12">
	<div id="errorGrid"></div>
</div>
<script type="text/javascript">
	var dataSource = {
		api : {
			readData : {url : 'ajax/detailErrorList.do', method : 'get'},
		},
		contentType : 'application/json'
	};
	var errorGrid = new tui.Grid({
		el : document.getElementById('errorGrid'),
		data : dataSource,
		scrollX : false,
		scrollY : false,
		columns : [ {
				header : '공정명',
				name : 'processName'
			}, {
				header : '불량발생일자',
				name : 'workDate'
			}, {
				header : '작업량',
				name : 'workCount'
			}, {
				header : '불량량',
				name : 'errorCount'
			}, {
				header : '제품코드',
				name : 'productCode'
			}, {
				header : '제품명',
				name : 'productName'
			}, {
				header : '제품LOT',
				name : 'productLot'
			}, {
				header : '작업지시번호',
				name : 'workCode'
			}, {
				header : '불량코드',
				name : 'errorCode'
			} ]
		});
	$('#btnRead').on('click',  function(){
		var param = $('#frm').serializeObject();
		errorGrid.readData(1, param, true);
	});
</script>