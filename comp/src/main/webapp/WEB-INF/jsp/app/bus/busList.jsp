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
		<form>
			<div class="form-row">
			자료구분&nbsp;&nbsp;&nbsp;
				<div class="col-md-2 mb-4">
					<div class="form-group border">

						<input type="radio" id="inDate" name="orderDate" value="inDate"
							checked> <label for="inDate">접수일자</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" id="outDate" name="orderDate" value="outDate"
							checked> <label for="outDate">납기일자</label>

					</div>
				</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				진행구분&nbsp;&nbsp;&nbsp;
				<div class="col-md-4 mb-4">
					
					<div class="form-group border">
						<input type="radio" id="upPlan" name="orderState" value="unPlan"
							checked> <label for="unPlan">미계획</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" id="proPlan" name="orderState" value="proPlan"
							checked> <label for="proPlan">생산계획</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" id="planComplete" name="orderState"
							value="planComplete" checked> <label for="planComplete">계획완료</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" id="proComplete" name="orderState"
							value="proComplete" checked> <label for="proComplete">생산완료</label>
					</div>
					
				</div>
			</div>
		</form>
	</div>


	<li>
		<div class="col-8 ta-l ml-1">
			<label class="headtxt">해당일자</label>
			<div class="tui-datepicker-input tui-datetime-input tui-has-focus"
				style="width: 120px;">
				<input id="searchDate1" name="searchDate1" type="text"
					aria-label="Date-Time"> <span class="tui-ico-date"></span>
				<div id="searchDate1-wrapper" style="margin-left: -1px;"></div>
				<input type="hidden" id="year" name="year">
			</div>
			<label class="ml-1 mr-1">~</label>
			<div class="tui-datepicker-input tui-datetime-input tui-has-focus"
				style="width: 120px;">
				<input id="searchDate2" name="searchDate2" type="text"
					aria-label="Date-Time"> <span class="tui-ico-date"></span>
				<div id="searchDate2-wrapper" style="margin-left: -1px;"></div>
			</div>

		</div>
	</li>



	<li>
		<div class="col-9 ta-l ml-1">
			<label class="headtxt">고객사</label> <input
				class="form-control ta-l w150" type="text" id="searchKeywordFrom"
				name="searchKeywordFrom" maxlength="20" />
			<button type="button" id="entrpsPopBtn1"
				class="btn-top btn-find-small">찾아보기</button>
			<input class="form-control w200" type="text" id="searchKeywordFromNm"
				name="searchKeywordFromNm" maxlength="20" readonly="true" /> <label
				class="ml-1 mr-1">~</label> <input class="form-control ta-l w150"
				type="text" id="searchKeywordTo" name="searchKeywordTo"
				maxlength="20" />
			<button type="button" id="entrpsPopBtn2"
				class="btn-top btn-find-small">찾아보기</button>
			<input class="form-control w200" type="text" id="searchKeywordToNm"
				name="searchKeywordToNm" maxlength="20" readonly="true" />
		</div>
	</li>
	<li>
		<div class="col-9 ta-l ml-1">
			<label class="headtxt">제품코드</label> <input
				class="form-control ta-l w150" type="text" id="prductCd"
				name="prductCd" maxlength="20" />
			<button type="button" id="prductPopBtn"
				class="btn-top btn-find-small">찾아보기</button>
			<input class="form-control ta-l w200" type="text" id="prductNm"
				name="prductNm" maxlength="20" readonly="true" />
		</div>
	</li>
	</ul>
	<div class="grid-option-area">
		<div class="col-6"></div>
		<div class="col-6 ta-r mr-1">
			<button type="button" class="btn btn-reset" id="resetBtn">새자료</button>
			<button type="button" class="btn btn-search" id="searchBtn">조회</button>
			<button type="button" class="btn btn-exel" id="excelBtn">Excel</button>
			<button type="button" class="btn btn-print" id="printBtn">인쇄</button>
		</div>
	</div>
	</div>
	</form>
	</div>


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
			}, {
				header : '주문량',
				name : 'orderCount'
			}, {
				header : '계획량',
				name : 'orderPlanCount'
			} ]
		});
	</script>
</body>
</html>