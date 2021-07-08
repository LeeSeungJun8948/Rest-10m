<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="modalContent">
	<div class="modal-header mb-4">
		<div>
			<h5 class="modal-title">
				<strong>작업 등록</strong>
			</h5>
		</div>
		<div align="right">
			<button type="reset" class="btn btn-primary" id="btnReset">초기화</button>
			<button type="button" class="btn btn-primary" id="btnSave">저장</button>
			<button id="btnCloseBottom" class="btn btn-primary" data-dismiss="modal">닫기</button>
		</div>
	</div>
	<div class="modal-body mb-4">
		<form id="workFrm" name="workFrm">
			<div class="mb-4">
				<table class="table">
					<tbody>
						<tr>
							<td>작업일자</td>
							<td><input type="date" id="workDate" name="workDate"></td>
							<td>공정명</td>
							<td><input type="text" id="processName" name="processName"></td>
							<td>작업자</td>
							<td>
								<input type="text" id="empName" name="empName" readonly>
								<button id="btnEmpSearch" type="button" class="btn btn-toggle" data-remote="false" data-toggle="modal" data-target="#workEmpModal">
										<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
								</button>
								<input type="hidden" id="empCode" name="empCode">
							</td>
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
			</div>
		</form>
	</div>
	<div class="modal-footer">
	</div>
</div>

<div class="modal fade" id="workEmpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal" role="document">
		<div class="modal-content" id="workEmpContent" align="center"/>
	</div>
</div>

<link href="${pageContext.request.contextPath}/css/app/prod/workModal.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/app/prod/workModal.js"></script>