<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<h2>주문관리참조 조회</h2>
<div class="search-area">
	<form id="dataForm">
		<div class="form-row">

			<label class=orderState>진행구분</label>
			<div class="col-md-5 mb-4">

				<div class="form-group border">
					<input type="radio" id="upPlan" name="orderState" value="unPlan" checked>
					<span style="margin: 3px 30px;">미계획</span>
					<input type="radio" id="working" name="orderState" value="working"> 
					<span style="margin: 3px 30px;">진행중</span> 
					<input type="radio" id="planComplete" name="orderState"	value="planComplete" >
					<span style="margin: 3px 30px;">계획완료</span> 
				</div>
				
			</div>
		</div>

		<div>
			<label for="inDate">접수일자</label> 
			<input type="date" name="fromDate" id="fromDate" value=${orders.inDate }> ~
			<input type="date" name="toDate" id="toDate" value=${inDate }>
		</div>


		<div class="col-9 ta-l ml-1">
			<label class="headtxt">고객사</label> 
			<input type="text" id="companyCode" name="companyCode" />
			<button id="btnCompModal" type="button" class="btn btn-toggle" data-remote="false" data-toggle="modal" data-target="#compModal">
				<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
			</button>
			<input type="text" id="companyName" name="companyName" />
			
		</div>

		<div class="col-9 ta-l ml-1">
			<label class="headtxt">제품코드</label> 
			<input type="text" id="prductCd" name="prductCd" />
				
			<input type="text" id="prductNm" name="prductNm" maxlength="20"	readonly="true" />
		</div>


		<div class="grid-option-area">

			<div class="col-6 ta-r mr-1">
				<button name="resetBtn" type="button" class="btn btn-primary" id="resetBtn">새자료</button>
				<button name="searchBtn" type="button" class="btn btn-primary" id="searchBtn">조회</button>
				<button name="excelBtn" type="button" class="btn btn-primary" id="excelBtn">Excel</button>
				<button name="printBtn" type="button" class="btn btn-primary" id="printBtn">인쇄</button>
			</div>
		</div>
	</form>
</div>

<div id="grid"></div>

<div class="modal fade" id="compModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="compContent" align="center">
		</div>
	</div>
</div>

<script type="text/javascript" src="js/app/bus/busList.js"></script>