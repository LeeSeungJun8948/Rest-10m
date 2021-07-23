<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
	<form id="searchCheck" name="searchCheck" method="post"
		action="repairListExcel.do">
		<div class="row">
			<div class="col-md-8">
				<h1 class="h3 mb-4 text-gray-700">설비 수리내역 조회</h1>
			</div>
		</div>
			<div class="mb-4" align="right">
					<input type="submit" class="btn-two blue small" id="btnExcel"
						value="Excel">
				</div>
	</form>
	<div id="grid"></div>
	
<script>
const dataSource = { 
		api : {
			readData : {
				url : contextPath + '/ajax/repairList.do',
				method : 'GET'
			}
		},
		contentType : 'application/json'
	}

	const grid = new tui.Grid({
		el : document.getElementById('grid'),
		data : dataSource,
		scrollX : false,
		scrollY : false,
		columns : [ {
			header : '수리코드',
			name : 'repairCode'
		}, {
			header : '설비명',
			name : 'facilitiesName'
		}, {
			header : '수리일자',
			name : 'repairDate'
		}, {
			header : '수리내역',
			name : 'repairComment'
		}, {
			header : '업체명',
			name : 'companyName'
		}, {
			header : '수리금액',
			name : 'cost'
		}, {
			header : '비고',
			name : 'etc'
		} ]
	});
</script>
