	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.tui-grid-summary-area .tui-grid-cell {
    text-align: right;
}
#materialCode{
	background-color: #FFFFFF;
}
.blackText{
	color: #000000;
	background-color: #F4F4F4;
}
</style>
<div class="row">
	<div class="col-md-8">
		<h1 class="h3 mb-4 text-gray-700">자재재고조정 전표 조회</h1>
	</div>
</div>
	<div align="right">
		<form id="frmExcel" name="frmExcel" action="${pageContext.request.contextPath}/mat/view/matAdjustExcel.do" method="post">
			<button type="button" class="btn-two blue small" id="btnExcel">엑셀</button>
			<input type="hidden" id="param" name="param">
			<button type="button" class="btn-two blue small" id="btnRead">조회</button>
		</form>
	</div>

<form id="searchFrm" name="searchFrm">
	<div class="row">
		<div class="mb-2 col-lg-6">
			<table class="table">
				<tbody>
					<tr>
						<th>정산일자<span style="color: red">*</span></th>
						<td>
							<div class="row">
								<div class="col-md-5">
									<input type="date" class="form-control" id="startDate" name="startDate">
								</div>
								~ 
								<div class="col-md-5">
									<input type="date" class="form-control" id="endDate" name="endDate">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>정산자재</th>
						<td>
							<div class="row">
								<div class="col-md-4">
									<input readonly class="form-control" type="text" id="materialCode" name="materialCode">
								</div>
								<button id="btnMatModal" type="button" class="btn btn-toggle" data-remote="false" data-toggle="modal" data-target="#matModal">
										<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
								</button>	
								<div class="col-md-6">					
									<input readonly class="form-control" type="text" id="materialName" name="materialName">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>구분</th>
						<td>
							<div class="row ml-4">
								<div class="col-md-2">
									<input class="form-check-input" type="radio" name="inoutNo" value="" id="inoutNoAll" checked>
									<label class="form-check-label" for="inoutNoAll">전체</label>
								</div> 
								<div class="col-md-2">
									<input class="form-check-input" type="radio" name="inoutNo" value="03" id="inoutNo03">
									<label class="form-check-label" for="inoutNo03">정산입고</label>
								</div> 
								<div class="col-md-2" align="right">
									<input class="form-check-input" type="radio" name="inoutNo" value="04" id="inoutNo04">
									<label class="form-check-label" for="inoutNo04">정산출고</label>
								</div>
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
<div class="mb-4" align="right">
</div>
<div class="col-lg-12">
		<div id="adjustGrid"></div>
</div>

<div class="modal fade" id="matModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="matContent" align="center">
		</div>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/mat/matAdjustList.js"></script>	