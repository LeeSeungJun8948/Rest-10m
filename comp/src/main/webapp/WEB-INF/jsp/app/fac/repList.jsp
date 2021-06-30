<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
	<h1 class="h3 mb-4 text-gray-700">설비 수리내역 관리</h1>
	<form>
		<div class="mb-4">
			<button type="button" class="btn btn-primary">저장</button>
			<button type="button" class="btn btn-primary">삭제</button>
			<button type="button" class="btn btn-primary">조회</button>
		</div>
		<div class="row">
			<div class="mb-4 col-lg-8">
				<table class="table">
					<tbody>
						<tr>
							<th>수리코드</th>
							<td><input type="text"></td>
							<th>설비코드</th>
							<td><input type="text"></td>
							<th>수리일자</th>
							<td><input type="date"></td>
						</tr>
						<tr>
							<th>수리내역</th>
							<td><input type="text"></td>
							<th>업체코드</th>
							<td><input type="text"></td>
							<th>수리금액</th>
							<td><input type="text"></td>
						</tr>
						<tr>
							<th>비고</th>
							<td><input type="text"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
	<div id="grid"></div>
		<script type="text/javascript">
			var gridData;

			$.ajax({
				type : "get",
				url : "ajax/repList.do",
				dataType : "json",
				async : false,
				success : function(data) {
					gridData = data;
				},
				error : function() {
				}
			});

			const grid = new tui.Grid({
				el : document.getElementById('grid'),
				data : gridData,
				scrollX : false,
				scrollY : false,
				columns : [ {
					header : '수리코드',
					name : 'repairCode'
				}, {
					header : '설비코드',
					name : 'facCode'
				}, {
					header : '수리일자',
					name : 'repairDate'
				}, {
					header : '수리내역',
					name : 'repairComment'
				}, {
					header : '업체코드',
					name : 'companyCode'
				}, {
					header : '수리금액',
					name : 'cost'
				}, {
					header : '비고',
					name : 'etc'
				} ]
			});
		</script>