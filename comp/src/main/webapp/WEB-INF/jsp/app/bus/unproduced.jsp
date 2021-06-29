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
	<h2>미생산의뢰조회</h2>
	<div class="search-area">
	<form id="dataForm">

		<div>
			<label for="fromDate">납기일자</label> <input type="date" name="fromDate"
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
			data : dataSource,
			scrollX : false,
			scrollY : false,
			columns : [ {
				header : '고객사명',
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
				header : '출고량',
				name : 'kg'
			},{
				header : '미납품량',
				name : 'dCount'
			}, {
				header : '비   고',
				name : 'remark'
			} ]
		});

		const dataSource = {
				api : {
					readData : {url: 'ajax/busList.do', method:'GET' },
				},
				contentType: 'application/json'
		};
		
		
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