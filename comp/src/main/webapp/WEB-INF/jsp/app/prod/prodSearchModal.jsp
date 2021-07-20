<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div id="modalContent">
	<div class="modal-header">
		<h5 class="modal-title">제품 검색</h5>
		<button id="btnCloseTop" type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	
	<div class="modal-body">
		<form id="frmProdModal" name="frmProdModal">
			<div class="row">
				<div class="col-md-4 mr-0 ml-3">
					<select class="custom-select" name="searchCondition">
						<option value="product_code" selected>제품코드</option>
						<option value="product_name">제품명</option>
					</select>
				</div>
				<div class="col-md-5">
					<input id="keyword" name="keyword" type="text" class="form-control">
				</div>
				<div class="col=md-1">
					<button type="button" class="btn-two blue small" id="btnReadModal">검색</button>
				</div>
			</div>
		</form>
	
		<div class="col-md-11 m-3">
			<div id="prodGrid"></div>
		</div>
	</div>
		
	<div class="modal-footer">
		<button id="btnSelect" class="btn-two cyan small">선택</button>
		<button id="btnCloseBottom" class="btn-two blue small" data-dismiss="modal">닫기</button>
	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/prod/prodSearchModal.js"></script>
</div>