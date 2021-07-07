<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>불량내역관리</h1>
	<div class="flex row" style="margin-top: 40px">
		<div class="col-4"  style="margin-top: 28px">
			<button type="button" class="btn btn-primary" id="btnRowInsert">+</button>
			<button type="button" class="btn btn-primary" id="btnInsert">저장</button>
			<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
		</div>
		<div class="col-4">
			<form id="errorListSearchForm" name="errorListSearchForm">
				<table>
					<tr>
						<td>
							<select name="searchCondition" id="searchCondition"
								title="검색조건3-검색어구분" style="width:100px; height:26px; margin-bottom: 2px; margin-left: 10px ">
								<option value="errorCode">불량코드</option>
								<option value="errorDate">일별</option>
								<option value="lotNo">Lot.No</option>
							</select>
						</td>
					</tr>
				</table>
				<input id="searchKeyword" name="searchKeyword" type="text" title="검색어" class="form-control"
					style="width: 200px; margin-left: 10px; float:left" >
				<button type="button" class="btn btn-primary" id="btnCheck">조회</button>
			</form>
		</div>
		<div class="col-4" style="margin-top: 28px" align="right">
			<button type="button" class="btn btn-primary" onclick="location.href='errorList.do' ">초기화</button>
			<button type="button" class="btn btn-primary" id="errorRowInsert">+</button>
			<button type="button" class="btn btn-primary" id="btnInsertErrorList">저장</button>
			<button type="button" class="btn btn-primary" id="btnDelteErrorList">삭제</button>
		</div>
	</div>
	<div class="flex row" style="margin-top: 10px">
		<div id="errorGrid" style="z-index: 10" class="col-4"></div>
		<div id="errorListGrid" style="z-index: 10" class="col-8"></div>
	
		<script type="text/javascript">
			const dataSource = {
				api : {
					readData : {url : 'ajax/errorList.do', method : 'get'},
					createData : { url: 'ajax/insertError.do', method: 'POST'},
					deleteData : { url: 'ajax/deleteError.do', method: 'POST' },
					modifyData : { url: 'ajax/modifyError.do', method: 'PUT'}

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
			
			const dataSource2 = {
				api : {
					readData : {url : 'ajax/errorAllList.do', method : 'GET'},
					deleteData : { url: 'ajax/deleteErrorList.do', method: 'POST' },
					modifyData : { url: 'ajax/modifyErrorList.do', method: 'PUT'}
				},
				contentType : 'application/json'
			};
			
			const girdList = new tui.Grid({
				el : document.getElementById('errorListGrid'),
				data : dataSource2,
				rowHeaders: ['checkbox'],
				scrollX : false,
				scrollY : false,
				columns : [ 
					{
						header : '순번',
						name : 'errorlistCode'

					}, 
					{
						header : '불량코드',
						name : 'errorCode',
						editor : 'text'
					}, 
					
					{
						header : '날짜',
						name : 'errorDate',
						editor : 'text',
						editor: {
							type: 'datePicker',
							options: {
							language: 'ko',
							format: 'YYYY-MM-dd'
							}
						}
					},
					
					{
						header : '작업지시번호',
						name : 'instructionNo',
						editor : 'text'
					},
					{
						header : '제품 Lot.No',
						name : 'lotNo',
						editor : 'text'
					},
					{
						header : '비고',
						name : 'errorlistComment',
						editor : 'text'
					}
				]
			});
			
			//불량내역 리스트 검색
			$("#btnCheck").on("click", function() {
				var param = $('#errorListSearchForm').serializeObject();
				girdList.readData(1, param, true);
			})
			//불량내역 행추가
			$("#errorRowInsert").on("click", function(){
				progrid.appendRow();
			});
			//불량내역 추가
			$("#btnInsertErrorList").on("click", function(){
				//girdList.request('createData');
				girdList.request('modifyData', {
				checkedOnly: true
				});
			})
			$("#btnDelteErrorList").on("click",function() {
				girdList.removeCheckedRows(false);
				girdList.request('deleteData');
})
		</script>
	</div>
</body>
	<script type="text/javascript" src="js/app/comm/process.js"></script>
</html>
