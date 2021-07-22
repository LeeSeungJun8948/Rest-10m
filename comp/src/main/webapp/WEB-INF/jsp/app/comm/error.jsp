<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
	<h3>불량코드관리</h3>
	<form id="errorListSearchForm" name="errorListSearchForm">
			<div class="row">
				<table>
					<tr>
						<td>
							<select name="searchCondition" id="searchCondition"
								title="검색조건3-검색어구분" style="width:100px; height:26px; margin-bottom: 2px; margin-left: 10px ">
								<option value="errorCode">불량코드</option>
								<option value="errorName">불량명</option>
							</select>
						</td>
					</tr>
				</table>
				<input id="searchKeyword" name="searchKeyword" type="text" title="검색어" class="form-control"
					style="width: 200px; margin-left: 10px; float:left" >
				<button type="button" class="btn-two blue small" id="btnCheck">조회</button>
				</div>
			</form>
		<div align="right"  style="margin-top: 28px">
			<button type="button" class="btn-two blue small" id="btnRowInsert">행추가</button>
			<button type="button" class="btn-two blue small" id="btnInsert">저장</button>
			<button type="button" class="btn-two blue small" id="btnDelete">삭제</button>
		</div>
			
	<div id="errorGrid"></div>	
		<script type="text/javascript">
			const dataSource = {
				api : {
					readData : {url : contextPath 	+ '/ajax/errorList.do', method : 'get'},
					deleteData : { url: contextPath	+ '/ajax/deleteError.do', method: 'POST' },
					modifyData : { url: contextPath	+ '/ajax/modifyError.do', method: 'PUT'}

				},
				contentType : 'application/json'
			};
			const grid = new tui.Grid({
				el : document.getElementById('errorGrid'),
				data : dataSource,
				rowHeaders: ['checkbox'],
				scrollX : false,
				scrollY : false,
				columns : [ 
					{
						header : '불량코드',
						name : 'errorCode'

					}, 
					{
						header : '불량명',
						name : 'errorName',
						editor : 'text'
					}, 
					{
						header : '비고',
						name : 'errorComment',
						editor : 'text'
					}

					]
				});
			
		</script>
</body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/comm/error.js"></script>
</html>
