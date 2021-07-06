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
		<div id="errorGrid" style="z-index: 10" class="col-4"></div>
		<div id="errorListGrid" style="z-index: 10" class="col-8"></div>
	
		<script type="text/javascript">
			const dataSource = {
				api : {
					readData : {url : 'ajax/errorList.do', method : 'get'}

				},
				contentType : 'application/json'
			};
			const grid = new tui.Grid({
				el : document.getElementById('errorGrid'),
				data : dataSource,
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
					readData : {url : 'ajax/errorAllList.do', method : 'get'}
				},
				contentType : 'application/json'
			};
			
			const girdList = new tui.Grid({
				el : document.getElementById('errorListGrid'),
				data : dataSource2,
				scrollX : false,
				scrollY : false,
				columns : [ 
					{
						header : '순번',
						name : 'errorListCode'

					}, 
					{
						header : '불량코드',
						name : 'errorCode',
						editor : 'text'
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
						name : 'errorListCommnet',
						editor : 'text'
					}
				]
			});
		</script>
	</div>
</body>
</html>
