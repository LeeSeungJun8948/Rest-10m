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
	<h2>주문관리참조 조회</h2>
	<div class="search-area">
	<form id="dataForm">
		<div class="form-row">
			<label class="orderDate">자료구분</label>
			<div class="col-md-3 mb-4">
				<div class="form-group border">

					<input type="radio" id="inDate" name="orderDate" value="inDate"
						checked><span style="margin: 3px 30px;">접수일자</span> <input
						type="radio" id="outDate" name="orderDate" value="outDate" checked>
					<span style="margin: 3px 40px;">납기일자</span>

				</div>
			</div>
			<label class=orderState>진행구분</label>
			<div class="col-md-5 mb-4">

				<div class="form-group border">
					<input type="radio" id="upPlan" name="orderState" value="unPlan"
						checked><span style="margin: 3px 30px;">미계획</span> <input
						type="radio" id="proPlan" name="orderState" value="proPlan"
						checked> <span style="margin: 3px 30px;">생산계획</span> <input
						type="radio" id="planComplete" name="orderState"
						value="planComplete" checked> <span
						style="margin: 3px 30px;">계획완료</span> <input type="radio"
						id="proComplete" name="orderState" value="proComplete" checked>
					<span style="margin: 3px 30px;">생산완료</span>
				</div>

			</div>
		</div>

		<div>
			<label for="fromDate">해당일자</label> <input type="date" name="fromDate"
				id="fromDate"> <label for="toDate">~</label> <input
				type="date" name="toDate" id="toDate">
		</div>


		<div class="col-9 ta-l ml-1">
			<label class="headtxt">고객사</label> <input type="text"
				id="searchKeywordFrom" name="searchKeywordFrom" />
			<button
				onclick="window.open('address','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');"
				class="btn btn-primary">
				<img src="<c:url value='/images/egovframework/com/cmm/btn/btn_search.gif'/>">
			</button>
			<input type="text" id="searchKeywordFromNm"
				name="searchKeywordFromNm" readonly="true" /> <label
				class="ml-1 mr-1">~</label> <input type="text" id="searchKeywordTo"
				name="searchKeywordTo" /> <button
				onclick="window.open('address','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');"
				class="btn btn-primary">
				<img src="<c:url value='/images/egovframework/com/cmm/btn/btn_search.gif'/>">
			</button> <input
				type="text" id="searchKeywordToNm" name="searchKeywordToNm"
				readonly="true" />
		</div>

		<div class="col-9 ta-l ml-1">
			<label class="headtxt">제품코드</label> <input type="text" id="prductCd"
				name="prductCd" /> <button
				onclick="window.open('address','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');"
				class="btn btn-primary">
				<img src="<c:url value='/images/egovframework/com/cmm/btn/btn_search.gif'/>">
			</button> <input
				type="text" id="prductNm" name="prductNm" maxlength="20"
				readonly="true" />
		</div>


		<div class="grid-option-area">

			<div class="col-6 ta-r mr-1">
				<button name="resetBtn" type="reset" class="btn btn-primary"
					id="resetBtn">새자료</button>
				<button name="searchBtn" type="submit" class="btn btn-primary"
					id="searchBtn" onclick="getData()">조회</button>
				<button name="excelBtn" type="button" class="btn btn-primary"
					id="excelBtn">Excel</button>
				<button name="printBtn" type="button" class="btn btn-primary"
					id="printBtn">인쇄</button>
			</div>
		</div>
		</form>
	</div>

	<div id="grid"></div>
	<script type="text/javascript">
		var gridData;

		const grid = new tui.Grid({
			el : document.getElementById('grid'),
			data : gridData,
			scrollX : false,
			scrollY : false,
			columns : [ {
				header : '진행구분',
				name : 'orderState'
			}, {
				header : '업체명',
				name : 'companyName'
			}, {
				header : '주문번호',
				name : 'orderNo'
			}, {
				header : '제품코드',
				name : 'productCode'
			}, {
				header : '제품명',
				name : 'productName'
			}, {
				header : '규격',
				name : 'unitId'
			}, {
				header : '단위',
				name : 'stdId'
			}, {
				header : '접수일자',
				name : 'inDate'
			}, {
				header : '납기일자',
				name : 'outDate'
			}, {
				header : '주문량',
				name : 'orderCount'
			}, {
				header : '지시량',
				name : 'oprojectCount'
			}, {
				header : '미납품량',
				name : 'dCount'
			}, {
				header : '비   고',
				name : 'remark'
			} ]
		});

		function data() {
			$.ajax({
				type : "get",
				url : "ajax/busList.do",
				dataType : "json",
				async : false,
				success : function(data) {
					getData(data);
				},
				error : function() {
				}
			});
		}
		
		$(document).ready(function(){
		    //resetBtn 을 클릭했을때의 함수
		    $( "#resetBtn").click(function () {
		        $( "#dataForm" ).each( function () {
		            this.reset();
		        });
		    });
		});

	</script>
</body>
</html>