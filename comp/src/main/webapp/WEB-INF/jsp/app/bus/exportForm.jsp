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
		<input type="hidden" id="exportCode" name="exportCode" value="exportCode">
			<table class="table">
				<tbody>
					<tr>
						<th>주문일자*</th>
						<td>
							<div class="row">
								<div class="col-md-5">
									<input type="date" class="form-control" id="fromDate"
										name="fromDate">
								</div>
								~
								<div class="col-md-5">
									<input type="date" class="form-control" id="toDate"
										name="toDate">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>고객사</th>
						<td><input type="text" id="companyCode" name="companyCode" />
							<button id="btnCompModal" type="button" class="btn btn-toggle"
								data-remote="false" data-toggle="modal" data-target="#compModal">
								<img alt="btn_search"
									src="<c:url value='/images/app/all/btn_search.png'/>">
							</button> <input type="text" id="companyName" name="companyName"
							readonly="true" /></td>
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
				<span>납기일자 </span> <input type="date" id="fromDate" name="fromDate"
					value=${outDate }> <span> ~ </span> <input type="date"
					id="toDate" name="toDate" value=${outDate }>&nbsp;
				<button id="btnunExportModal" type="button" class="btn btn-primary"
					data-remote="false" data-toggle="modal"
					data-target="#unExportModal">미출고 읽기</button>
			</form>
		</div>
	</div>
</div>
<div class="mb-4" align="right">
	<button type="button" class="btn btn-primary" id="btnGridAdd">추가</button>
	<button type="button" class="btn btn-primary" id="btnGridDel">삭제</button>
</div>
<div class="col-lg-12">
	<div id="grid" />
</div>

<div class="modal fade" id="compModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="compContent" align="center"></div>
	</div>
</div>
<div class="modal fade" id="unExportModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content" id="unExportContent" align="center">
		</div>
	</div>
</div>

<script type="text/javascript" src="js/app/bus/exportForm.js"></script>