<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3 class="mb-4 text-gray-700">생산계획 관리</h3>
<div class="mb-4" align="right">
	<button id="btnPlanModal" type="button" class="btn-two blue small" data-remote="false" data-toggle="modal" data-target="#planModal">조회</button>
	<button type="reset" class="btn-two blue small" id="btnReset">초기화</button>
	<button type="button" class="btn-two blue small" id="btnSave">저장</button>
	<button type="button" class="btn-two blue small" id="btnDel">삭제</button>
</div>
<div class="row">
	<div class="mb-2 col-lg-6">
		<form id="inputFrm" name="inputFrm">
			<input type="hidden" id="planCode" name="planCode" value="planCode">
			<table class="table">
				<tbody>
					<tr>
						<th>계획일자<span style="color: red">*</span></th>
						<td><input type="date" class="form-control" id="planDate" name="planDate" required></td>
					</tr>
					<tr>
						<th>생산계획명<span style="color: red">*</span></th>
						<td><input type="text" class="form-control" id="planName" name="planName" required></td>
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
			<h5><strong>미계획주문 검색</strong></h5>
		</div>
		<div>
			<form id="dateFrm" name="dateFrm">
				<div class="form-inline form-group">
					<span>납기일자</span>
					<input type="date" class="form-control ml-4 mr-2" id="planDtS" name="planDtS">
					<span>~</span>
					<input type="date" class="form-control ml-2 mr-4" id="planDtE" name="planDtE">
					<button type="button" class="btn-two blue small" id="btnRead">불러오기</button>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="mb-4" align="right">
	<button type="button" class="btn-two blue small" id="btnGridAdd">추가</button>
	<button type="button" class="btn-two blue small" id="btnGridDel">삭제</button>
</div>
<div class="col-lg-12">
	<div id="grid"></div>
</div>
<div class="modal fade" id="planModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content" id="planContent" align="center">
		</div>
	</div>
</div>

<link href="${pageContext.request.contextPath}/css/app/prod/prod.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/prod/managePlan.js"></script>