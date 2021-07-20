<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#companyCode, .white{
	background-color: #FFFFFF;
}
#companyName{
	background-color: #EAEAEA;	
}
</style>
<div class="row">
	<div class="col-md-8">
		<h1 class="h3 mb-4 mt-4 text-gray-700">자재정보관리</h1>
	</div>
	<div class="col-md-4 mb-4" align="right">
		<button class="btn-two blue small" id="btnNew" type="button"> 새 자재 </button>
		<button class="btn-two blue small" id="btnSave" type="button"> 저장 </button>
		<button class="btn-two blue small" id="btnDel" type="button"> 삭제 </button>
	</div>
</div>	
	<div class="row">				
		<div id="matList" class="col-4">
		</div>
		
		<div class="col-8 input-group input-group-sm align-self-start mt-4">
			<form id="frm" class="form-inline" role="form">
				<div class="row">
					<div class="input-group-prepend col-lg-3">
						<span class="input-group-text" >자재코드</span>
						<input readonly="readonly" id="materialCode" name="materialCode" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
					</div>
					<div class="input-group-prepend col-lg-6" >
						<span class="input-group-text" >자재명</span>
						<input id="materialName" name="materialName" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
					</div>
					<div class="input-group-prepend col-lg-3">
						<span class="input-group-text" >자재구분</span>
						<select name="matNo" id="matNo" class="form-control">
							<c:forEach var="mat" items="${mats}">
								<option value="${mat.matNo}">${mat.matNm}</option>
							</c:forEach>
						</select>
					</div>
					
					<div class="col-12 mb-3"></div>
					
					<div class="input-group-prepend col-lg-3" >
						<span class="input-group-text" >입고업체</span>
						<input readonly='readonly' id="companyCode" name="companyCode" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
						<button id="btnCompModal" type="button" class="btn btn-toggle" data-remote="false" data-toggle="modal" data-target="#compModal">
							<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
						</button>	
					</div>
					<div class="input-group-prepend col-lg-6" >
						<span class="input-group-text" >업체명</span>
						<input readonly='readonly' id="companyName" name="companyName" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
					</div>
					<div class="input-group-prepend col-lg-3">
						<span class="input-group-text" >관리단위</span>
						<select name="unitNo" id="unitNo"  class="form-control">
							<c:forEach var="unit" items="${units}">
								<option value="${unit.unitNo}">${unit.unitNm}</option>
							</c:forEach>
						</select>
					</div>
					
					<div class="col-12 mb-3"></div>
					
						<div class="input-group-prepend col-lg-3" >
						<span class="input-group-text" >안전재고</span>
						<input id="saveStock" name="saveStock" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
					</div>
					<div class="input-group-prepend col-lg-3" >
						<span class="input-group-text" >MIN재고</span>
						<input id="minStock" name="minStock" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
					</div>
					<div class="input-group-prepend col-lg-3">
						<span class="input-group-text" >MAX재고</span>
						<input id="maxStock" name="maxStock" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
					</div>
						<div class="input-group-prepend col-lg-3">
						<span class="input-group-text" >1M소요량</span>
						<input id="monthStock" name="monthStock" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
					</div>
				</div>
			</form>
		</div>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/mat/matForm.js"></script>