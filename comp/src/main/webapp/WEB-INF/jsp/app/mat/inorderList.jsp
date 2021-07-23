<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.tui-grid-summary-area .tui-grid-cell {
    text-align: right;
}
#companyCode, #materialCode{
	background-color: #FFFFFF;
}



</style>

<div class="row">
	<div class="col-md-8">
		<h1 class="h3 mb-4 text-gray-700">발주 조회</h1>
	</div>
</div>
	<div align="right" role="form">
		<form id="frmExcel" name="frmExcel" action="${pageContext.request.contextPath}/mat/view/inorderExcel.do" method="post">
			<button type="button" class="btn-two blue small" id="btnExcel">Excel</button>
			<input type="hidden" id="param" name="param">
			<button type="button" class="btn-two blue small" id="btnRead">조회</button>
		</form>
	</div>

<form id="frm" name="frm">
	<div class="row">
		<div class="mb-2 col-md-6">
			<table class="table">
				<tbody>
					<tr>
						<th>발주일자</th>
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
						<th>발주자재</th>
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
						<th>발주업체</th>
						<td>
							<div class="row">
								<div class="col-md-4">
									<input readonly class="form-control" type="text" id="companyCode" name="companyCode">
								</div>
								<button id="btnCompModal" type="button" class="btn btn-toggle" data-remote="false" data-toggle="modal" data-target="#compModal">
										<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
								</button>	
								<div class="col-md-6">					
									<input readonly class="form-control" type="text" id="companyName" name="companyName">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>정렬구분</th>
						<td> 
							<div class="row ml-4">
								<div class="col-md-2">
									<input class="form-check-input" type="radio" name="sort" value="inorder_date" id="inorder_date" checked>
									<label class="form-check-label" for="inorder_date">일자</label>
								</div>
								<div class="col-md-2">
									<input class="form-check-input" type="radio" name="sort" value="company_code" id="company_code">
									<label class="form-check-label" for="company_code">업체</label>
								</div>
								<div class="col-md-2">
									<input class="form-check-input" type="radio" name="sort" value="material_code" id="material_code">
									<label class="form-check-label" for="material_code">자재</label>
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

<div class="col-lg-12">
	<div id="inorderList"></div>
</div>

<div class="modal fade" id="matModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="matContent" align="center">
		</div>
	</div>
</div>

<div class="modal fade" id="compModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="compContent" align="center">
		</div>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/mat/inorderList.js"></script>
