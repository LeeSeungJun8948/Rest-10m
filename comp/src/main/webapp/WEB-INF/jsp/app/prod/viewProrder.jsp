<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="h3 mb-4 text-gray-700">생산지시 조회</h1>
<form id="searchFrm" name="searchFrm" method="post" action="viewProrExcel.do">
	<div class="mb-4" align="right">
		<button type="button" class="btn-two blue small" id="btnSearch">조회</button>
		<input type="submit" class="btn-two blue small" id="btnExcel" value="엑셀">
		<button type="reset" class="btn-two blue small" id="btnReset">초기화</button>
	</div>
	<div class="row">	
		<div class="mb-2 col-lg-12">
			<table class="table">
				<tbody>
					<tr>
						<th>지시일자<span style="color: red">*</span></th>
						<td>
							<div class="row">
								<input type="date" class="form-control" id="searchDtS" name="searchDtS">
								<span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
								<input type="date" class="form-control" id="searchDtE" name="searchDtE">
							</div>
						</td>
					</tr>
					<tr>
						<th>고객사</th>
						<td>
							<div class="row">
								<input type="hidden" id="companyCode" name="companyCode" />
								<input type="text" class="form-control" id="companyName" name="companyName" readonly="true" />
								<button id="btnCompModal" type="button" class="btn btn-toggle" data-remote="false" data-toggle="modal" data-target="#compModal">
									<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
								</button> 
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
<link href="${pageContext.request.contextPath}/css/app/prod/viewWork.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/prod/viewProrder.js"></script>