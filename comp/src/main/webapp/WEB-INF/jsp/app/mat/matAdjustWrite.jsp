<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.tui-grid-summary-area .tui-grid-cell {
    text-align: right;
}
#processCode, #materialCode{
	background-color: #FFFFFF;
}

.red{	
	b-ac-kgro-und-color: #FFD2D2;
}

.blackText{
	color: #000000;
	background-color: #F4F4F4;
}
</style>
<div class="row">
	<div class="col-md-8">
		<h3 class="h3 mb-4 text-gray-700">자재재고조정 전표작성</h3>
	</div>
</div>

<form id="searchFrm" name="searchFrm">
	<div class="row">
		<div class="mb-2 col-md-5">
			<table class="table">
				<tbody>
					<tr>
						<th>자재</th>
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
						<!-- 
						<th>미정산일자</th>
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
						 -->
						<td>
							<div class="form-check mt-1">
								<input class="form-check-input" type="checkbox" id="ckExceptZeroStock" name="ckExceptZeroStock" value="true">
								<label class="form-check-label" for="ckExceptZeroStock"> 재고0 제외 </label>
								
								<input hidden id="exceptZeroStock" name="exceptZeroStock" type="text">
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-md-2"></div>
		<div class="col-md-3 mb-4" align="right" role="form">
			<button type="button" class="btn-two blue small" id="btnRead">재고조회</button>
			<button type="button" class="btn-two small blue" id="btnWrite">선택작성</button>
		</div>
	</div>
</form>
<div class="col-md-10 mb-2" align="center">
	<div id="stockGrid"></div>
</div>


<div class="mb-4" align="right">
	<button type="button" class="btn-two small blue" id="btnGridDel">삭제</button>
	<button type="button" class="btn-two blue small" id="btnSave">저장</button>
</div>

<div class="col-md-12">
		<div id="adjustGrid"></div>
</div>

<div class="modal fade" id="matModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="matContent" align="center">
		</div> 
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/mat/matAdjustWrite.js"></script>
