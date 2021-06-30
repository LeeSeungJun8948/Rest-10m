<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1 class="h3 mb-4 text-gray-700">설비관리</h1>
<form action="insertFac.do" method="post" >
	<div class="mb-4">
		<input type="submit" class="btn btn-primary" value="저장">
		<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
	</div>
	<div class="row">
		<div class="mb-4 col-lg-8">
			<table class="table">
				<tbody>
					<tr>
						<th>설비명</th>
						<td><input type="text" id="facilitiesName" name="facilitiesName"></td>
						<th>모델</th>
						<td><input type="text" id="model" name="model"></td>
					</tr>
					<tr>
						<th>설비규격</th>
						<td><input type="text" id="facSize" name="facSize"></td>
						<th>제작업체</th>
						<td><input type="text" id="productionCompany" name="productionCompany"></td>
						<th>용도</th>
						<td><input type="text" id="purpose" name="purpose"></td>
					</tr>
					<tr>
						<th>용량/규격</th>
						<td><input type="text" id="volume" name="volume"></td>
						<th>제작일자</th>
						<td><input type="date" id="productionDate" name="productionDate"></td>
						<th>사원번호</th>
						<td><input type="text" id="empNo" name="empNo"></td>
					</tr>
					<tr>
						<th>구매금액</th>
						<td><input type="text" id="price" name="price"></td>
						<th>정기점검주기</th>
						<td><input type="text" id="facInspection" name="facInspection"></td>
						<th>구매일자</th>
						<td><input type="date" id="purchaseDate" name="purchaseDate"></td>
					</tr>
					<tr>
						<th>이미지</th>
						<td><input type="text" id="img" name="img"></td>
						<th>공정코드</th>
						<td><input type="text" id="processCode" name="processCode"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</form>
<div id="grid"></div>
<script type="text/javascript">
	
	/* var gridData;
	
	$.ajax({
		type : "get",
		url : "ajax/facList.do",
		dataType : "json",
		async : false,
		success : function(data) {
			gridData = data;
		},
		error : function() {
		}
	}); */
	
	const dataSource = {
			api : { 
				readData : {url: 'ajax/facList.do', method:'GET'},
				deleteData : {url: 'ajax/deleteFac.do', method: 'POST'}
			},
			contentType: 'application/json'
	}
	
	const grid = new tui.Grid({
		el : document.getElementById('grid'),
		data : dataSource,
		// data : gridData,
		rowHeaders: ['checkbox'],
		scrollX : false,
		scrollY : false,
		columns : [ {
			header : '설비코드',
			name : 'facCode'
		}, {
			header : '설비명',
			name : 'facilitiesName'
		}, {
			header : '모델',
			name : 'model'
		}, {
			header : '규격',
			name : 'facSize'
		}, {
			header : '제작업체',
			name : 'productionCompany'
		}, {
			header : '용도',
			name : 'purpose'
		}, {
			header : '용량/규격',
			name : 'volume'
		}, {
			header : '제작일자',
			name : 'productionDate'
		}, {
			header : '사원번호',
			name : 'empNo'
		}, {
			header : '구매금액',
			name : 'price'
		}, {
			header : '정기점검주기',
			name : 'facInspection'
		}, {
			header : '구매일자',
			name : 'purchaseDate'
		}, {
			header : '이미지',
			name : 'img'
		}, {
			header : '공정코드',
			name : 'processCode'
		} ]
	});
	
	$("#btnDelete").on("click",function() {
		grid.removeCheckedRows(false);
		grid.request('deleteData');
})
</script>