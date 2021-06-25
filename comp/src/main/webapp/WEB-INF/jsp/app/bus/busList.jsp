<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
</head>
<body>
<h1>주문관리참조 조회</h1>
<form>
<fieldset>

		<p>자료구분
		<input type="radio" name=orderDate value=inDate>접수일자 
		<input type="radio" name=orderDate value=outDate>납기일자
		</p>
		<br/>
		
		<p>진행구분
		<input type="radio" name=orderState value=unPlan>미계획
		<input type="radio" name=orderState value=plan>계획
		<input type="radio" name=orderState value=planComplete>계획완료 
		<input type="radio" name=orderState value=productComplete>생산완료
		</p>
		
		</fieldset>
	</form>

	<div id="grid"></div>
	<script type="text/javascript">
		var gridData;

		$.ajax({
			type : "get",
			url : "ajax/busList.do",
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
				header : '주문번호',
				name : 'orderNo'
			}, {
				header : '제품코드',
				name : 'productCode'
			}, {
				header : '진행구분',
				name : 'orderState'
			}, {
				header : '접수일자',
				name : 'inDate'
			}, {
				header : '납기일자',
				name : 'outDate'
			},{
				header : '주문량',
				name : 'orderCount'
			},{
				header : '계획량',
				name : 'orderPlanCount'
			} ]
		});
	</script>
</body>
</html>