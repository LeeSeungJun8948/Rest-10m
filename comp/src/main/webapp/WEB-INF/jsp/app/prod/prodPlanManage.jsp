<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산계획 조회</title>
</head>
<body>
	<div class="container">
		<div class="container">
			<div>
				<h1>생산계획 관리</h1>
			</div>
			<br>
			<form autocomplete="off">
				<div class="gird-option-area">
					<div class="col-6">
						<table class="table table-bbs table-write" summary>
							<tbody>
								<tr>
									<th>계획일자</th>
									<td><input type="Date"></td>
								</tr>
								<tr>
									<th>생산계획명</th>
									<td><input></td>
								</tr>
								<tr>
									<th>특기사항</th>
									<td><input></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col 5 border" style="width: 400px;">
						<div class="gird-option-area mt-1">
							<ul>
								<li>미생산 검색</li>
								<li class="mt-1 grid-option-area">
									<div>
										<label>납기일자</label>
										<div>
											<input type="date">
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</form>
		</div>
		<br> <br>
		<div class="flex row">
			<div class="col-10f">
				<table class="tui-gird-table">
					<tr>
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
						<th>작업일자</th>
						<th>비고</th>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>