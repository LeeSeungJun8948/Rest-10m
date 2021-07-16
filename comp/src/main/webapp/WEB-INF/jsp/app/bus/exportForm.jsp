<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="h3 mb-4 text-gray-700">출고관리</h1>
<div class="mb-4" align="right">
	<button id="btnExportModal" type="button" class="btn btn-primary"
		data-remote="false" data-toggle="modal" data-target="#exportModal">조회</button>
	<button type="reset" class="btn btn-primary" id="btnReset">새자료</button>
	<button type="button" class="btn btn-primary" id="btnSave">저장</button>
	<button type="button" class="btn btn-primary" id="btnDel">삭제</button>
</div>
<div class="row">
	<div class="mb-2 col-lg-6">
		<form id="inputFrm" name="inputFrm">
			<input type="hidden" value="exportCode" id="exportCode"
				name="exportCode">
			<table class="table">
				<tbody>
					<tr>
						<th>출고일자</th>
						<td>
							<div class="row">
								<div class="col-md-5">
									<input type="date" class="form-control" id="exportDate"
										name="exportDate">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>업체명</th>
						<td>
							<div class="row">
								<div class="col-md-4">
									<input class="form-control" type="text"
										id="companyCode" name="companyCode"data-remote="false" data-toggle="modal"
									data-target="#compModal">
								</div>
								<button id="btnCompModal" type="button" class="btn btn-toggle"
									data-remote="false" data-toggle="modal"
									data-target="#compModal">
									<img alt="btn_search"
										src="<c:url value='/images/app/all/btn_search.png'/>">
								</button>
								<div class="col-md-6">
									<input class="form-control" type="text"
										id="companyName" name="companyName"data-remote="false" data-toggle="modal"
									data-target="#compModal">
								</div>
							</div>
						</td>
					</tr>

						<th>특기사항</th>
						<td><input class="form-control" type="text" id="comments" name="comments"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div class="mb-2 col-lg-6">
		<div class="mb-4">
			<h5><strong>미출고 주문 검색</strong></h5>
		</div>
		<div>
			<form id="dateFrm" name="dateFrm">
				<div class="form-row">
					<div class="col-2" align="center">
						<span>납기일자</span>
					</div>
					<div class="col-3">
						<input type="date" class="form-control" id="fromDate" name="fromDate">
					</div>
					<div class="col-1" align="center">
						<span>~&nbsp;&nbsp;</span>
					</div>
					<div class="col-3">
						<input type="date" class="form-control" id="toDate" name="toDate">
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
	<button type="button" class="btn btn-primary" id="btnGridDel">삭제</button>
</div>
<div class="col-lg-12">
	<div id="grid"></div>
</div>
<div>
	<form>
		<div class="table">
			<table class="table">
				<tbody>
					<tr>
						<th>제품코드</th>
						<td><input type="text" class="form-control" id="productCode"
							name="productCode" readonly="true"></td>
						<th>제품명</th>
						<td><input type="text" class="form-control" id="productName"
							name="productName" readonly="true"></td>
						<th>출고량</th>
						<td><input type="text" class="form-control" id="exportCount"
							name="exportCount" readonly="true"></td>
						<th>총 출고량</th>
						<td><input type="text" class="form-control" id="totalCount"
							name="totalCount" readonly="true"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</div>
<div>
	<div id="gridInput" />
</div>
<div class="modal fade" id="compModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="compContent" align="center"></div>
	</div>
</div>

<div class="modal fade" id="exportModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content" id="ExportContent" align="center">
		</div>
	</div>
</div>

<link href="${pageContext.request.contextPath}/css/app/prod/prod.css"
	rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/bus/exportForm.js"></script>