<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="h3 mb-4 text-gray-700">작업실적 관리</h1>
<form id="workFrm" name="workFrm">
	<input type="hidden" id="workCode" name="workCode">
	<div class="mb-4" align="right">
		<button id="btnWorkModal" type="button" class="btn btn-primary" data-remote="false" data-toggle="modal" data-target="#workModal">조회</button>
		<button type="button" class="btn btn-primary" id="btnSave">저장</button>
		<input type="reset" class="btn btn-primary" id="btnReset" value="초기화">
		<button type="button" class="btn btn-primary" id="btnDel">삭제</button>
	</div>
	<div>
		<table class="table">
			<tbody>
				<tr>
					<th>제품LOT</th>
					<td><input type="text" class="form-control" id="productLot" name="productLot" onchange="findLot(this.value)"></td>
				</tr>
				<tr>
					<th>작업일자</th>
					<td><input type="date" class="form-control" id="workDate" name="workDate"></td>
					<th>작업구분</th>
					<td>
						<select class="custom-select" name="workDiv" id="workDiv">
							<option value="1" selected>배합공정</option>
							<option value="4">검사공정</option>
							<option value="5">포장공정</option>
						</select>
					</td>
					<th>작업자</th>
					<td>
						<div class="row">
							<div class="col-6">
								<input type="text" class="form-control" id="empName" name="empName" readonly>
							</div>
							<input type="hidden" id="empCode" name="empCode">
							<button id="btnEmpModal" type="button" class="btn btn-toggle" data-remote="false" data-toggle="modal" data-target="#workEmpModal">
								<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
							</button>
						</div>
					</td>
				</tr>
				<tr>
					<th>지시번호</th>
					<td><input type="text" class="form-control" id="prorCode" name="prorCode" readonly></td>
					<th>제품명</th>
					<td><input type="text" class="form-control" id="productName" name="productName" readonly>
						<input type="hidden" id="productCode" name="productCode">
					</td>
					<th>설비명</th>
					<td>
						<div class="row">
							<div class="col-6">
						<input type="text" class="form-control" id="facilitiesName" name="facilitiesName" readonly>
						</div>
						<input type="hidden" id="facCode" name="facCode" value="0">
						<button id="btnFacModal" type="button" class="btn btn-toggle" data-remote="false" data-toggle="modal" data-target="#workFacModal">
								<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
						</button>
					</td>
				</tr>
				<tr>
					<th>작업량</th>
					<td><input type="text" class="form-control" id="workCount" name="workCount" value="0"></td>
					<th>불량량</th>
					<td><input type="text" class="form-control" id="errorCount" name="errorCount" value="0"></td>
					<th>불량명</th>
					<td>
						<div class="row">
							<div class="col-6">
								<input type="text" class="form-control" id="errorName" name="errorName" readonly>
							</div>
							<input type="hidden" id="errorCode" name="errorCode" value="0">
							<button id="btnErrorModal" type="button" class="btn btn-toggle" data-remote="false" data-toggle="modal" data-target="#workErrorModal">
								<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
							</button>
						</div>
					</td>
				</tr>
				<tr>
					<th>작업시작</th>
					<td><input type="text" class="form-control" id="startTime" name="startTime"></td>
					<th>작업종료</th>
					<td><input type="text" class="form-control" id="endTime" name="endTime"></td>
				</tr>
			</tbody>
		</table>
	</div>
</form>
<div class="modal fade" id="workModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content" id="workContent" align="center">
		</div>
	</div>
</div>
<div class="modal fade" id="workEmpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="workEmpContent" align="center">
		</div>
	</div>
</div>
<div class="modal fade" id="workErrorModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="workErrorContent" align="center">
		</div>
	</div>
</div>
<div class="modal fade" id="workFacModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="workFacContent" align="center">
		</div>
	</div>
</div>

<link href="${pageContext.request.contextPath}/css/app/prod/manageWork.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/prod/manageWork.js"></script>