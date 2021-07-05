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
		<script type="text/javascript">
			const dataSource = {
				api : {
					readData : {
						url : 'ajax/errorList.do',
						method : 'get'
					}

				},
				contentType : 'application/json'
			};
			const grid = new tui.Grid({
				el : document.getElementById('errorGrid'),
				data : dataSource,
				scrollX : false,
				scrollY : false,
				columns : [ {
					header : '불량코드',
					name : 'errorCode'

				}, {
					header : '불량명',
					name : 'errorName',
					editor : 'text'
				}, {
					header : '비고',
					name : 'errorComment',
					editor : 'text'
				}

				]
			});
		</script>
		<div id="errorGrid" style="z-index: 10" class="col-8">
			<h3>실제 작업시 불량품 내역들어올곳</h3>
		</div>
		<script type="text/javascript">
			const dataSource = {
				api : {
					readData : {
						url : 'ajax/errorList.do',
						method : 'get'
					}

				},
				contentType : 'application/json'
			};
			const grid = new tui.Grid({
				el : document.getElementById('errorGrid'),
				data : dataSource,
				scrollX : false,
				scrollY : false,
				columns : [ {
					header : '불량코드',
					name : 'errorCode'

				}, {
					header : '불량명',
					name : 'errorName',
					editor : 'text'
				}, {
					header : '비고',
					name : 'errorComment',
					editor : 'text'
				}

				]
			});
		</script>
	</div>
</body>
</html>