<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="modalContent">
	<div class="modal-header mb-4">
		<div>
			<h5 class="modal-title">
				<strong>작업 조회</strong>
			</h5>
		</div>
		<div align="right">
			<button id="btnClose" class="btn btn-primary" data-dismiss="modal">닫기</button>
		</div>
	</div>
	<div class="modal-body mb-4">
		<div class="mb-4">
			<form id="workFrm" name="workFrm">
				<table class="table">
					<tbody>
						<tr>
							<td>작업일자</td>
							<td><input type="date" id="workDate" name="workDate"></td>
							<td>공정명</td>
							<td><input type="text" id="processName" name="processName"></td>
							<td>사원코드</td>
							<td><input type="text" id="empCode" name="empCode"></td>
						</tr>
						<tr>
							<td>작업번호</td>
							<td><input type="text" id="workNo" name="workNo"></td>
							<td>제품코드</td>
							<td><input type="text" id="productCode" name="productCode"></td>
							<td>제품LOT</td>
							<td><input type="text" id="productLot" name="productLot"></td>
						</tr>
						<tr>
							<td>작업량</td>
							<td><input type="text" id="workCount" name="workCount"></td>
							<td>불량코드</td>
							<td><input type="text" id="errorCode" name="errorCode"></td>
							<td>불량량</td>
							<td><input type="text" id="errorCount" name="errorCount"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col-lg-2">
					<strong>작업시작:</strong> 
				</div>
				<div class="col-lg-4">
					<input type="text" id="startTime" name="startTime">
				</div>
				<div class="col-lg-2">
					<strong>작업종료:</strong> 
				</div>
				<div class="col-lg-4">
					<input type="text" id="endTime" name="endTime">
				</div>
			</form>
		</div>
	</div>
	<div class="modal-footer">
	</div>
</div>

<script type="text/javascript" src="js/app/prod/workModal.js"></script>