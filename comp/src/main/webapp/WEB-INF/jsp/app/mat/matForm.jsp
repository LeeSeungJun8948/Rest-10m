<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<h1 class="h3 mb-4 mt-4 text-gray-700">자재정보관리</h1>
	<div class="mb-4" align="right">
		<button class="btn btn-primary" id="btnNew" type="button"> 새 자재 </button>
		<button class="btn btn-primary" id="btnSave" type="button"> 저장 </button>
		<button class="btn btn-primary" id="btnDel" type="button"> 삭제 </button>
	</div>
		
	<div class="row">				
		<div id="matList" class="col-4">
		</div>
		
		<div class="col-8 input-group input-group-sm">
			<form id="frm" class="form-inline" role="form">
				<div class="row">
					<div class="input-group-prepend col-lg-3">
						<span class="input-group-text" id="inputGroup-sizing-sm">자재코드</span>
						<input id="materialCode" name="materialCode" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
					</div>
					<div class="input-group-prepend col-lg-6" >
						<span class="input-group-text" id="inputGroup-sizing-sm">자재명</span>
						<input id="materialName" name="materialName" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
					</div>
					<div class="input-group-prepend col-lg-3">
						<span class="input-group-text" id="inputGroup-sizing-sm">자재구분</span>
						<input id="matNm" name="matNm" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
					</div>
					
					<div class="col-12 mb-3"></div>
					
					<div class="input-group-prepend col-lg-3" >
						<span class="input-group-text" id="inputGroup-sizing-sm">입고업체</span>
						<input id="companyCode" name="companyCode" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
					</div>
					<div class="input-group-prepend col-lg-6" >
						<span class="input-group-text" id="inputGroup-sizing-sm">업체명</span>
						<input id="companyName" name="companyName" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
					</div>
					<div class="input-group-prepend col-lg-3">
						<span class="input-group-text" id="inputGroup-sizing-sm">관리단위</span>
						<input id="unitNo" name="unitNo" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
					</div>
					
					<div class="col-12 mb-3"></div>
					
						<div class="input-group-prepend col-lg-3" >
						<span class="input-group-text" id="inputGroup-sizing-sm">안전재고</span>
						<input id="saveStock" name="saveStock" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
					</div>
					<div class="input-group-prepend col-lg-3" >
						<span class="input-group-text" id="inputGroup-sizing-sm">MIN재고</span>
						<input id="minStock" name="minStock" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
					</div>
					<div class="input-group-prepend col-lg-3">
						<span class="input-group-text" id="inputGroup-sizing-sm">MAX재고</span>
						<input id="maxStock" name="maxStock" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
					</div>
						<div class="input-group-prepend col-lg-3">
						<span class="input-group-text" id="inputGroup-sizing-sm">1M소요량</span>
						<input id="monthStock" name="monthStock" type="text" class="form-control w-50" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
					</div>
				</div>
			</form>
		</div>
	</div>
<script type="text/javascript" src="js/app/mat/matForm.js"></script>
