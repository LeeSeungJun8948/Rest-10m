<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="h3 mb-4 text-gray-700">출고관리</h1>
<div class="mb-4" align="right">
	<button type="button" class="btn btn-primary" id="btnView">조회</button>
	<button type="reset" class="btn btn-primary" id="btnReset">새자료</button>
	<button type="button" class="btn btn-primary" id="btnSave">저장</button>
	<button type="button" class="btn btn-primary" id="btnDel">삭제</button>
</div>
<div class="row">
	<div class="mb-2 col-lg-6">
		<form id="inputFrm" name="inputFrm">
			<input type="hidden" value="${'idx' }" id="idx" name="idx"> <input
				type="hidden" value="${'planCode' }" id="planCode" name="planCode">
			<table class="table">
				<tbody>
					<tr>
						<th>출고일자</th>
						<td><input type="date" id="outDate" name="outDate"></td>
						<th>출고번호</th>
						<td><input type="date" id="Lot" name="Lot"></td>
					</tr>
					<tr>
						<th>고객사</th>
						<td><input type="text" id="compCode" name="compCode"></td>
						<th>고객사명</th>
						<td><input type="text" id="compName" name="compName"></td>
					</tr>
					<tr>
						<th>특기사항</th>
						<td><input type="text" id="comments" name="comments"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div class="mb-4 col-lg-6">
		<div>
			<h5>검색자료관리</h5>
		</div>
		<div>
			<form id="dateForm" name="dateForm">
				<span>납기일자 </span><input type="date" id="planDtS" name="planDtS"value=${outDate }>
				<span> ~ </span><input type="date" id="planDtE" name="planDtE"value=${outDate }>&nbsp;
				<button type="button" class="btn btn-primary" id="btnRead">미출고
					읽기</button>
			</form>
		</div>
	</div>
</div>
<div class="mb-4" align="right">
	<button type="button" class="btn btn-primary" id="btnGridAdd">추가</button>
	<button type="button" class="btn btn-primary" id="btnGridDel">삭제</button>
</div>
<div class="col-lg-10">

	<div id="grid" />

</div>
<script type="text/javascript" src="js/app/bus/exportForm.js"></script>