<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="h3 mb-4 text-gray-700">생산계획 관리</h1>
<form>
	<div class="mb-4" align="right">
		<button type="button" class="btn btn-primary" id="btnView">조회</button>
		<button type="reset" class="btn btn-primary" id="btnReset">초기화</button>	
		<button type="button" class="btn btn-primary" id="btnSave">저장</button>
		<button type="button" class="btn btn-primary" id="btnDel">삭제</button>
</div>
	<div class="row">
		<div class="mb-2 col-lg-6">
			<table class="table">
				<tbody>
					<tr>
						<th>계획일자</th>
						<td><input type="date" id="planDate"></td>
					</tr>
					<tr>
						<th>생산계획명</th>
						<td><input type="text" id="planName"></td>
					</tr>
					<tr>
						<th>특기사항</th>
						<td><input type="text" id="planDetail"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="mb-4 col-lg-6">
			<div>
				<h5>미생산 검색</h5>
			</div>
			<div>
				<span>납기일자 </span><input type="date" id="planDtS">
				<span> ~ </span><input type="date" id="planDtE">&nbsp;
				<button type="button" class="btn btn-primary" id="btnRead">미생산 읽기</button>
			</div>
		</div>
	</div>
	<div class="mb-4" align="right">
		<button type="button" class="btn btn-primary" id="btnGridAdd">추가</button>
		<button type="button" class="btn btn-primary" id="btnGridDel">삭제</button>
	</div>
	<div class="col-lg-10">
		<div id="grid">
		</div>
	</div>
</form>
<script type="text/javascript" src="js/app/prod/prodPlanManage.js"></script>
