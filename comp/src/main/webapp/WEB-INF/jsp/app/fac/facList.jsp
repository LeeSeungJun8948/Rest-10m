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
	<h2>설비조회</h2>
	</div>
	<div id="grid">
	<script type="text/javascript">
		var gridData;

		$.ajax({
			type : "get",
			url : "ajax/facList.do",
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
				header : '설비코드',
				name : 'facCode'
			}, {
				header : '설비명',
				name : 'facilitiesName'
			}, {
				header : '모델',
				name : 'model'
			}, {
				header : '규격',
				name : 'facSize'
			}, {
				header : '제작업체',
				name : 'productionCompany'
			}, {
				header : '용도',
				name : 'purpose'
			}, {
				header : '용량/규격',
				name : 'volume'
			}, {
				header : '제작일자',
				name : 'productionDate'
			}, {
				header : '사원번호',
				name : 'empNo'
			}, {
				header : '구매금액',
				name : 'price'
			}, {
				header : '정기점검주기',
				name : 'facInspection'
			}, {
				header : '구매일자',
				name : 'purchaseDate'
			}, {
				header : '이미지',
				name : 'img'
			}, {
				header : '공정코드',
				name : 'processCode'
			}
			]
		});
	</script>
</div>
</body>
</html>