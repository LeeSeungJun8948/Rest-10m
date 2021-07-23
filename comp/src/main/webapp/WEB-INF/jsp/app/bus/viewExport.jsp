<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="h3 mb-4 text-gray-700">출고 조회</h1>
<form id="searchFrm" name="searchFrm" method="post" action="exportExcel.do">
	<div class="mb-4" align="right">
		<button type="button" class="btn-two blue small" id="btnSearch">조회</button>
		<input type="submit" class="btn-two blue small" id="btnExcel" value="Excel">
		<button type="reset" class="btn-two blue small" id="btnReset">초기화</button>
	</div>
	<div class="row">
		<div class="mb-2 col-lg-6">
			<form id="dataForm" name="dataForm">
				<table class="table">
					<tbody>
						<tr>
						<th>출고일자</th>
						<td>
							<div class="form-inline form-group">
								<input type="date" class="form-control mr-4" id="searchDtS"	name="searchDtS">
								<span>~</span>
								<input type="date" class="form-control ml-4" id="searchDtE"	name="searchDtE">
							</div>
						</td>
					</tr>
						<tr>
							<th>업체명</th>
							<td>
								<div class="form-inline form-group">
										<input class="form-control" type="text" id="companyCode"
											name="companyCode" data-remote="false" data-toggle="modal"
										data-target="#compModal" >
									<button id="btnCompModal" type="button" class="btn btn-toggle"
										data-remote="false" data-toggle="modal"
										data-target="#compModal">
										<img alt="btn_search"
											src="<c:url value='/images/app/all/btn_search.png'/>">
									</button>
										<input class="form-control" type="text" id="companyName"
											name="companyName" data-remote="false" data-toggle="modal"
										data-target="#compModal">
								</div>
							</td>
						</tr>
						<tr>
							<th>제품명</th>
							<td>
								<div class="form-inline form-group">
										<input class="form-control" type="text" id="productCode"
											name="productCode" data-remote="false" data-toggle="modal"
										data-target="#prodModal">
									<button id="btnProdModal" type="button" class="btn btn-toggle"
										data-remote="false" data-toggle="modal"
										data-target="#prodModal">
										<img alt="btn_search"
											src="<c:url value='/images/app/all/btn_search.png'/>">
									</button>
										<input class="form-control" type="text" id="productName"
											name="productName" data-remote="false" data-toggle="modal"
										data-target="#prodModal">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</form>
<div class="col-lg-12">
	<div id="grid"></div>
</div>
<div class="modal fade" id="compModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="compContent" align="center"></div>
	</div>
</div>
<div class="modal fade" id="prodModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="prodContent" align="center"></div>
	</div>
</div>

<link
	href="${pageContext.request.contextPath}/css/app/prod/viewWork.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/app/bus/viewExport.js"></script>