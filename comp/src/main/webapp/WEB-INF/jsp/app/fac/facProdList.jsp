<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
	<div>
	<h2>설비생산이력조회</h2>
	</div>
		<div class="mb-2" style="float:right">
			<form id="searchCheck" name="searchCheck">
				<label>제품명 검색
				<input type="text" id="searchKeyword" name="searchKeyword" title="검색어" class="form-control" style="width:200px;">
				</label>
				<button type="button" class="btn btn-primary" id="btnSearch">조회</button>
			</form>
		</div>
	<div id="grid"></div>
	<script type="text/javascript">
		
		const dataSource = {
				api : {
					readData : {url: 'ajax/facProd.do', method : 'GET'}
				},
				contentType: 'application/json'
		}
	
		const grid = new tui.Grid({
			el : document.getElementById('grid'),
			data : dataSource,
			scrollX : false,
			scrollY : false,
			columns : [ {
				header : '설비코드',
				name : 'facCode'
			}, {
				header : '설비명',
				name : 'facilitiesName'
			}, {
				header : '제품코드',
				name : 'productCode'
			}, {
				header : '제품명',
				name : 'productName'
			}]
		});
		
		$.fn.serializeObject = function() {
			var o = {};
			var a = this.serializeArray();
			$.each(a, function() {
				if (o[this.name]) {
					if (!o[this.name].push) {
						o[this.name] = [o[this.name]];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		};
		
		$("#btnSearch").on("click",function() {
			var param = $('#searchCheck').serializeObject();
			grid.readData(1, param, true);
		})
		grid.on('response', function(data) {
			grid.resetOriginData();
		}) 			
			
	</script>