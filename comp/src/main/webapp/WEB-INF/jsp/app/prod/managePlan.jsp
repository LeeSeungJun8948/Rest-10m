<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>

<h1 class="h3 mb-4 text-gray-700">생산계획 관리</h1>
<div class="mb-4" align="right">
	<a class="btn btn-primary" id="btnModal" href="planModal.do" rel="modal:open">조회</a>
	<button type="reset" class="btn btn-primary" id="btnReset">초기화</button>
	<button type="button" class="btn btn-primary" id="btnSave">저장</button>
	<button type="button" class="btn btn-primary" id="btnDel">삭제</button>
</div>
<div class="row">
	<div class="mb-2 col-lg-6">
		<form id="inputFrm" name="inputFrm">
			<input type="hidden" id="planCode" name="planCode" value="planCode">
			<table class="table">
				<tbody>
					<tr>
						<th>계획일자<span style="color: red">*</span></th>
						<td><input type="date" id="planDate" name="planDate" required></td>
					</tr>
					<tr>
						<th>생산계획명<span style="color: red">*</span></th>
						<td><input type="text" id="planName" name="planName" required></td>
					</tr>
					<tr>
						<th>특기사항</th>
						<td><input type="text" id="comments" name="comments"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div class="mb-2 col-lg-6">
		<div>
			<h5>미완료주문 검색</h5>
		</div>
		<div>
			<form id="dateFrm" name="dateFrm">
				<span>납기일자 </span><input type="date" id="planDtS" name="planDtS">
				<span>&nbsp;~&nbsp;</span><input type="date" id="planDtE" name="planDtE">&nbsp;
				<button type="button" class="btn btn-primary" id="btnRead">불러오기</button>
			</form>
		</div>
	</div>
</div>
<div class="mb-4" align="right">
	<button type="button" class="btn btn-primary" id="btnGridAdd">추가</button>
	<button type="button" class="btn btn-primary" id="btnGridDel">삭제</button>
</div>
<div class="col-lg-12">
	<div id="grid"/>
</div>
<br><br><br><br>
<div>
	<form>
		<div class="table">
			<table class="table">
				<tbody>
					<tr>
						<th>제품코드</th>
						<td><input type="text" id="productCode" name="productCode" readonly="true"></td>
						<th>제품명</th>
						<td><input type="text" id="productName" name="productName" readonly="true"></td>
						<th>작업량</th>
						<td><input type="text" id="workCount" name="workCount" readonly="true"></td>
						<th>소요량</th>
						<td><input type="text" id="totalCount" name="totalCount" readonly="true"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</div>
<div>
	<div id="gridInput"/>
</div>

<script type="text/javascript" src="js/app/prod/managePlan.js"></script>