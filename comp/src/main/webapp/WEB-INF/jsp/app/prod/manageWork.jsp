<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="h3 mb-4 text-gray-700">작업실적 관리</h1>
<form id="workFrm" name="workFrm">
	<div class="mb-4" align="right">
		<button type="button" class="btn btn-primary" id="btnSave">저장</button>
		<input type="reset" class="btn btn-primary" id="btnReset" value="초기화">
	</div>
	<div>
		<table class="table">
			<tbody>
				<tr>
					<th>작업일자</th>
					<td><input type="date" id="workDate" name="workDate"></td>
					<th>작업구분</th>
					<td>
						<select class="custom-select" name="workDiv">
							<option value="1" selected>배합공정</option>
							<option value="4">검사공정</option>
							<option value="5">포장공정</option>
						</select>
					</td>
					<th>작업자</th>
					<td><input type="text" id="empName" name="empName" readonly>
						<input type="hidden" id="empCode" name="empCode">
						<button id="btnEmpModal" type="button" class="btn btn-toggle" data-remote="false" data-toggle="modal" data-target="#workEmpModal">
							<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
						</button>
					</td>
				</tr>
				<tr>
					<th>주문번호</th>
					<td><input type="text" id="orderNo" name="orderNo" readonly></td>
					<th>제품명</th>
					<td><input type="text" id="productName" name="productName" readonly>
						<input type="hidden" id="productCode" name="productCode">
					</td>
					<th>제품LOT</th>
					<td><input type="text" id="productLot" name="productLot" onchange="findLot(this.value)"></td>
				</tr>
				<tr>
					<th>작업량</th>
					<td><input type="text" id="workCount" name="workCount"></td>
					<th>불량량</th>
					<td><input type="text" id="errorCount" name="errorCount"></td>
					<th>불량명</th>
					<td><input type="text" id="errorName" name="errorName" readonly>
						<input type="hidden" id="errorCode" name="errorCode">
						<button id="btnErrorModal" type="button" class="btn btn-toggle" data-remote="false" data-toggle="modal" data-target="#workErrorModal">
							<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
						</button>
					</td>
				</tr>
				<tr>
					<th>작업시작</th>
					<td><input type="text" id="startTime" name="startTime"></td>
					<th>작업종료</th>
					<td><input type="text" id="endTime" name="endTime"></td>
				</tr>
			</tbody>
		</table>
	</div>
</form>

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

<script type="text/javascript" src="js/app/prod/manageWork.js"></script>