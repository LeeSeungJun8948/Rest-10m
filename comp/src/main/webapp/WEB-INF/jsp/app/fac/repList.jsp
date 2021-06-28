<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<div>
		<h2>설비 수리내역 관리</h2>
	</div>
	<div class="grid-option-area mr-1">
		<button type="button" class="btn btn-search" id="searchBtn">조회</button>
		<button type="button" class="btn btn-save" id="addBtn">저장</button>
		<button type="button" class="btn btn-remove" id="removeBtn">삭제</button>
	</div>
	<form autocomplete="off" id="dataForm" name="dataForm" method="post"
		onSubmit="return false;">
		<div class="view-modify-board">
			<table class="table table-bbs table-write" summary="">
				<tbody>
					<tr>
						<th>수리일자</th>
						<td colspan="8"><input id="repairNum" name="repairNum"
							type="hidden">
							<div
								class="tui-datepicker-input tui-datetime-input tui-has-focus"
								style="width: 140px;">
								<input type="text" id="repairDate" name="repairDate"
									aria-label="Date-Time" data-origin=""> <span
									class="tui-ico-date"></span>
							</div>
					</tr>
					<tr>
						<th>비고</th>
						<td colspan="4"><input id="mRemark" name="mRemark"
							type="text" title="특기사항" class="form-control"
							style="width: 570px;"></td>
					</tr>
					<tr>
						<th>수리코드</th>
						<td><input></td>
					</tr>
					<tr>
						<th>수리내역</th>
						<td><input></td>
					</tr>
					<tr>
						<th>설비코드</th>
						<td><input></td>
					</tr>
					<tr>
						<th>업체코드</th>
						<td><input></td>
					</tr>
					<tr>
						<th>수리금액</th>
						<td><input></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
	<div id="grid">
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
	</div>
</body>
</html>