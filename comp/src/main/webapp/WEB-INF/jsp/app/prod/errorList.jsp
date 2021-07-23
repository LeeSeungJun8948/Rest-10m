<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form id="frm" name="frm" method="post" action="viewErrorExcel.do">
	<div class="row">
		<div class="col-md-8">
			<h1 class="h3 mb-4 text-gray-700">불량 내역 조회</h1>
		</div>
		<div class="col-md-4 mb-4" align="right" role="form">
			<button type="button" class="btn-two blue small" id="btnRead">조회</button>
			<input type="submit" class="btn-two blue small" id="btnExcel" value="엑셀">
		</div>
	</div>
	<div class="row">
		<div class="mb-2 col-md-6">
			<table class="table">
				<tbody>
					<tr>
						<th>작업일자</th>
						<td>
							<div class="row">
								<input type="date" class="form-control" id="startDate" name="startDate">
								<span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
								<input type="date" class="form-control" id="endDate" name="endDate">
							</div>
						</td>
					</tr>
					<tr>
						<th>제품코드</th>
						<td>
							<div class="row">
								<input type="hidden" id="productCode" name="productCode" />
								<input type="text" class="form-control" id="productName" name="productName" maxlength="20" readonly="true" />
								<button id="btnProdModal" type="button" class="btn btn-toggle" data-remote="false" data-toggle="modal" data-target="#prodModal">
									<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
								</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="mb-4 col-lg-6">
		</div>
	</div>
</form>

<div class="col-lg-12">
	<div id="errorGrid"></div>
</div>

<div class="modal fade" id="prodModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="prodContent" align="center"></div>
	</div>
</div>
<link href="${pageContext.request.contextPath}/css/app/prod/viewWork.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/prod/errorList.js"></script>