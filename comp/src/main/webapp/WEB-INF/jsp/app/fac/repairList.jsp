<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
	<div>
	<h2>설비수리내역조회</h2>
	</div>
	<div id="grid"></div>
	
<script>
const dataSource = { 
		api : {
			readData : {
				url : 'ajax/repairList.do',
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
