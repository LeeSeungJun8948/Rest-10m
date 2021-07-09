<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="h3 mb-4 text-gray-700">작업실적 관리</h1>
<div class="mb-4" align="right">
	<button type="button" class="btn btn-primary" id="btnSave">저장</button>
</div>
<div>
	<form id="workFrm" name="workFrm" action="saveWork.do" method="post">
		<input type="hidden" id="workNo" name="workNo">
		<table class="table">
			<tbody>
				<tr>
					<th>작업일자</th>
					<td><input type="date" id="workDate" name="workDate" readonly></td>
					<th>작업구분</th>
					<td><input type="text" id="workDiv" name="workDiv" readonly></td>
					<th>작업자</th>
					<td><input type="text" id="empName" name="empName" readonly>
						<input type="hidden" id="empCode" name="empCode">
						<button id="btnEmpModal" type="button" class="btn btn-toggle" data-remote="false" data-toggle="modal" data-target="#workEmpModal">
							<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
						</button>
					</td>
				</tr>
				<tr>
					<th>작업번호</th>
					<td><input type="text" id="workNo" name="workNo" readonly></td>
					<th>제품코드</th>
					<td><input type="text" id="productCode" name="productCode" readonly></td>
					<th>제품LOT</th>
					<td><input type="text" id="productLot" name="productLot"></td>
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
	</form>
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

<script type="text/javascript" src="js/app/prod/manageWork.js"></script>