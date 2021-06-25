<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1 class="h3 mb-4 text-gray-700">생산계획 관리</h1>
<div class="mb-4">
	<button class="btn btn-primary">조회</button>
	<button class="btn btn-primary">새자료</button>
	<button class="btn btn-primary">저장</button>
	<button class="btn btn-primary">삭제</button>
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
			<span>납기일자</span> <input type="date">
			<span>~</span> <input type="date">
			<button type="button">미생산 읽기</button>
		</div>
	</div>
</div>
<div class="mb-4">
	<button type="button">추가</button>
	<button type="button">삭제</button>
</div>
<div class="col-lg-10">
	<table class="table">
		<thead>
			<tr>
				<th><input type="checkbox"></th>
				<th>제품코드</th>
				<th>제품명</th>
				<th>규격</th>
				<th>주문서관리번호</th>
				<th>납기일자</th>
				<th>주문량</th>
				<th>기계획량</th>
				<th>미계획량</th>
				<th>작업량</th>
				<th>일생산량</th>
				<th>생산일수</th>
				<th>작업일자</th>
				<th>비고</th>
			</tr>
		</thead>
	</table>
</div>