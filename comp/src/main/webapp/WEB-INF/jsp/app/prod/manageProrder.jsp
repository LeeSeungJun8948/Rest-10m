<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="h3 mb-4 text-gray-700">생산지시 관리</h1>
<div class="mb-4" align="right">
	<button id="btnProrModal" type="button" class="btn btn-primary" data-remote="false" data-toggle="modal" data-target="#prorModal">조회</button>
	<button type="reset" class="btn btn-primary" id="btnReset">초기화</button>
	<button type="button" class="btn btn-primary" id="btnSave">저장</button>
	<button type="button" class="btn btn-primary" id="btnDel">삭제</button>
</div>
<div class="row">
	<div class="mb-2 col-lg-6">
		<form id="inputFrm" name="inputFrm">
			<input type="hidden" id="prorCode" name="prorCode" value="prorCode">
			<table class="table">
				<tbody>
					<tr>
						<th>지시일자<span style="color: red">*</span></th>
						<td><input type="date" class="form-control" id="prorDate" name="prorDate" required></td>
					</tr>
					<tr>
						<th>생산지시명<span style="color: red">*</span></th>
						<td><input type="text" class="form-control" id="prorName" name="prorName" required></td>
					</tr>
					<tr>
						<th>특기사항</th>
						<td><input type="text" class="form-control" id="comments" name="comments"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div class="mb-2 col-lg-6">
		<div class="mb-4">
			<h5><strong>미지시계획 검색</strong></h5>
		</div>
		<div>
			<form id="dateFrm" name="dateFrm">
				<div class="form-row">
					<div class="col-2" align="center">
						<span>작업일자</span>
					</div>
					<div class="col-3">
						<input type="date" class="form-control" id="prorderDtS" name="prorderDtS">
					</div>
					<div class="col-1" align="center">
						<span>~</span>
					</div>
					<div class="col-3">
						<input type="date" class="form-control" id="prorderDtE" name="prorderDtE">
					</div>
					<div class="col-2">
						<button type="button" class="btn btn-primary" id="btnRead">불러오기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="mb-4" align="right">
	<button type="button" class="btn btn-primary" id="btnGridAdd">추가</button>
	<button type="button" class="btn btn-primary" id="btnGridDel">삭제</button>
</div>
<div class="col-lg-12">
	<div id="grid"></div>
</div>
<br><br><br><br>
<div>
	<form>
		<div class="table">
			<table class="table">
				<tbody>
					<tr>
						<th>제품코드</th>
						<td><input type="text" class="form-control" id="productCode" name="productCode" readonly="true"></td>
						<th>제품명</th>
						<td><input type="text" class="form-control" id="productName" name="productName" readonly="true"></td>
						<th>작업량</th>
						<td><input type="text" class="form-control" id="workCount" name="workCount" readonly="true"></td>
						<th>총 투입량</th>
						<td><input type="text" class="form-control" id="totalCount" name="totalCount" readonly="true"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</div>
<div>
	<div id="gridInput"></div>
</div>
<div class="modal fade" id="prorModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content" id="prorContent" align="center">
		</div>
	</div>
</div>

<link href="${pageContext.request.contextPath}/css/app/prod/prod.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/prod/manageProrder.js"></script>