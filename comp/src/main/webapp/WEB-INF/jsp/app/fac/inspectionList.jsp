<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
	<div>
	<h2>설비 점검내역 조회</h2>
	</div>
	<div id="grid"></div>
<script type="text/javascript">
const dataSource = {
		api : {
			readData : { url: contextPath + '/ajax/inspecList.do', method:'GET' },
		},
		contentType: 'application/json'
	}    
	const grid = new tui.Grid({ 
		el : document.getElementById('grid'),
		data : dataSource,
		scrollX : false,
		scrollY : false,
		columns : [ {
			header : '정기점검코드',
			name : 'inspectionCode'
		}, {
			header : '설비코드',
			name : 'facCode'
		}, {
			header : '설비명',
			name : 'facilitiesName'
		},  {
			header : '설비점검주기',
			name : 'facInspection'
		}, {
			header : '전점검일',
			name : 'beforeDate'
		}, {
			header : '점검일',
			name : 'today'
		}, {
			header : '차기점검일',
			name : 'afterDate'
		}, {
			header : '판정',
			name : 'judgement'
		}, {
			header : '조치사항',
			name : 'insComment'
		}]
	});
</script>