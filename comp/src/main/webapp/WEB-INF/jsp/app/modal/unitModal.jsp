<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<div id="modalContent">
	<div class="modal-header">
		<h1>TEST</h1>
	</div>
	<div class="modal-body">
		<!-- 필요한것 집어넣기 BODY 부분 -->
		<div id=unitCodeGird></div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			<a href="#" rel="modal:close"><button class="btn btn-primary">검색</button></a>
		</div>
	</div>
</div>
<script type="text/javascript">
	var cdataSource = {
		api : {
			readData : {
				url : 'ajax/getUnitList.do',
				method : 'GET'
			}

		},
		contentType : 'application/json'
	};
	
	var unitGrid = new tui.Grid({
		el : document.getElementById('unitCodeGird'),
		data : cdataSource,
		rowHeaders : [ 'checkbox' ],
		scrollX : false,
		scrollY : false,
		columns : [ {
			header : '규격코드',
			name : 'codeId'
		}, {
			header : '규격',
			name : 'code'
		} ]
	});
	
</script>
