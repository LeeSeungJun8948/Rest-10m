<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1 class="h3 mb-4 text-gray-700">생산계획 관리</h1>
<div class="mb-4">
	<button type="button" class="btn btn-primary">조회</button>
	<button type="button" class="btn btn-primary">새자료</button>
	<button type="button" class="btn btn-primary">저장</button>
	<button type="button" class="btn btn-primary">삭제</button>
</div>
<div class="row">
	<div class="mb-2 col-lg-6">
		<table class="table">
			<tbody>
				<tr>
					<th>계획일자</th>
					<td><input type="date"></td>
				</tr>
				<tr>
					<th>생산계획명</th>
					<td><input type="text"></td>
				</tr>
				<tr>
					<th>특기사항</th>
					<td><input type="text"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="mb-4 col-lg-6">
		<div>
			<h5>미생산 검색</h5>
		</div>
		<div>
			<span>납기일자</span> <input type="date"> <span>~</span> <input
				type="date">
			<button type="button" class="btn btn-primary">미생산 읽기</button>
		</div>
	</div>
</div>
<div class="mb-4">
	<button type="button" class="btn btn-primary">추가</button>
	<button type="button" class="btn btn-primary">삭제</button>
</div>
<div class="col-lg-10">
	<div id="grid">
		<script type="text/javascript">
			const grid = new tui.Grid({
				el : document.getElementById('grid'),
				scrollX : false,
				scrollY : false,
				rowHeaders: ['checkbox'],
				columns : [ {
					header : '제품코드',
					name : 'productCode'
				}, {
					header : '제품명',
					name : 'productName'
				}, {
					header : '주문관리번호',
					name : 'orderNo'
				}, {
					header : '납기일자',
					name : 'outDate'
				}, {
					header : '주문량',
					name : 'orderCount'
				}, {
					header : '기계획량',
					name : 'projectPlanned'
				}, {
					header : '미계획량',
					name : 'projectUnplanned'
				}, {
					header : '작업량',
					name : 'toWork'
				}, {
					header : '일생산량',
					name : 'dayCount'
				}, {
					header : '생산일수',
					name : 'workingDay'
				}, {
					header : '작업일자',
					name : 'workDate'
				}, {
					header : '비고',
					name : 'detail'
				}, ]
			});
		</script>
	</div>
</div>