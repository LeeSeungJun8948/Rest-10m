<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="h3 mb-4 text-gray-700">작업실적 조회</h1>
<form id="searchFrm" name="searchFrm">
	<div class="mb-4" align="right">
		<button type="button" class="btn btn-primary" id="btnSearch">조회</button>
		<button type="reset" class="btn btn-primary" id="btnReset">초기화</button>
	</div>
	<div class="row">	
		<div class="mb-2 col-lg-12">
			<table class="table">
				<tbody>
					<tr>
						<th>작업일자</th>
						<td>
							<div class="row">
								<div class="col-3">
									<input type="date" class="form-control" id="workDtS" name="workDtS">
								</div>
								<div class="col-1" align="right">
									<span>~</span>
								</div>
								<div class="col-3">
									<input type="date" class="form-control" id="workDtE" name="workDtE">
								</div>
							</div>
						</td>
						<th>작업구분</th>
						<td> 
							<span class="mr-4">전체 <input type="radio" name="workDiv" value="" checked></span>
							<span class="mr-4">배합공정 <input type="radio" name="workDiv" value="배합공정"></span>
							<span class="mr-4">검사공정 <input type="radio" name="workDiv" value="검수공정"></span>
							<span class="mr-4">포장공정 <input type="radio" name="workDiv" value="포장공정"></span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</form>
<div class="col-lg-12">
	<div id="workGrid"/>
</div>

<div class="modal fade" id="workViewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document" style="min-width: 90%; display: table;">
		<div class="modal-content" id="workViewContent" align="center">
			<div class="modal-header">
				<h5 class="modal-title">작업실적 조회</h5>
				<button id="btnCloseTop" type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<table class="table">
					<tbody>
						<tr>
							<th>제품LOT</th>
							<td><input type="text" class="form-control" id="productLot" name="productLot" readonly></td>
						</tr>
						<tr>
							<th>작업일자</th>
							<td><input type="date" class="form-control" id="workDate" name="workDate" readonly></td>
							<th>작업구분</th>
							<td>
								<select class="custom-select" name="workDiv" id="workDiv" readonly>
									<option value="1" selected>배합공정</option>
									<option value="4">검사공정</option>
									<option value="5">포장공정</option>
								</select>
							</td>
							<th>작업자</th>
							<td><input type="text" class="form-control" id="empName" name="empName" readonly></td>
						</tr>
						<tr>
							<th>지시번호</th>
							<td><input type="text" class="form-control" id="workCode" name="workCode" readonly></td>
							<th>제품명</th>
							<td><input type="text" class="form-control" id="productName" name="productName" readonly>
							</td>
							<th>설비명</th>
							<td><input type="text" class="form-control" id="facilitiesName" name="facilitiesName" readonly></td>
						</tr>
						<tr>
							<th>작업량</th>
							<td><input type="text" class="form-control" id="workCount" name="workCount" value="0" readonly></td>
							<th>불량량</th>
							<td><input type="text" class="form-control" id="errorCount" name="errorCount" value="0" readonly></td>
							<th>불량명</th>
							<td><input type="text" class="form-control" id="errorName" name="errorName" readonly></td>
						</tr>
						<tr>
							<th>작업시작</th>
							<td><input type="text" class="form-control" id="startTime" name="startTime" readonly></td>
							<th>작업종료</th>
							<td><input type="text" class="form-control" id="endTime" name="endTime" readonly></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button id="btnCloseBottom" class="btn btn-primary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<link href="${pageContext.request.contextPath}/css/app/prod/viewWork.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/prod/viewWork.js"></script>